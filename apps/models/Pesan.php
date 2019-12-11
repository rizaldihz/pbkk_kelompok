<?php

namespace MyModel;
use Phalcon\Mvc\Model; 
use MyModel\My_Model; 

class Pesan extends My_Model 
{     
    public $id;     
    public $username; 
    public $id_paket;
    public $mulai;
    public $sampai;
    public $bukti_transfer;
    public $bukti_wisata;

    public function initialize(){
        $this->setSource('pesan');
        $this->belongsTo(
            'username',
            'MyModel\Users',
            'username',
            [
                'alias' => 'users'
            ]
        ); 
        $this->belongsTo(
            'id_paket',
            'MyModel\Paket',
            'id',
            [
                'alias' => 'paket'
            ]
        );
        $this->hasMany(
            'id',
            'MyModel\Pengunjung',
            'id_pesan',
            [
                'alias' => 'pengunjung'
            ]
        );
    }
}