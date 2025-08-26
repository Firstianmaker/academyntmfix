<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class WhatsAppService
{
    protected $apiKey;
    protected $baseUrl;
    protected $isProduction;

    public function __construct()
    {
        $this->apiKey = env('WHATSAPP_API_KEY', 'YOUR_API_KEY_HERE');
        $this->baseUrl = env('WHATSAPP_BASE_URL', 'https://api.fonnte.com');
        $this->isProduction = env('APP_ENV') === 'production';
        
        // Log konfigurasi untuk debugging
        Log::info('WhatsApp Service initialized', [
            'base_url' => $this->baseUrl,
            'is_production' => $this->isProduction,
            'ssl_verify' => env('HTTP_VERIFY_SSL', true)
        ]);
    }

    public function sendOTP($phoneNumber, $otpCode)
    {
        try {
            // Format nomor telepon
            $formattedPhone = $this->formatPhoneNumber($phoneNumber);
            
            $message = "🔐 *Kode OTP Academy Next Top Model*\n\n";
            $message .= "Kode OTP Anda adalah: *{$otpCode}*\n\n";
            $message .= "Kode ini berlaku selama 5 menit.\n";
            $message .= "Jangan bagikan kode ini kepada siapapun.\n\n";
            $message .= "Terima kasih telah bergabung dengan Academy Next Top Model!";

            // Konfigurasi HTTP client dengan opsi yang sesuai untuk production
            $httpClient = Http::withHeaders([
                'Authorization' => $this->apiKey,
                'User-Agent' => 'AcademyNTM/1.0',
                'Accept' => 'application/json'
            ]);

            // Konfigurasi SSL dan timeout yang berbeda untuk production vs local
            if ($this->isProduction) {
                $httpClient = $httpClient->withOptions([
                    'verify' => env('HTTP_VERIFY_SSL', true),
                    'timeout' => 30,
                    'connect_timeout' => 10
                ]);
            } else {
                // Untuk localhost, bisa disable SSL verification jika perlu
                $httpClient = $httpClient->withOptions([
                    'verify' => env('HTTP_VERIFY_SSL', false),
                    'timeout' => 15,
                    'connect_timeout' => 5
                ]);
            }

            Log::info('Sending WhatsApp OTP', [
                'phone' => $formattedPhone,
                'base_url' => $this->baseUrl,
                'is_production' => $this->isProduction
            ]);

            $response = $httpClient->post($this->baseUrl . '/send', [
                'target' => $formattedPhone,
                'message' => $message,
                'countryCode' => '62',
            ]);

            // Log response lengkap untuk debugging
            Log::info('WhatsApp API Response', [
                'status_code' => $response->status(),
                'headers' => $response->headers(),
                'body' => $response->body(),
                'json' => $response->json()
            ]);

            if ($response->successful()) {
                Log::info('WhatsApp OTP sent successfully', [
                    'phone' => $formattedPhone,
                    'response' => $response->json()
                ]);
                return true;
            } else {
                Log::error('WhatsApp OTP failed to send', [
                    'phone' => $formattedPhone,
                    'status_code' => $response->status(),
                    'response' => $response->json(),
                    'error_body' => $response->body()
                ]);
                return false;
            }
        } catch (\Exception $e) {
            Log::error('WhatsApp OTP error', [
                'phone' => $phoneNumber,
                'error' => $e->getMessage(),
                'file' => $e->getFile(),
                'line' => $e->getLine(),
                'trace' => $e->getTraceAsString()
            ]);
            return false;
        }
    }

    protected function formatPhoneNumber($phone)
    {
        // Hapus semua karakter non-digit
        $phone = preg_replace('/[^0-9]/', '', $phone);
        
        // Jika dimulai dengan 0, ganti dengan 62
        if (substr($phone, 0, 1) === '0') {
            $phone = '62' . substr($phone, 1);
        }
        
        // Jika belum ada 62 di depan, tambahkan
        if (substr($phone, 0, 2) !== '62') {
            $phone = '62' . $phone;
        }
        
        return $phone;
    }

    /**
     * Test koneksi ke WhatsApp API
     */
    public function testConnection()
    {
        try {
            $response = Http::withHeaders([
                'Authorization' => $this->apiKey
            ])->withOptions([
                'verify' => env('HTTP_VERIFY_SSL', true),
                'timeout' => 10
            ])->get($this->baseUrl . '/device');

            Log::info('WhatsApp API connection test', [
                'status_code' => $response->status(),
                'response' => $response->json()
            ]);

            return $response->successful();
        } catch (\Exception $e) {
            Log::error('WhatsApp API connection test failed', [
                'error' => $e->getMessage()
            ]);
            return false;
        }
    }
} 