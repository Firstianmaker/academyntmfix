<?php

namespace App\Helpers;

class AssetHelper
{
    /**
     * Get the correct asset URL for images
     */
    public static function image($path)
    {
        // Remove leading slash if exists
        $path = ltrim($path, '/');
        
        // Check if it's a storage path
        if (str_starts_with($path, 'storage/')) {
            return asset($path);
        }
        
        // Check if it's an img folder path
        if (str_starts_with($path, 'img/')) {
            return asset($path);
        }
        
        // If it's just a filename, assume it's in img folder
        if (!str_contains($path, '/')) {
            return asset('img/' . $path);
        }
        
        // Return as is if it's a full path
        return asset($path);
    }
    
    /**
     * Get the correct asset URL for any file
     */
    public static function asset($path)
    {
        return asset($path);
    }
    
    /**
     * Get storage URL for uploaded files
     */
    public static function storage($path)
    {
        return asset('storage/' . ltrim($path, '/'));
    }
}
