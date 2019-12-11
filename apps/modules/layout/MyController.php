<?php

namespace MyLayout;

use Phalcon\Mvc\Controller;

class MyController extends Controller
{
    public function beforeExecuteRoute()
    {
    	if(!$this->session->has('auth')){
    		return $this->response->redirect('login');
    	}
    }

    public function is_loggedin()
    {
    	if(!$this->session->has('auth'))
    		return False;
    	return True;
    }

    public function is_admin()
    {
    	if($this->session->has('auth') && $this->session->get('auth')->priviliges == 1)
    		return True;
    	return False;
    }

}