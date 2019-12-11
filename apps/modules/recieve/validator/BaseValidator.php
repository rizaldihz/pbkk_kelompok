<?php

namespace MyModule\Recieve\Validator;

use Phalcon\Validation;
use Phalcon\Validation\Validator\Email;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\Numericality;

class BaseValidator extends Validation
{
    public function initialize()
    {
        $this->add(
            'nama',
            new PresenceOf(
                [
                    'message' => 'Kolom nama perlu diisi',
                ]
            )
        );

        $this->add(
            'alamat',
            new PresenceOf(
                [
                    'message' => 'Kolom alamat perlu diisi',
                ]
            )
        );

        $this->add(
            'no_telp',
            new PresenceOf(
                [
                    'message' => 'Kolom nomor telepon perlu diisi',
                ]
            )
        );

        $this->add(
            'no_telp',
            new Numericality(
                [
                    'message' => 'Kolom nomor telepon harus diisi angka',
                ]
            )
        );

        $this->add(
            'ktp',
            new PresenceOf(
                [
                    'message' => 'Kolom KTP perlu diisi',
                ]
            )
        );

        $this->add(
            'ktp',
            new Numericality(
                [
                    'message' => 'Kolom KTP harus diisi angka',
                ]
            )
        );

        $this->add(
            'jk',
            new PresenceOf(
                [
                    'message' => 'Pilih jenis kelamin',
                ]
            )
        );

        $this->add(
            'latar_belakang',
            new PresenceOf(
                [
                    'message' => 'Latar belakang perlu diisi',
                ]
            )
        );

        $this->add(
            'email',
            new PresenceOf(
                [
                    'message' => 'The e-mail is required',
                ]
            )
        );

        $this->add(
            'jumlah',
            new PresenceOf(
                [
                    'message' => 'Kolom jumlah perlu diisi',
                ]
            )
        );

        $this->add(
            'jumlah',
            new Numericality(
                [
                    'message' => 'Kolom jumlah perlu diisi menggunakan angka',
                ]
            )
        );

        $this->add(
            'nominal_uang',
            new PresenceOf(
                [
                    'message' => 'Kolom nominal dalam uang perlu diisi',
                ]
            )
        );

        $this->add(
            'nominal_uang',
            new Numericality(
                [
                    'message' => 'Kolom nominal dalam uang perlu diisi menggunakan angka',
                ]
            )
        );

        $this->add(
            'label_id',
            new PresenceOf(
                [
                    'message' => 'Perlu memilih kategori label kebutuhan',
                ]
            )
        );

        $this->add(
            'resipien_id',
            new PresenceOf(
                [
                    'message' => 'Perlu memilih resipien yang membutuhkan',
                ]
            )
        );

        $this->add(
            'keterangan',
            new PresenceOf(
                [
                    'message' => 'Keterangan kebutuhan perlu diisi',
                ]
            )
        );

        $this->add(
            'email',
            new PresenceOf(
                [
                    'message' => 'Kolom email perlu diisi',
                ]
            )
        );

        $this->add(
            'email',
            new Email(
                [
                    'message' => 'Kolom email harus diisi dengan email',
                ]
            )
        );
    }
}