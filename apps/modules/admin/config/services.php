<?php

use Phalcon\Mvc\View;
use Phalcon\Mvc\View\Engine\Volt;

$di['view'] = function () {
    $view = new View();
    // $view->setViewsDir(__DIR__ . '/../views/');
    $view->setViewsDir(__DIR__ . '/../');
    //$view->setViewsDir(APP_PATH . '/modules/');

    $view->registerEngines(
        [
            ".volt" => "voltService",
        ]
    );

    return $view;
};