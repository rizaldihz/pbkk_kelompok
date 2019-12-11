<?php

namespace MyModule\Admin\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;

class AdminController extends MyController
{
    public function pendingAction()
    {
        $destinasi = Destinasi::find([
            'conditions' => 'status = :status:',
            'bind' => [
                'status' => 'pending'
            ]
        ]);

        $this->view->destinasi = $destinasi;
        $this->view->pick('views/pending');
    }

    public function acceptAction($id)
    {
        if(!$this->is_admin()){
            $this->response->redirect();
        }
        $des = Destinasi::findFirst([
            'conditions' => 'id = :id:',
            'bind' => [
                'id' => $id
            ]
        ]);
        $des->status = 'terima';
        $des->save();
        $this->flashSession->error('Status telah diubah');
        $this->response->redirect('admin_page');

    }

    public function rejectAction($id)
    {
        $this->flashSession->error('Status telah diubah');
        $this->response->redirect('admin_page');

    }

}