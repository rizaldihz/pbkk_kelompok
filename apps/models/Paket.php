<?php

namespace MyModel;
use Phalcon\Mvc\Model; 

class Paket extends Model 
{     
    public $id;     
    public $id_wisata;
    public $nama;
    public $deskripsi;
    public $harga; 
    public $gambar;

    public function initialize(){
        $this->setSource('paket');
        $this->belongsTo(
            'id_wisata',
            'Destinasi',
            'id'
        ); 
        $this->hasMany(
            'id',
            'Pesan',
            'id_paket'
        ); 
    }
}