<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class VisitorTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Sample data visitor (tidak semua data karena banyak)
        $visitors = [
            [
                'id' => 22,
                'ip_address' => '127.0.0.1',
                'visited_at' => '2025-07-31 20:28:36',
                'session_id' => 'AIOTX7Vm3wRKQtzfsZlYdWZeIAMjMCScy7HnTRop',
                'user_agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36',
                'last_activity' => '2025-07-31 13:28:36',
                'is_online' => 0,
                'user_id' => null,
            ],
            [
                'id' => 23,
                'ip_address' => '127.0.0.1',
                'visited_at' => '2025-07-31 20:28:41',
                'session_id' => 'qTVQ7xWP1psD3FQQmf7SDE8ls7rahwRwVeL9s2tF',
                'user_agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36',
                'last_activity' => '2025-07-31 13:28:41',
                'is_online' => 0,
                'user_id' => 9,
            ],
            [
                'id' => 24,
                'ip_address' => '127.0.0.1',
                'visited_at' => '2025-07-31 20:32:33',
                'session_id' => 'dDmg5pd73eIL8UmyD0TYmeVpIKJPqjhkOAVysCjI',
                'user_agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36',
                'last_activity' => '2025-07-31 13:32:33',
                'is_online' => 0,
                'user_id' => null,
            ],
        ];

        DB::table('visitor')->insert($visitors);
    }
}
