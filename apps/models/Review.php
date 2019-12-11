<?php

namespace MyModel;
use Phalcon\Mvc\Model; 

class Review extends Model 
{     
    public $id;     
    public $username; 
    public $id_wisata;
    public $review;

    public function initialize(){
        $this->setSource('review');
        $this->belongsTo(
            'username',
            'MyModel\Users',
            'username',
            [
                'alias' => 'users'
            ]
        ); 
        $this->belongsTo(
            'id_wisata',
            'MyModel\Wisata',
            'id',
            [
                'alias' => 'wisata'
            ]
        );
    }
}