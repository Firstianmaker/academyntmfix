<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Otp;
use App\Services\WhatsAppService;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Session;
use Carbon\Carbon;
use App\Models\Talent;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        \Log::info('Registration attempt started', [
            'data' => $request->all(),
            'ip' => $request->ip()
        ]);

        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6',
            'number_phone' => 'required|string|max:20',
            'role' => 'required|in:client,model',
            'pin' => 'nullable|digits:6',
            'terms' => 'required|accepted',
        ], [
            'terms.required' => 'You must agree to the terms and conditions',
            'terms.accepted' => 'You must agree to the terms and conditions',
        ]);

        if ($validator->fails()) {
            \Log::warning('Registration validation failed', [
                'errors' => $validator->errors()->toArray()
            ]);
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        \Log::info('Registration validation passed');

        // Jika role model, validasi PIN dan nama model
        if ($request->role === 'model') {
            \Log::info('Processing model registration (pending)');
            $validator = Validator::make($request->all(), [
                'pin' => 'required|digits:6'
            ], [
                'pin.required' => 'PIN wajib diisi untuk registrasi sebagai model',
                'pin.digits' => 'PIN harus 6 digit'
            ]);
            if ($validator->fails()) {
                \Log::warning('Model PIN validation failed', [
                    'errors' => $validator->errors()->toArray()
                ]);
                return redirect()->back()->withErrors($validator)->withInput();
            }

            // Pastikan nama ada di tabel models
            $talent = Talent::where('nama_model', $request->name)->first();
            if (!$talent) {
                \Log::warning('Model name not found in talents table', [
                    'name' => $request->name
                ]);
                return redirect()->back()
                    ->withErrors(['name' => 'Nama model tidak ditemukan. Gunakan nama yang sesuai di daftar model.'])
                    ->withInput();
            }

            // Pastikan ada akun model pre-generated untuk nama tsb
            $preGeneratedModelUser = User::where('name', $request->name)
                ->where('role', 'model')
                ->first();
            if (!$preGeneratedModelUser) {
                \Log::warning('Model user account not found', ['name' => $request->name]);
                return redirect()->back()
                    ->withErrors(['name' => 'Akun model belum disiapkan. Hubungi admin.'])
                    ->withInput();
            }

            // Cocokkan PIN (tanpa menyimpan perubahan user dulu)
            if ($preGeneratedModelUser->pin !== $request->pin) {
                \Log::warning('Invalid model PIN', [
                    'name' => $request->name
                ]);
                return redirect()->back()
                    ->withErrors(['pin' => 'PIN model tidak valid'])
                    ->withInput();
            }
        }

        // Simpan data registrasi ke session (belum ada user di DB)
        $pendingData = [
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'number_phone' => $request->number_phone,
            'pin' => $request->role === 'model' ? $request->pin : null,
        ];
        Session::put('pending_registration', $pendingData);

        // Generate OTP
        $otpCode = str_pad(rand(0, 999999), 6, '0', STR_PAD_LEFT);

        // Simpan OTP ke session (atau ke DB tanpa user_id)
        Session::put('pending_otp', [
            'code' => $otpCode,
            'expires_at' => Carbon::now()->addMinutes(5),
        ]);

        // Kirim OTP ke WhatsApp menggunakan nomor dari form
        try {
            $whatsappService = app(WhatsAppService::class);
            $result = $whatsappService->sendOTP($pendingData['number_phone'], $otpCode);
            if ($result) {
                \Log::info('WhatsApp OTP sent successfully (pending)');
            } else {
                \Log::error('WhatsApp OTP failed to send (pending)');
            }
        } catch (\Exception $e) {
            \Log::error('WhatsApp OTP error (pending)', [
                'error' => $e->getMessage()
            ]);
        }

        // Hapus data Google dari session jika ada
        Session::forget('google_email');
        Session::forget('google_name');

        // Redirect ke form OTP
        return redirect()->route('auth.showOtpForm')
            ->with('success', __('messages.otp_sent'));

    }

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $remember = $request->has('remember');

        if (auth()->attempt($request->only('email', 'password'), $remember)) {
            $user = auth()->user();

            // Cek apakah user sudah terverifikasi
            if (!$user->is_verified) {
                auth()->logout();
                return redirect()->back()
                    ->withErrors(['email' => 'Akun Anda belum terverifikasi. Silakan cek WhatsApp untuk kode OTP.'])
                    ->withInput();
            }

            // Hapus data Google dari session jika ada
            Session::forget('google_email');
            Session::forget('google_name');

            if ($user && $user->role === 'admin') {
                return redirect()->route('admin.home')->with('success', 'Login successful');
            }
            return redirect('/')->with('success', 'Login successful');
        }

        return redirect()->back()
            ->withErrors(['email' => 'Invalid credentials'])
            ->withInput();
        }

    public function logout()
    {
        auth()->logout();
        return redirect('/')->with('success', 'Logged out successfully');
    }

    public function showOtpForm()
    {
        \Log::info('showOtpForm accessed', [
            'session_id' => Session::getId(),
            'pending_user_id' => Session::get('pending_user_id'),
            'all_session_data' => Session::all()
        ]);

        // Wajib ada data registrasi pending
        if (!Session::has('pending_registration') || !Session::has('pending_otp')) {
            \Log::warning('No pending registration in session, redirecting to register');
            return redirect('/register')->with('error', 'Silakan daftar terlebih dahulu');
        }

        return view('verify_otp');
    }

    public function verifyOtp(Request $request)
    {
        $request->validate([
            'otp' => 'required|array|size:6',
            'otp.*' => 'required|string|size:1',
        ]);

        $otpInput = implode('', $request->otp);
        $pendingOtp = Session::get('pending_otp');
        $pendingData = Session::get('pending_registration');

        if (!$pendingOtp || !$pendingData) {
            return redirect('/register')->with('error', 'Sesi registrasi tidak ditemukan');
        }
        if (Carbon::now()->greaterThan($pendingOtp['expires_at'])) {
            return back()->withErrors(['otp' => 'Kode OTP sudah kadaluarsa']);
        }
        if ($pendingOtp['code'] !== $otpInput) {
            return back()->withErrors(['otp' => 'Kode OTP tidak valid']);
        }

        // Persist user to DB after OTP verified
        if ($pendingData['role'] === 'model') {
            // Update akun model pre-generated (match by name + role)
            $user = User::where('name', $pendingData['name'])
                ->where('role', 'model')
                ->first();
            if (!$user) {
                return redirect('/register')->with('error', 'Akun model belum disiapkan. Hubungi admin.');
            }
            $user->email = $pendingData['email'];
            $user->password = $pendingData['password'];
            $user->number_phone = $pendingData['number_phone'];
            $user->is_verified = true;
            $user->save();
        } else {
            // Client baru
            $user = User::create([
                'name' => $pendingData['name'],
                'email' => $pendingData['email'],
                'password' => $pendingData['password'],
                'role' => $pendingData['role'],
                'number_phone' => $pendingData['number_phone'],
                'is_verified' => true,
            ]);
        }

        // Auto-login
        auth()->login($user);

        // Bersihkan session
        Session::forget('pending_registration');
        Session::forget('pending_otp');

        return redirect('/')->with('success', 'Akun berhasil diverifikasi dan Anda telah login!');
    }

    public function resendOtp()
    {
        $pendingData = Session::get('pending_registration');
        if (!$pendingData) {
            return redirect('/register')->with('error', 'Sesi registrasi tidak ditemukan');
        }

        // Generate OTP baru
        $otpCode = str_pad(rand(0, 999999), 6, '0', STR_PAD_LEFT);
        Session::put('pending_otp', [
            'code' => $otpCode,
            'expires_at' => Carbon::now()->addMinutes(5),
        ]);

        // Kirim OTP baru ke WhatsApp
        try {
            $whatsappService = app(WhatsAppService::class);
            $result = $whatsappService->sendOTP($pendingData['number_phone'], $otpCode);
            if ($result) {
                \Log::info('WhatsApp OTP resend sent successfully (pending)');
            } else {
                \Log::error('WhatsApp OTP resend failed to send (pending)');
            }
        } catch (\Exception $e) {
            \Log::error('WhatsApp OTP resend error (pending)', [
                'error' => $e->getMessage()
            ]);
        }

        return back()->with('success', 'Kode OTP baru telah dikirim ke WhatsApp Anda');
    }
}
