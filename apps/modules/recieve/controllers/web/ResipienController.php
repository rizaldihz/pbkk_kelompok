<?php

namespace MyModule\Recieve\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyModel\Users;
use MyModel\Resipien;
use Phalcon\Http\Request;
use MyLayout\MyController;
use \DataTables\DataTable;
use MyModule\Recieve\Validator\BaseValidator;

class ResipienController extends MyController
{
	public function beforeExecuteRoute(){
		if(!$this->is_admin() && $this->dispatcher->getactionName()!='index')
			return $this->response->redirect('');
	}

    public function indexAction()
    {
        if ($this->request->isAjax()) {
          $get_resipien = Resipien::find();

          $dataTables = new DataTable();
          $dataTables->fromResultSet($get_resipien)->sendResponse();
        }
        $this->view->pick('views/resipien/index');
    }

    public function tambahAction()
    {
        if($this->request->isPost()){
            $new_resipien = new Resipien();
            $validator = new BaseValidator();
            $messages = $validator->validate($_POST);

            if (count($messages)) {
                foreach ($messages as $message) {
                    $validasi[$message->getField()] = $message;
                }
                $this->view->validasi = $validasi;
            }

            $new_resipien->registrasi($_POST);
            if($this->request->hasFiles() == true){
                $uploads = $this->request->getUploadedFiles();
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
            $new_resipien->file = $allpath;
            if($new_resipien->save()) $this->flashSession->success("<i class='fa fa-check-circle'></i> Data resipien berhasil ditambahkan.");
        }
        $this->view->pick('views/resipien/tambah');
    }

    public function editAction()
    {
        if($this->request->isAjax()){
            $get_resipien = Resipien::findFirst([
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $this->request->getPost('id')
                ],
            ]);

            $validator = new BaseValidator();
            $messages = $validator->validate($this->request->getPost());
            $fail = false;

            if (count($messages)) {
                foreach ($messages as $message) {
                    $validasi[$message->getField()] = $message->getMessage();
                    if(isset($_POST[$message->getField()])) $fail = true;
                }

                if($fail == true){
                    $validasi['error'] = "ERROR";
                    $this->view->disable();
                    $this->response->setJsonContent(json_encode($validasi));
                    return $this->response;
                }
            }

            $get_resipien->nama = $this->request->getPost('nama');
            $get_resipien->alamat = $this->request->getPost('alamat');
            $get_resipien->no_telp = $this->request->getPost('no_telp');
            $get_resipien->jk = $this->request->getPost('jk');
            $get_resipien->ktp = $this->request->getPost('ktp');
            $get_resipien->latar_belakang = $this->request->getPost('latar_belakang');
            $get_resipien->save();

            $this->response->setJsonContent(
                [
                    "success" => "OK",
                ]
            )->send();
        }
        $get_id = $this->dispatcher->getParam('param');
        $get_resipien = Resipien::findFirst([
            "conditions" => "id = :id:",
            "bind" => [
                "id" => $get_id
            ],
        ]);
        if(!$get_resipien) $this->response->redirect('resipien');
        $this->view->resipien = $get_resipien;
        $this->view->images = explode("||",$get_resipien->file);
        $this->view->pick('views/resipien/edit');
    }

    public function hapusAction()
    {
        if($this->request->isAjax()){
            $get_resipien = Resipien::findFirst([
                "conditions" => "id = :id:",
                "bind" => [
                    "id" => $this->request->getPost('id')
                ],
            ]);
            if($get_resipien->delete()){
                $this->response->setJsonContent(
                    [
                        "success" => "OK",
                    ]
                )->send();
            }
        }
    }

}