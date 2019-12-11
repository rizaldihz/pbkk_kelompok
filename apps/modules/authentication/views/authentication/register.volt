{% extends '../layout/login.volt' %}

{% block title %}Daftar{% endblock %}

{% block content %}

<div class="register-box" style="width:600px">
  <div class="register-logo">
    <a href="../../index2.html"><b>Broker</b>Sedekah</a>
  </div>

  <div class="register-box-body">
    <p class="login-box-msg">Daftar Menjadi Donatur</p>

    <form action="{{url('register')}}" method="post">
      <div class="row form-group">
        <div class="col-sm-6">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Nama Lengkap" name="nama">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="email" class="form-control" placeholder="Email" name="email">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Password" name="password">
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Ketik Ulang password" name="re-password">
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Nomor KTP" name="ktp">
            <span class="glyphicon glyphicon-user form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="text" class="form-control" placeholder="Alamat" name="alamat">
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback" style="margin-bottom:28px">
              <label>
                <input type="radio" class="minimal" name ="jk" value="L"> Laki-laki
              </label>
              <label>
                <input type="radio" class="minimal" name ="jk" value="P"> Perempuan
              </label>
          </div>
          <div class="form-group has-feedback">
            <input type="date" class="form-control" placeholder="Tanggal Lahir" name="tanggal_lahir">
            <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
          </div>
        </div>
      </div>
      <div class="row form-group">
          <div class="col-xs-8">
                <input type="checkbox" required> Saya menyetujui <a href="#">terms</a>
          </div>
          <!-- /.col -->
          <div class="col-xs-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Register</button>
          </div>
          <!-- /.col -->
      </div>
    </form>

    <br>

    <a href="login.html" class="text-center">Masuk ke akun</a>
  </div>
  <!-- /.form-box -->
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

{% block morejs%}
<script src="{{url('adminlte/plugins/iCheck/icheck.min.js')}}"></script>
<script type="text/javascript">
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
    radioClass   : 'iradio_minimal-blue'
  });
</script>
{% endblock %}