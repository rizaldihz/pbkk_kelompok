{% extends '../layout/login.volt' %}

{% block title %}Masuk{% endblock %}

{% block content %}

<div class="login-box">
  <div class="login-logo">
    <a href="../../index2.html"><b>Broker</b>Sedekah</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Log in untuk mengakses akun</p>
    {{ flashSession.output() }}
    <form action="{{url('login')}}" method="post">
      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="Nomor KTP" name="ktp">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" name="password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-xs-12">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>

    <br>

    <a href="#">Lupa Password</a><br>
    <a href="{{url('register')}}" class="text-center">Daftar Menjadi Donatur</a>

  </div>
  <!-- /.login-box-body -->
</div>
{% endblock %}

{% block footer %}
<footer class="footer">
	<div class="container text-center">
			&copy; Copyright 2012-present. 
			All rights reserved.
	</div>
</footer>
{% endblock %}

{% block moreJS%}
<script src="{{url('adminlte/plugins/iCheck/icheck.min.js')}}"></script>
{% endblock %}