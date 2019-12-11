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
            'MyModel\Destinasi',
            'id',
            [
                'alias' => 'destinasi'
            ]
        );
        $this->hasMany(
            'id',
            'MyModel\Review',
            'id_wisata',
            [
                'alias' => 'review'
            ]
        );
 
    }
}