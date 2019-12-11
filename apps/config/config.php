<?php

use Phalcon\Config;

return new Config(
    [
        'mode' => getenv('APP_MODE'), //DEVELOPMENT, PRODUCTION, DEMO

        'database' => [
            'adapter' => getenv('DB_ADAPTER'),
            'host' => getenv('DB_HOST'),
            'username' => getenv('DB_USERNAME'),
            'password' => getenv('DB_PASSWORD'),
            'dbname' => getenv('DB_NAME'),
        ],   
        
        'url' => [
            'baseUrl' => getenv('BASE_URL'),
        ],
        
        'application' => [
            'libraryDir' => APP_PATH . "/lib/",
            'cacheDir' => APP_PATH . "/cache/",
        ],

        'smtp' => [
            'address' => 'smtp.gmail.com',
            'port' => '587',
            'enc' => 'tls',
            'username' => 'pbkk.its@gmail.com',
            'password' => 'Kelompok2@'
        ],

        'version' => '0.1',
    ]
);
