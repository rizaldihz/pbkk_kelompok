<?php

namespace MyModule\Auth\Validator;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator;

class MyValidator extends Validation
{
    public function initialize()
    {
        $this->add(
            'nama',
            new PresenceOf(
                [
                    'message' => 'Nama wajib diisi',
                ]
            )
        );

        $this->add(
            'email',
            new PresenceOf(
                [
                    'message' => 'Email wajib diisi',
                ]
            )
        );

        $this->add(
            'email',
            new Email(
                [
                    'message' => 'Email tidak valid',
                ]
            )
        );

        $this->add(
            'password',
            new PresenceOf(
                [
                    'message' => 'Password wajib diisi',
                ]
            )
        );

        $this->add(
            'username',
            new PresenceOf(
                [
                    'message' => 'Username wajib diisi',
                ]
            )
        );

        $this->add(
            'no_telp',
            new PresenceOf(
                [
                    'message' => 'Nomor telepon wajib diisi',
                ]
            )
        );
    }
}