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

	$router->addGet('/register', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'registerindex'
	]);

	$router->addPost('/login', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'login'
	]);

	$router->addGet('/login', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'index'
	]);
	
	$router->addGet('/logout', [
	    'namespace' => 'MyModule\Auth\Controllers\Web',
		'module' => 'authentication',
	    'controller' => 'authentication',
	    'action' => 'logout'
	]);

	$router->addGet('/resipien/tambah', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'tambah'
	]);

	$router->addPost('/resipien/tambah', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'tambah'
	]);

	$router->addGet('/resipien', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'index'
	]);

	$router->addPost('/resipien', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'index'
	]);

	$router->addGet('/resipien/edit/{param}', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'edit'
	]);

	$router->addPost('/resipien/edit', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'edit'
	]);

	$router->addPost('/resipien/hapus', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'resipien',
	    'action' => 'hapus'
	]);

	$router->addGet('/kebutuhan/tambah', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'tambah'
	]);

	$router->addPost('/kebutuhan/tambah', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'tambah'
	]);

	$router->addGet('/kebutuhan', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'index'
	]);

	$router->addPost('/kebutuhan', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'index'
	]);

	$router->addGet('/kebutuhan/edit/{param}', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'edit'
	]);

	$router->addPost('/kebutuhan/edit', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'edit'
	]);

	$router->addPost('/kebutuhan/hapus', [
	    'namespace' => 'MyModule\Recieve\Controllers\Web',
		'module' => 'recieve',
	    'controller' => 'kebutuhan',
	    'action' => 'hapus'
	]);

	$router->addGet('/donasi/tambah', [
	    'namespace' => 'MyModule\Donasi\Controllers\Web',
		'module' => 'donasi',
	    'controller' => 'donasi',
	    'action' => 'tambah'
	]);

	$router->addPost('/donasi/tambah', [
	    'namespace' => 'MyModule\Donasi\Controllers\Web',
		'module' => 'donasi',
	    'controller' => 'donasi',
	    'action' => 'tambah'
	]);

	$router->addGet('/donasi', [
	    'namespace' => 'MyModule\Donasi\Controllers\Web',
		'module' => 'donasi',
	    'controller' => 'donasi',
	    'action' => 'index'
	]);

	$router->addPost('/donasi', [
	    'namespace' => 'MyModule\Donasi\Controllers\Web',
		'module' => 'donasi',
	    'controller' => 'donasi',
	    'action' => 'index'
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