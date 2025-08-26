<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade;
use App\Helpers\AssetHelper;

class AssetServiceProvider extends ServiceProvider
{
    public function register(): void
    {
        //
    }

    public function boot(): void
    {
        // Blade directive untuk image
        Blade::directive('image', function ($expression) {
            return "<?php echo App\Helpers\AssetHelper::image($expression); ?>";
        });
        
        // Blade directive untuk storage
        Blade::directive('storage', function ($expression) {
            return "<?php echo App\Helpers\AssetHelper::storage($expression); ?>";
        });
    }
}
