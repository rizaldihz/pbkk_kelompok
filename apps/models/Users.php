<?php

namespace MyModel;

use Phalcon\Mvc\Model; 

class Users extends Model 
{     
    public $username;     
    public $nama;
    public $email;
    public $password;
    public $telepon;
    public $admin;
    
    public function initialize(){
        $this->setSource('users'); 
        $this->hasMany(
            'username',
            'MyModel\Destinasi',
            'username',
            [
                'alias' => 'destinasi'
            ]
        );
        $this->hasMany(
            'username',
            'MyModel\Pesan',
            'username',
            [
                'alias' => 'pesan'
            ]
        );
        $this->hasMany(
            'username',
            'MyModel\Wisata',
            'username',
            [
                'alias' => 'Wisata'
            ]
        );
    }
}