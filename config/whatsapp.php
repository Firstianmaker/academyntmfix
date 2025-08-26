<?php

return [
    /*
    |--------------------------------------------------------------------------
    | WhatsApp API Configuration
    |--------------------------------------------------------------------------
    |
    | Konfigurasi untuk WhatsApp API service
    |
    */

    'provider' => env('WHATSAPP_PROVIDER', 'fonnte'), // fonnte, wablas, dll

    'api_key' => env('WHATSAPP_API_KEY'),

    'base_url' => env('WHATSAPP_BASE_URL', 'https://api.fonnte.com'),

    'device_id' => env('WHATSAPP_DEVICE_ID'),

    'timeout' => [
        'local' => [
            'request' => 15,
            'connect' => 5,
        ],
        'production' => [
            'request' => 30,
            'connect' => 10,
        ],
    ],

    'ssl' => [
        'verify' => env('HTTP_VERIFY_SSL', true),
        'allow_self_signed' => env('HTTP_ALLOW_SELF_SIGNED', false),
    ],

    'retry' => [
        'attempts' => env('WHATSAPP_RETRY_ATTEMPTS', 3),
        'delay' => env('WHATSAPP_RETRY_DELAY', 1000), // milliseconds
    ],

    'logging' => [
        'enabled' => env('WHATSAPP_LOGGING', true),
        'level' => env('WHATSAPP_LOG_LEVEL', 'info'),
    ],

    'message_template' => [
        'otp' => [
            'title' => '🔐 *Kode OTP Academy Next Top Model*',
            'body' => "Kode OTP Anda adalah: *{otp_code}*\n\nKode ini berlaku selama 5 menit.\nJangan bagikan kode ini kepada siapapun.\n\nTerima kasih telah bergabung dengan Academy Next Top Model!",
        ],
    ],
];
