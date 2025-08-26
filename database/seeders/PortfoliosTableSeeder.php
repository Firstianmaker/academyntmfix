<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PortfoliosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Karena data portfolios sangat banyak (137 records), 
        // kita akan membuat beberapa sample data saja
        $portfolios = [
            [
                'id_portfolios' => 22,
                'id_model' => 7,
                'nama_model' => 'Afia Khansa Rafani',
                'photo' => 'portfolio/iq0YHxDH9cEDkAgPf8ks4qYKtGPRTGbEfzTWLCsJ.png',
                'description' => 'slot_1',
            ],
            [
                'id_portfolios' => 23,
                'id_model' => 7,
                'nama_model' => 'Afia Khansa Rafani',
                'photo' => 'portfolio/Cdbgj3GloYggFd21o0GAYWnovI5FuEu6POaDOEOj.png',
                'description' => 'slot_2',
            ],
            [
                'id_portfolios' => 24,
                'id_model' => 7,
                'nama_model' => 'Afia Khansa Rafani',
                'photo' => 'portfolio/kemYpnFeYOXCT3tYKgAr4viOGN6FfYD7IWBwyh7b.png',
                'description' => 'slot_3',
            ],
            [
                'id_portfolios' => 25,
                'id_model' => 7,
                'nama_model' => 'Afia Khansa Rafani',
                'photo' => 'portfolio/qIrkhBoSsgrMvJBhf3tqBU1pyRXSzHQFDZ6cUc54.png',
                'description' => 'slot_4',
            ],
            [
                'id_portfolios' => 26,
                'id_model' => 7,
                'nama_model' => 'Afia Khansa Rafani',
                'photo' => 'portfolio/W8ZJlwZTpVBzajSK6LOhdvQInS1h2QkStBdig00r.png',
                'description' => 'slot_5',
            ],
        ];

        DB::table('portfolios')->insert($portfolios);
    }
}
