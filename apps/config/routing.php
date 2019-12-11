<?php

$di['router'] = function() use ($defaultModule, $modules, $di, $config) {

	$router = new \Phalcon\Mvc\Router(false);
	$router->clear();

	/**
	 * Default Routing
	 */
	$router->add('/', [
	    'namespace' => 'MyModule\Dashboard\Controllers\Web',
		'module' => 'dashboard',
	    'controller' => 'dashboard',
	    'action' => 'index'
	]);

	$router->addPost('/register', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'register'
	]);

	$router->addPost('/login', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'login'
	]);
	
	$router->addGet('/logout', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'logout'
	]);

	$router->addGet('/admin_page', [
	    'namespace' => 'MyModule\Admin\Controllers\Web',
		'module' => 'admin',
	    'controller' => 'admin',
	    'action' => 'pending'
	]);

	$router->addGet('/terima/{destinasi}', [
	    'namespace' => 'MyModule\Admin\Controllers\Web',
		'module' => 'admin',
	    'controller' => 'admin',
	    'action' => 'accept'
	]);

	$router->addGet('/tolak/{destinasi}', [
	    'namespace' => 'MyModule\Admin\Controllers\Web',
		'module' => 'admin',
	    'controller' => 'admin',
	    'action' => 'reject'
	]);

	$router->addGet('/destinasi', [
	    'namespace' => 'MyModule\Destinasi\Controllers\Web',
		'module' => 'destinasi',
	    'controller' => 'destinasi',
	    'action' => 'index'
	]);

	$router->addGet('/destinasi/{id}', [
	    'namespace' => 'MyModule\Destinasi\Controllers\Web',
		'module' => 'destinasi',
	    'controller' => 'destinasi',
	    'action' => 'detail'
	]);

	$router->addGet('/kelola', [
	    'namespace' => 'MyModule\Destinasi\Controllers\Web',
		'module' => 'destinasi',
	    'controller' => 'kelola',
	    'action' => 'index'
	]);

	$router->addPost('/kelola', [
	    'namespace' => 'MyModule\Destinasi\Controllers\Web',
		'module' => 'destinasi',
	    'controller' => 'kelola',
	    'action' => 'store'
	]);

	$router->addGet('/pesan', [
	    'namespace' => 'MyModule\Booking\Controllers\Web',
		'module' => 'booking',
	    'controller' => 'booking',
	    'action' => 'index'
	]);
	$router->addGet('/rencana/{id}', [
	    'namespace' => 'MyModule\Booking\Controllers\Web',
		'module' => 'booking',
	    'controller' => 'booking',
	    'action' => 'pesan'
	]);
	$router->addGet('/rencana/hapus/{id}', [
	    'namespace' => 'MyModule\Booking\Controllers\Web',
		'module' => 'booking',
	    'controller' => 'booking',
	    'action' => 'hapus'
	]);
	$router->addGet('/book/{id}', [
	    'namespace' => 'MyModule\Booking\Controllers\Web',
		'module' => 'booking',
	    'controller' => 'booking',
	    'action' => 'book'
	]);
	$router->addPost('/book', [
	    'namespace' => 'MyModule\Booking\Controllers\Web',
		'module' => 'booking',
	    'controller' => 'booking',
	    'action' => 'book'
	]);
	/**
	 * Not Found Routing
	 */
	$router->notFound(
		[
			'namespace' => 'MyModule\Dashboard\Controllers\Web',
			'module' => 'dashboard',
			'controller' => 'dashboard',
			'action'     => 'error404',
		]
	);

	/**
	 * Module Routing
	 */
	// foreach ($modules as $moduleName => $module) {

	// 	if ($module['defaultRouting'] == true) {
	// 		/**
	// 		 * Default Module routing
	// 		 */
	// 		$router->add('/'. $moduleName . '/:params', array(
	// 			'namespace' => $module['webControllerNamespace'],
	// 			'module' => $moduleName,
	// 			'controller' => isset($module['defaultController']) ? $module['defaultController'] : 'index',
	// 			'action' => isset($module['defaultAction']) ? $module['defaultAction'] : 'index',
	// 			'params'=> 1
	// 		));
			
	// 		$router->add('/'. $moduleName . '/:controller/:params', array(
	// 			'namespace' => $module['webControllerNamespace'],
	// 			'module' => $moduleName,
	// 			'controller' => 1,
	// 			'action' => isset($module['defaultAction']) ? $module['defaultAction'] : 'index',
	// 			'params' => 2
	// 		));

	// 		$router->add('/'. $moduleName . '/:controller/:action/:params', array(
	// 			'namespace' => $module['webControllerNamespace'],
	// 			'module' => $moduleName,
	// 			'controller' => 1,
	// 			'action' => 2,
	// 			'params' => 3
	// 		));	

	// 		/**
	// 		 * Default API Module routing
	// 		 */
	// 		$router->add('/'. $moduleName . '/api/{version:^(\d+\.)?(\d+\.)?(\*|\d+)$}/:params', array(
	// 			'namespace' => $module['apiControllerNamespace'] . "\\" . 1,
	// 			'module' => $moduleName,
	// 			'version' => 1,
	// 			'controller' => isset($module['defaultController']) ? $module['defaultController'] : 'index',
	// 			'action' => isset($module['defaultAction']) ? $module['defaultAction'] : 'index',
	// 			'params'=> 2
	// 		));
			
	// 		$router->add('/'. $moduleName . '/api/{version:^(\d+\.)?(\d+\.)?(\*|\d+)$}/:controller/:params', array(
	// 			'namespace' => $module['apiControllerNamespace'] . "\\" . 1,
	// 			'module' => $moduleName,
	// 			'version' => 1,
	// 			'controller' => 2,
	// 			'action' => isset($module['defaultAction']) ? $module['defaultAction'] : 'index',
	// 			'params' => 3
	// 		));

	// 		$router->add('/'. $moduleName . '/api/{version:^(\d+\.)?(\d+\.)?(\*|\d+)$}/:controller/:action/:params', array(
	// 			'namespace' => $module['apiControllerNamespace'] . "\\" . 1,
	// 			'module' => $moduleName,
	// 			'version' => 1,
	// 			'controller' => 2,
	// 			'action' => 3,
	// 			'params' => 4
	// 		));	
	// 	} else {
			
	// 		$webModuleRouting = APP_PATH . '/modules/'. $moduleName .'/config/routes/web.php';
			
	// 		if (file_exists($webModuleRouting) && is_file($webModuleRouting)) {
	// 			include $webModuleRouting;
	// 		}

	// 		$apiModuleRouting = APP_PATH . '/modules/'. $moduleName .'/config/routes/api.php';
			
	// 		if (file_exists($apiModuleRouting) && is_file($apiModuleRouting)) {
	// 			include $apiModuleRouting;
	// 		}
	// 	}
	// }
	
    $router->removeExtraSlashes(true);
    
	return $router;
};