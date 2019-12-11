<?php

namespace MyModel;
use Phalcon\Mvc\Model; 

class Pesan extends Model 
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
            'Users',
            'username'
        ); 
        $this->belongsTo(
            'id_paket',
            'Paket',
            'id'
        );
        $this->hasMany(
            'id',
            'Pengunjung',
            'id_pesan'
        );
    }
}