<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class FeaturedTalentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $featuredTalents = [
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
            [
                'id' => 3,
                'id_model' => 10,
                'order' => 2,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
            [
                'id' => 4,
                'id_model' => 9,
                'order' => 3,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
            [
                'id' => 5,
                'id_model' => null,
                'order' => 4,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
            [
                'id' => 6,
                'id_model' => null,
                'order' => 5,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
            [
                'id' => 7,
                'id_model' => null,
                'order' => 6,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
            [
                'id' => 8,
                'id_model' => null,
                'order' => 7,
                'created_at' => '2025-08-02 12:08:08',
                'updated_at' => '2025-08-02 12:08:08',
            ],
        ];

        DB::table('featured_talents')->insert($featuredTalents);
    }
}
