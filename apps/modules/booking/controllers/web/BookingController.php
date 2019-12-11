<?php

namespace MyModule\Booking\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;
use MyModel\Paket;
use MyModel\Pesan;
use MyModel\Pengunjung;

class BookingController extends MyController
{
    public function indexAction()
    {
        $username = $this->session->get('auth')->username;
        if($cookie = $this->cookies->get('pesan')){
            $cart = unserialize($cookie->getValue());
        }

        $this->view->pesan = $cart[$username];

        $pesanan = Pesan::find([
            'conditions'=>"username=:usr:",
            'bind' => [
                'usr' => $this->session->get('auth')->username
            ]
        ]);
        if($pesanan->valid()){
            $this->view->pesanan = $pesanan;
        }
        else $this->view->pesanan = null;
        $this->view->pick('views/booking/index');
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
        
        $this->view->pick('views/destinasi/detail');
    }

    public function pesanAction()
    {
        if($cookie = $this->cookies->get('pesan')){
            $cart = unserialize($cookie->getValue());
        }
        $username = $this->session->get('auth')->username;
        $id = $this->dispatcher->getParam('id');
        if(!isset($cart[$username]) || !isset($cart[$username][$id])){
            $pesan = Paket::findFirst([
                'conditions'=>"id = :id:",
                'bind'=>[
                    'id' => $id
                ],
            ]);
            $username = $this->session->get('auth')->username;
            $cart[$username][$pesan->id]['id'] = $pesan->id;
            $cart[$username][$pesan->id]['id_wisata'] = $pesan->destinasi->id;
            $cart[$username][$pesan->id]['nama'] = $pesan->nama;
            $cart[$username][$pesan->id]['judul'] = $pesan->destinasi->judul;
            $cart[$username][$pesan->id]['harga'] = $pesan->harga;
            $temp = serialize($cart);
            $this->cookies->set( 
                'pesan', 
                $temp, 
                time() + 15 * 86400 
            );
        }
        $this->response->redirect('pesan');
    }

    public function hapusAction()
    {
        if($cookie = $this->cookies->get('pesan')){
            $cart = unserialize($cookie->getValue());
            $username = $this->session->get('auth')->username;
            $id_paket = $this->dispatcher->getParam('id');
            unset($cart[$username][$id_paket]);
            $this->cookies->set( 
                'pesan', 
                serialize($cart), 
                time() + 15 * 86400 
            );
        }
        $this->response->redirect('pesan');
    }

    public function bookAction()
    {
        if($this->request->isPost()){
            if($this->request->hasFiles()){
                $id = $this->request->getPost('id_pesan');
                $pesan = Pesan::findFirst([
                    "conditions"=>"id=:id:",
                    'bind' => [
                        'id' => $id
                    ]
                ]);
                $file = $this->request->getUploadedFiles();
                $file = $file[0];
                $type = $file->getType();
                if($type == 'application/pdf'){
                    $key = ltrim($file->getKey(),"bukti_transfer.");
                    $path = "files/pdf/{$id}{$this->session->get('auth')->username}{$key}.pdf";
                    $file->moveTo($path);
                    $bukti.=$path;
                    $bukti.='%%';
                    $pesan->bukti_transfer = $bukti;
                }
                else if($type == 'image/jpeg' || $type == 'image/png'){
                    $key = ltrim($file->getKey(),"bukti_transfer.");
                    $ext = ltrim($type,"image/");
                    $path = "files/img/{$id}{$this->session->get('auth')->username}{$key}.{$ext}";
                    $file->moveTo($path);
                    $gambar.=$path;
                    $gambar.='%%';
                    $pesan->bukti_transfer = $gambar;
                }
                $pesan->save();
                $this->flashSession->set('success','Bukti Transfer Berhasil di upload');
                $this->response->redirect('pesan');
            }   
            else{ 
                $username = $this->session->get('auth')->username; 
                $id_paket = $this->request->getPost('id_paket');
                $mulai = $this->request->getPost('mulai');
                $sampai = $this->request->getPost('sampai');
                $nama = $this->request->getPost('nama');
                $no = $this->request->getPost('no_ktp');

                $cart = $this->cookies->get('pesan');
                $cart = $cart->getValue();
                $cart = unserialize($cart);
                unset($cart[$username][$id_paket]);
                $this->cookies->set( 
                    'pesan', 
                    serialize($cart), 
                    time() + 15 * 86400 
                );

                $pesan = new Pesan();   
                $pesan->username = $username; 
                $pesan->id_paket = $id_paket;
                $pesan->mulai = $mulai;
                $pesan->sampai = $sampai;
                $pesan->bukti_transfer=null;
                $pesan->bukti_wisata=null;
                $i=0;
                $pesan->save();
                // var_dump($pesan->id);
                while($nama[$i]!=null)
                {
                    $pengunjung = new Pengunjung();
                    $pengunjung->id_pesan = $pesan->id;
                    $pengunjung->nama = $nama[$i];
                    $pengunjung->no_ktp = $no[$i];
                    $pengunjung->save();
                    // var_dump($pengunjung->getMessages());die();
                    $i++;
                }

                $this->flash->message('success', "Pesanan Berhasil Dikirim. Mohon upload bukti transfer untuk menunggu konfirmasi.");
                $this->response->redirect('pesan');
            }    
        }
        $id = $this->dispatcher->getParam('id');
        $paket = Paket::findFirst([
            'conditions' => "id = :id:",
            'bind'  => [
                'id' => $id
            ],
        ]);
        $this->view->paket = $paket;
        $this->view->pick('views/booking/book');
    }
}