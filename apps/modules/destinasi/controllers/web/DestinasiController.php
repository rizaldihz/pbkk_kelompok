<?php

namespace MyModule\Destinasi\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class DestinasiController extends Controller
{
    public function indexAction($page)
    {
        if($page == null) $page = 1;
    	$get_destinasi = Destinasi::find([
            'conditions'=>'status="terima"',
        ]);
        $paginator = new PaginatorModel(
            [
                'data'  => $get_destinasi,
                'limit' => 10,
                'page'  => $page,
            ]
        );

        // Get the paginated results
        $page = $paginator->getPaginate();

        $this->view->destinasi = $page;	
        $this->view->pick('views/destinasi/index');
    }

    public function error404Action()
    {
    	$this->view->pick('views/dashboard/error404');
    }
}