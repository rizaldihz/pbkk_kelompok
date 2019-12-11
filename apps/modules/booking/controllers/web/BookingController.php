<?php

namespace MyModule\Booking\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyLayout\MyController;
use MyModel\Destinasi;
use MyModel\Paket;
use MyModel\Pesan;

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
        // if($tes->valid()){
        //     $this->view->review = $des->wisata->review;
        // }else{
        //     $this->view->review = null;
        // }
        
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
                $gambar = $this->request->getUploadedFiles();
                $id = $this->request->getPost('id_pesan');
                $pesan = Pesan::findFirst([
                    "conditions"=>"id={$id}"
                ]);
                $pesan->bukti_transfer = base64_encode(file_get_contents($gambar[0]->getTempName()));
                $pesan->save();
                $this->response->redirect('book')->send();
            }   
            else{ 
                $username = $this->session->get('auth')->username; 
                $id_paket = $this->request->getPost('id_paket');
                $mulai = $this->request->getPost('TanggalBerangkat');
                $sampai = $this->request->getPost('TanggalPulang');
                $nama = $this->request->getPost('nama');
                $no = $this->request->getPost('no');
                if(!(Pesan::count(["conditions"=>"username='{$username}' and id_paket={$id_paket}"])))
                {
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
                    $pesan->id = (Pesan::count())+1;     
                    $pesan->username = $username; 
                    $pesan->id_paket = $id_paket;
                    $pesan->mulai = $mulai;
                    $pesan->sampai = $sampai;
                    $pesan->bukti_transfer=null;
                    $pesan->bukti_wisata=null;
                    $i=0;
                    $pesan->save();
                    while($nama[$i]!=null)
                    {
                        $pengunjung = new Pengunjung();
                        $pengunjung->id = (Pengunjung::count())+1;
                        $pengunjung->id_pesan = $pesan->id;
                        $pengunjung->nama = $nama[$i];
                        $pengunjung->no_ktp = $no[$i];
                        $pengunjung->save();
                        $i++;
                    }
                }
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