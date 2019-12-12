<?php

namespace MyModule\Auth\Controllers\Web;

use Phalcon\Mvc\Controller;
use MyModel\Users;
use Phalcon\Http\Request;
use MyModule\Auth\Validator\MyValidator;

class AuthenticationController extends Controller
{
	public function beforeExecuteRoute(){
		if($this->session->has('auth'))
			return $this->response->redirect('');
	}

    public function indexAction()
    {
        $this->view->pick('views/authentication/login');
    }

    public function checkAction()
    {
        $username = $this->request->getPost('user');
        if($username!=null){
            if(!(Users::findFirst("username='$username'"))){
                echo "<span class='not-avl'>Username tersedia</span>";
            }else{
                echo "<span class='avl'>Username tidak tersedia</span>";
            }
        }
    }

    public function registerAction()
    {
        if($this->request->isPost())
        {
            $random = new \Phalcon\Security\Random();
            $data = $_POST;
            $validation = new MyValidator();

            $messages = $validation->validate($data);

            if (count($messages)) {
                $this->flashSession->error('Registrasi Gagal, mohon cek kembali data');
                foreach ($messages as $message) {
                    $pesan[$message->getField()] = $message->getMessage();
                    $this->flashSession->error($message->getMessage());
                }

                $this->response->redirect('');
                return;
            }
            // if(!$form->isValid($this->request->getPost())){
            //     $this->flashSession->error('Register gagal, mohon cek kembali data');
            //     $this->response->redirect('register');
            // }
            // else{
            $user = new Users();
            $username = $this->request->getPost('username');
            if(!(Users::findFirst("username='$username'"))){
                $nama = $this->request->getPost('nama');
                $telepon = $this->request->getPost('telepon');
                $email = $this->request->getPost('email');
                $password = $this->security->hash($this->request->getPost('password'));
                $repassword = $this->request->getPost('repassword');
                if($this->security->checkHash($repassword,$password)){
                    $user->username = $username;
                    $user->email = $email;
                    $user->password = $password;
                    $user->telepon = $telepon;
                    $user->nama = $nama;
                    $user->admin = 0;
                    if($user->save() === false)
                    {
                        $this->view->disable();
                        $this->flashSession->error('Register gagal, mohon cek kembali data');
                        $this->response->redirect();
                    }
                    else{
                        $this->view->disable();
                        $this->flashSession->success('Register Sukses');
                        $this->response->redirect('');
                    }
                }
            }
            else{
                $this->response->redirect('');
            }
            // }
        }
    }

    public function loginAction()
    {
        $username = $this->request->getPost('username');
        $password = $this->request->getPost('password');

        $user = Users::findFirst("username='$username'");
        if($user)
        {
            if($this->security->checkHash($password,$user->password)){
                if($user->admin){
                    $this->session->set(
                        'auth', $user
                    );
                    $this->response->redirect('admin_page');    
                }else{
                    $this->session->set(
                        'auth', $user
                    ); 
                }
            }
        }
        $this->response->redirect('');

    }

    public function logoutAction()
    {
        $this->session->destroy();
        return $this->response->redirect('');
    }

}