<?php

namespace MyModule\Donasi\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyModel\Users;
use MyModel\Kebutuhan;
use MyModel\Label;
use MyModel\Resipien;
use MyModel\Donasi;
use Phalcon\Http\Request;
use MyLayout\MyController;
use \DataTables\DataTable;

class DonasiController extends MyController
{
    public function indexAction()
    {
        if ($this->request->isAjax()) {
            if($this->session->get('auth')->priviliges == 0){
                $get_kebutuhan = $this->modelsManager->executeQuery(
                'SELECT k.id,k.judul as knama,k.jumlah,l.nama as lnama,k.tanggal FROM \MyModel\Donasi as k JOIN \MyModel\Kebutuhan as l on k.kebutuhan_id = l.id JOIN \MyModel\Users as u on u.id = k.users_id where k.users_id = "'.$this->session->get('auth')->id.'"'
            );
      
            }
            else{

          $get_kebutuhan = $this->modelsManager->executeQuery(
                'SELECT k.id,k.nama as knama,k.jumlah,l.nama as lnama FROM \MyModel\Kebutuhan as k JOIN \MyModel\Label as l on k.label_id = l.id JOIN \MyModel\Resipien as r on k.resipien_id = r.id'
            );
            }

            // var_dump($get_kebutuhan);die();

          $dataTables = new DataTable();
          $dataTables->fromResultSet($get_kebutuhan)->sendResponse();
        }
        $this->view->pick('views/donasi/index');
    }

    public function tambahAction()
    {
        if($this->request->isPost()){
            $new_Donasi = new Donasi();
            $_POST['users_id'] = $this->session->get('auth')->id;
            $_POST['status'] = 0;
            var_dump($_POST);
            $new_Donasi->registrasi($_POST);
            if($this->request->hasFiles() == true){
                $uploads = $this->request->getUploadedFiles();
                // var_dump($this->request->getUploadedFiles());die();
                $isuploaded = false;
                $allpath = "";
                foreach($uploads as $up)
                {
                    $path = 'storage/'.time().'-'.strtolower($up->getname());
                    $fpath = BASE_PATH . "/public/" . $path;
                    if($up->moveTo($fpath)){
                        $isUploaded = true;
                        $allpath.=$path."||";
                    }else{
                        $isUploaded = false;
                    }

                }
                if(!$isUploaded)
                {
                    die('You must choose at least one file to send. Please try again.');
                }
            }
            $new_Donasi->bukti_donasi = $allpath;
            if($new_Donasi->save()) $this->flashSession->success("<i class='fa fa-check-circle'></i> Donasi berhasil ditambahkan.");
            // var_dump($new_Donasi->getMessages());die();
        }
        $get_kebutuhan = Kebutuhan::find();
        $get_resipien = Resipien::find();
        $this->view->kebutuhan = $get_kebutuhan;
        $this->view->pick('views/donasi/tambah');
    }

    public function editAction()
    {
        if($this->request->isAjax()){
            $get_kebutuhan = Kebutuhan::findFirst([
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $this->request->getPost('id')
                ],
            ]);
            $get_kebutuhan->registrasi($_POST);
            $get_kebutuhan->save();

            $this->response->setJsonContent(
                [
                    "success" => "OK",
                ]
            )->send();
        }
        $get_id = $this->dispatcher->getParam('param');
        $get_kebutuhan = Kebutuhan::findFirst([
            "conditions" => "id = :id:",
            "bind" => [
                "id" => $get_id
            ],
        ]);
        $this->view->resipien = Resipien::find();
        $this->view->labels = Label::find();
        if(!$get_kebutuhan) $this->response->redirect('kebutuhan');
        $this->view->kebutuhan = $get_kebutuhan;
        $this->view->pick('views/kebutuhan/edit');
    }

    public function hapusAction()
    {
        if($this->request->isAjax()){
            $get_kebutuhan = Kebutuhan::findFirst([
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $this->request->getPost('id')
                ],
            ]);
            if($get_kebutuhan->delete()){
                $this->response->setJsonContent(
                    [
                        "success" => "OK",
                    ]
                )->send();
            }
        }
    }

}