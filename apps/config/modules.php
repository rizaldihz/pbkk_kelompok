<?php

return array(
    'dashboard' => [
        'namespace' => 'MyModule\Dashboard',
        'webControllerNamespace' => 'MyModule\Dashboard\Controllers\Web',
        'apiControllerNamespace' => 'MyModule\Dashboard\Controllers\Api',
        'className' => 'MyModule\Dashboard\Module',
        'path' => APP_PATH . '/modules/dashboard/Module.php',
        'defaultRouting' => true,
        'defaultController' => 'dashboard',
        'defaultAction' => 'index'
    ],

    'destinasi' => [
        'namespace' => 'MyModule\Destinasi',
        'webControllerNamespace' => 'MyModule\Destinasi\Controllers\Web',
        'apiControllerNamespace' => 'MyModule\Destinasi\Controllers\Api',
        'className' => 'MyModule\Destinasi\Module',
        'path' => APP_PATH . '/modules/destinasi/Module.php',
        'defaultRouting' => true,
        'defaultController' => 'destinasi',
        'defaultAction' => 'index'
    ],
    'authentication' => [
        'namespace' => 'MyModule\Auth',
        'webControllerNamespace' => 'MyModule\Auth\Controllers\Web',
        'apiControllerNamespace' => 'MyModule\Auth\Controllers\Api',
        'className' => 'MyModule\Auth\Module',
        'path' => APP_PATH . '/modules/authentication/Module.php',
        'defaultRouting' => true,
        'defaultController' => 'authentication',
        'defaultAction' => 'index'
    ],
    'booking' => [
        'namespace' => 'MyModule\Booking',
        'webControllerNamespace' => 'MyModule\Booking\Controllers\Web',
        'apiControllerNamespace' => 'MyModule\Booking\Controllers\Api',
        'className' => 'MyModule\Booking\Module',
        'path' => APP_PATH . '/modules/booking/Module.php',
        'defaultRouting' => false,
        'defaultController' => 'booking',
        'defaultAction' => 'index'
    ],
    // 'recieve' => [
    //     'namespace' => 'MyModule\Recieve',
    //     'webControllerNamespace' => 'MyModule\Recieve\Controllers\Web',
    //     'apiControllerNamespace' => 'MyModule\Recieve\Controllers\Api',
    //     'className' => 'MyModule\Recieve\Module',
    //     'path' => APP_PATH . '/modules/recieve/Module.php',
    //     'defaultRouting' => true,
    //     'defaultController' => 'resipien',
    //     'defaultAction' => 'index'
    // ],
    // 'donasi' => [
    //     'namespace' => 'MyModule\Donasi',
    //     'webControllerNamespace' => 'MyModule\Donasi\Controllers\Web',
    //     'apiControllerNamespace' => 'MyModule\Donasi\Controllers\Api',
    //     'className' => 'MyModule\Donasi\Module',
    //     'path' => APP_PATH . '/modules/donasi/Module.php',
    //     'defaultRouting' => false,
    //     'defaultController' => 'donasi',
    //     'defaultAction' => 'index'
    // ],
);