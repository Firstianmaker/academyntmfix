<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PopularTalentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $popularTalents = [
            [
                'id' => 1,
                'image' => 'popular_talents/GNeX5tV0tePiWYBJHcNrGND1nATTGik8qsHAH3tH.png',
                'order' => 0,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 2,
                'image' => 'popular_talents/KhAiyWGx5NGohd6LqgwzwB6SfhpDk93jbGZkT4nZ.png',
                'order' => 1,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 3,
                'image' => 'popular_talents/42tur1bcGoMeWYBjHwGegha2V0MpK3UL8NsLMsko.png',
                'order' => 2,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 4,
                'image' => 'popular_talents/OZ9UVI91ES3fVceVa6DOZw0vrRsva17qWCwyDTqW.png',
                'order' => 3,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 5,
                'image' => 'popular_talents/yYktuDsHUgtAgMflbBoWE80Fhz1x5J3bqsbF2uCR.png',
                'order' => 4,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 6,
                'image' => 'popular_talents/d7sxq9vBvD80iigAwsQgZZKoL0L9UHiZ1ZuEakZE.png',
                'order' => 5,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 7,
                'image' => 'popular_talents/v0jr7bJwltZnCpPSBZjtZPuOerjDBh2b6mhuijUC.png',
                'order' => 6,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
            [
                'id' => 8,
                'image' => 'popular_talents/dm5kaDzeGIyq3ysdDIg1D55WqHw6lYeScsdfRfVf.png',
                'order' => 7,
                'created_at' => '2025-08-08 18:50:40',
                'updated_at' => '2025-08-08 18:50:40',
            ],
        ];

        DB::table('popular_talents')->insert($popularTalents);
    }
}
