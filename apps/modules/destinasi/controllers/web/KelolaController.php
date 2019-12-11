<?php

namespace MyModule\Destinasi\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;

use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class KelolaController extends Controller
{
    public function indexAction()
    {
        $this->view->pick('views/destinasi/kelola');
    }
    public function storeAction()
    {
        $des = new Destinasi();

        $nama = $this->request->getPost('judul');
        $deskripsi = $this->request->getPost('deskripsi');
        $files = $this->request->getUploadedFiles();
        $bukti='';
        $gambar='';
        if($id=Destinasi::count(['conditions'=>"id = '{$this->session->get('auth')->username}'"])){
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

}