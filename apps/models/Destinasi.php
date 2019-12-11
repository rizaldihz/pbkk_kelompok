<?php

namespace MyModel;

use Phalcon\Mvc\Model; 

class Destinasi extends Model 
{     
    public $id;     
    public $username;
    public $judul;
    public $deskripsi;
    public $gambar; 
    public $bukti;
    public $status;

    public function initialize(){
        $this->setSource('destinasi');
        $this->hasMany(
            'id',
            'MyModel\Wisata',
            'id_wisata',
            [
                'alias' => 'wisata'
            ]
        );
        $this->hasMany(
            'id',
            'MyModel\Paket',
            'id_wisata',
            [
                'alias' => 'paket'
            ]
        );  
        $this->belongsTo(
            'username',
            'MyModel\Users',
            'username',
            [
                'alias' => 'users'
            ]
        );
    }
}