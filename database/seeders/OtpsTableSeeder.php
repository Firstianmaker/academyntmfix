<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OtpsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Sample data OTP (tidak semua data karena banyak)
        $otps = [
            [
                'id' => 2,
                'user_id' => 7,
                'otp_code' => '598182',
                'expires_at' => '2025-07-31 11:39:05',
                'is_used' => 0,
                'created_at' => '2025-07-31 11:34:05',
                'updated_at' => '2025-07-31 11:34:05',
            ],
            [
                'id' => 3,
                'user_id' => 13,
                'otp_code' => '217353',
                'expires_at' => '2025-07-31 14:08:35',
                'is_used' => 1,
                'created_at' => '2025-07-31 14:07:49',
                'updated_at' => '2025-07-31 14:08:35',
            ],
            [
                'id' => 4,
                'user_id' => 14,
                'otp_code' => '760109',
                'expires_at' => '2025-07-31 14:23:16',
                'is_used' => 0,
                'created_at' => '2025-07-31 14:18:16',
                'updated_at' => '2025-07-31 14:18:16',
            ],
        ];

        DB::table('otps')->insert($otps);
    }
}
