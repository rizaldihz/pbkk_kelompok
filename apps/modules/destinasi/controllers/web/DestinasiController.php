<?php

namespace MyModule\Destinasi\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class DestinasiController extends Controller
{
    public function indexAction()
    {
        if(isset($_GET['page'])) $page = 1;
        $page = $_GET['page'];
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

        $this->view->destinasi = $page->items;
        $this->view->count = $page->total_pages;
        $this->view->current = $page->current;	
        $this->view->pick('views/destinasi/index');
    }

    public function detailAction()
    {
        $id = $this->dispatcher->getParam('id');
        $des = Destinasi::findFirst([
            'conditions' => 'id = :id:',
            'bind' => [
                'id' => $id
            ]
        ]);
        if($des == null) $this->response->redirect('404');
        $this->view->detail = $des;
        $this->view->author = $des->users;
        $this->view->paket = $des->paket;
        $wisata = $des->wisata;
        $wisata = $wisata->toArray();
        $wisata = $wisata[0];
        $get_kebutuhan = $this->modelsManager->executeQuery(
                'SELECT l.* FROM \MyModel\Review as l JOIN \MyModel\Wisata as k on k.id = l.id_wisata
                WHERE k.id = :id:',
                [
                    'id' => $wisata['id']
                ]
            );
        $get_kebutuhan = $get_kebutuhan->toArray();
        $this->view->review = $get_kebutuhan;
        
        $this->view->pick('views/destinasi/detail');

    }
}