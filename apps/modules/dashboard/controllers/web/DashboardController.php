<?php

namespace MyModule\Dashboard\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;

class DashboardController extends Controller
{
    public function indexAction()
    {
    	$get_destinasi = Destinasi::find([
            'conditions'=>'status="terima"',
            "limit" => '8'
        ]);
        $this->view->destinasi = $get_destinasi;	
        $this->view->pick('views/dashboard/index');
    }

    public function error404Action()
    {
    	$this->view->pick('views/dashboard/error404');
    }
}