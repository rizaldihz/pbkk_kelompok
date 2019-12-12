<?php

namespace MyModule\Auth;

use Phalcon\DiInterface;
use Phalcon\Loader;
use Phalcon\Mvc\ModuleDefinitionInterface;

class Module implements ModuleDefinitionInterface
{
    public function registerAutoloaders(DiInterface $di = null)
    {
        $loader = new Loader();

        $loader->registerNamespaces([
            'MyModule\Auth\Controllers\Web' => __DIR__ . '/controllers/web',
            'MyModule\Auth\Controllers\Api' => __DIR__ . '/controllers/api',
            'MyModule\Auth\Models' => __DIR__ . '/models',
            'MyModule\Auth\Validator' => __DIR__ . '/validator',
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