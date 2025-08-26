<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class OurTalentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $ourTalents = [
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
            [
                'id' => 3,
                'image' => 'ourtalents/KAzR7sDjhu5qI4CK7TMDxGtTtdV7tfkIl9Iz9vsW.png',
                'order' => 2,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
            [
                'id' => 4,
                'image' => 'ourtalents/tgJLgE0maDMXBeC2KBLNBm1Ejg2KKV7RSlbpT74O.png',
                'order' => 3,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
            [
                'id' => 5,
                'image' => 'ourtalents/LCHKgj33xKBvzKGkd2xiXPAIxPbgcALSFAC6N6Ko.png',
                'order' => 4,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
            [
                'id' => 6,
                'image' => 'ourtalents/8SZVViRvPtGIdWbuQV6FUu9bTy7gRnBPmj89lgEM.png',
                'order' => 5,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
            [
                'id' => 7,
                'image' => 'ourtalents/9h0NgRUKiOQ1SKfI7oBPnPM2XOAKDXVNPkcQFgEC.png',
                'order' => 6,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
            [
                'id' => 8,
                'image' => 'ourtalents/5C59YifGu2xFRiVEN0tF8wczKVisodKBTQoZDwHB.png',
                'order' => 7,
                'created_at' => '2025-08-02 12:40:30',
                'updated_at' => '2025-08-02 12:40:30',
            ],
        ];

        DB::table('ourtalents')->insert($ourTalents);
    }
}
