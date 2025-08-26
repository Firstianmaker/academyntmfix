<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class InitialDataSeeder extends Seeder
{
    public function run(): void
    {
        // Insert admin user
        DB::table('users')->insert([
            'id_user' => 1,
            'name' => 'admin',
            'email' => 'admin@a',
            'password' => Hash::make('password'), // Ganti dengan password yang aman
            'number_phone' => '0987654321',
            'is_verified' => 1,
            'role' => 'admin',
            'remember_token' => '8TlrRyybXMdArMTm0NdOo07Gj4VAdYBiAKrcZZDhOSo9Z5h08x1GpMyRQ2eE',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        // Insert sample models
        DB::table('models')->insert([
            [
                'id_model' => 7,
                'nama_model' => 'Afia Khansa Rafani',
                'city' => 'Bogor, Jawa Barat',
                'age' => 11,
                'height' => 160,
                'weight' => 40,
                'shoes_size' => 38,
                'bust' => 73,
                'waist' => 65,
                'size' => 'xs',
                'categories' => 'teens',
                'status' => 'available',
                'photo' => 'photos/NJP5dJwA7L504LSMlFVuf1FqDBzvpgykXYKfEKp8.png',
                'experience_value' => 1,
                'experience_unit' => 'years',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id_model' => 8,
                'nama_model' => 'Camilla Aleecea',
                'city' => 'Bekasi, Jawa Barat',
                'age' => 15,
                'height' => 166,
                'weight' => 50,
                'shoes_size' => 39,
                'bust' => 78,
                'waist' => 63,
                'size' => 'S',
                'categories' => 'teens',
                'status' => 'available',
                'photo' => 'photos/z9gftwpEXuv9ojtpMPg8iel51R2LF4Yhpw85ktFC.png',
                'experience_value' => null,
                'experience_unit' => null,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);

        // Insert featured talents
        DB::table('featured_talents')->insert([
            [
                'id' => 1,
                'id_model' => 7,
                'order' => 0,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
            [
                'id' => 2,
                'id_model' => 8,
                'order' => 1,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
        ]);

        // Insert our talents
        DB::table('ourtalents')->insert([
            [
                'id' => 1,
                'image' => 'ourtalents/vzTxKPfJWuYP2rTNaJgzEmvdcU410BFuqOwYT83K.png',
                'order' => 0,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
            [
                'id' => 2,
                'image' => 'ourtalents/QTSTI577WHs4kxgwCov4AeNlCQJL84l5FuQ1RuSn.png',
                'order' => 1,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
        ]);
    }
}
