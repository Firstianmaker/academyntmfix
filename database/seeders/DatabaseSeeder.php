<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UsersTableSeeder::class,
            ModelsTableSeeder::class,
            BookingsTableSeeder::class,
            PortfoliosTableSeeder::class,
            AwardsTableSeeder::class,
            CareersTableSeeder::class,
            OtpsTableSeeder::class,
            FeaturedTalentsTableSeeder::class,
            OurTalentsTableSeeder::class,
            PopularTalentsTableSeeder::class,
            SessionsTableSeeder::class,
            VisitorTableSeeder::class,
        ]);
    }
}
