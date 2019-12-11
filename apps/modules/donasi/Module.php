<?php

namespace MyModule\Donasi;

use Phalcon\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([
            'MyModule\Donasi\Controllers\Web' => __DIR__ . '/controllers/web',
            'MyModule\Donasi\Controllers\Api' => __DIR__ . '/controllers/api',
            'MyModule\Donasi\Models' => __DIR__ . '/models',
        ]);

        $loader->register();
    }

    public function registerServices(DiInterface $di = null)
    {
        $moduleConfig = require __DIR__ . '/config/config.php';

        $di->get('config')->merge($moduleConfig);

        include_once __DIR__ . '/config/services.php';
    }
}