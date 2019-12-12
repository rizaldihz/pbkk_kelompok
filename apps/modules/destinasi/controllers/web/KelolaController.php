<?php

namespace MyModule\Destinasi\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;
use MyModel\Users;
use MyModel\Paket;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class KelolaController extends Controller
{
    public function indexAction()
    {
        if(!($this->session->has('auth')))
        {
            $this->response->redirect('login');
        }
        else{
            $user = Users::findFirst([
                'conditions' => 'username = :username:',
                'bind' => [
                    'username' => $this->session->get('auth')->username
                ]
            ]);
            // var_dump($user->destinasi); die();
            $this->view->user = $user;
            $this->view->pick('views/destinasi/kelola');
        }

    }
    public function storeAction()
    {
        $des = new Destinasi();

        $nama = $this->request->getPost('judul');
        $deskripsi = $this->request->getPost('deskripsi');
        $files = $this->request->getUploadedFiles();
        $bukti='';
        $gambar='';
        if($id=Destinasi::count(['conditions'=>"username = '{$this->session->get('auth')->username}'"])){
            $id=$id;
        }else{
            $id = 0;
        }
        foreach($files as $file){
            $type = $file->getType();
            if($type == 'application/pdf'){
                $key = ltrim($file->getKey(),"bukti_des.");
                $path = "files/pdf/{$id}{$this->session->get('auth')->username}{$key}.pdf";
                $file->moveTo($path);
                $bukti.=$path;
                $bukti.='%%';
            }
            else if($type == 'image/jpeg' || $type == 'image/png'){
                $key = ltrim($file->getKey(),"gambar_des.");
                $ext = ltrim($type,"image/");
                $path = "files/img/{$id}{$this->session->get('auth')->username}{$key}.{$ext}";
                $file->moveTo($path);
                $gambar.=$path;
                $gambar.='%%';
            }
        }
        $des->id = ($id+1).($this->session->get('auth')->username);
        $des->gambar = $gambar;
        $des->judul = $nama;
        $des->username = $this->session->get('auth')->username;
        $des->deskripsi = $deskripsi;
        $des->bukti = $bukti;
        $des->status = 'pending';

        if($des->save() === false)
        {
            $this->flashSession->error('Pengajuan destinasi gagal, mohon cek kembali data');
            $this->response->redirect('kelola');
        }
        else{
            $this->flashSession->success('Pengajuan destinasi Sukses');
            $this->response->redirect('kelola');
        }   
    }

    public function paketAction($id)
    {
        if(!($this->session->has('auth')))
        {
            $this->response->redirect('login');
        }
        else{
            $destinasi = Destinasi::findFirst([
                'conditions' => 'id = :id:',
                'bind' => [
                    'id' => $id
                ]
            ]);
            $this->view->destinasi = $destinasi;
            $this->view->pick('views/destinasi/paket');
        }
        # code...
    }

    public function tambahPaketAction($id)
    {
        $des = Destinasi::findFirst(
            [
                "id='$id'"
            ]
        );
        if($des->username!=$this->session->get('auth')->username){
            $this->response->redirect();
            $this->view->disable();
        }
        else{
            if($this->request->isPost()){
                $count = Paket::count();
                $paket = new Paket();
                $paket->id = $count+1;
                $paket->id_wisata = $this->request->getPost('id_wisata');
                $paket->nama = $this->request->getPost('nama');
                $paket->deskripsi = $this->request->getPost('deskripsi');
                $paket->harga = $this->request->getPost('harga');
                $paket->save();
            }
            $this->view->destinasi = $des;
            $this->response->redirect();
        }
    }
}