<?php

namespace MyModel;
use Phalcon\Mvc\Model; 

class Wisata extends Model 
{      
    public $id;
    public $id_wisata;

    public function initialize(){
        $this->setSource('wisata');
        $this->belongsTo(
            'id_wisata',
            'Destinasi',
            'id'
        );
        $this->hasMany(
            'id',
            'Review',
            'id_wisata'
        );
 
    }
}