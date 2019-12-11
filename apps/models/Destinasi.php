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
        $this->hasOne(
            'id',
            'Wisata',
            'id_wisata'
        );
        $this->hasMany(
            'id',
            'Paket',
            'id_wisata'
        );  
        $this->belongsTo(
            'username',
            'Users',
            'username'
        );
    }
}