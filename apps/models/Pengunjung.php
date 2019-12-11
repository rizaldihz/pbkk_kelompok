<?php

namespace MyModel;
use Phalcon\Mvc\Model; 

class Pengunjung extends Model 
{     
    public $id;     
    public $id_pesan; 
    public $nama;
    public $no_ktp;

    public function initialize(){
        $this->setSource('pengunjung'); 
        $this->belongsTo(
            'id_pesan',
            'Pesan',
            'id'
        );
    }
}