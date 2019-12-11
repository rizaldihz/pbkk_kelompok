{% extends '../layout/index.volt' %}

{% block title %}Tambah Data Resipien{% endblock %}

{% block content %}
<div class="content-wrapper">
  <section class="content-header">
      <h1>Tambah Data Resipien</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <section class="content">

      <!-- Default box -->
      <div class="box box-primary">
            <!-- <div class="box-header with-border">
              <h3 class="box-title">Quick Example</h3>
            </div> -->
            <!-- /.box-header -->
            <!-- form start -->
            <form action="{{url('resipien/tambah')}}" role="form" method="post" enctype="multipart/form-data">
              <div class="box-body">
                {{flashSession.output()}}
                <div class="row">
                  <div class="form-group col-xs-6">
                    <label for="nama">Nama</label>
                    {% if validasi['nama'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['nama']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="nama" placeholder="Nama Penerima">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="alamat">Alamat</label>
                    {% if validasi['alamat'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['alamat']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="alamat" placeholder="Alamat Rumah">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="no_telp">Nomor Telepon</label>
                    {% if validasi['no_telp'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['no_telp']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="no_telp" placeholder="Nomor Telepon">
                    <!-- <p class="help-block">Example block-level help text here.</p> -->
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="ktp">KTP</label>
                    {% if validasi['ktp'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['ktp']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="ktp" placeholder="Nomor KTP">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="no_telp">Jenis Kelamin</label>
                    {% if validasi['jk'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['jk']}}</p>
                    {% endif %}
                    <div class="radio">
                      <label>
                        <input type="radio" class="minimal" name ="jk" value="L"> Laki-laki
                      </label>
                      <label>
                        <input type="radio" class="minimal" name ="jk" value="P"> Perempuan
                      </label>
                    </div>
                  </div>
                  <div class="form-group col-xs-12">
                    <label for="latar_belakang">Latar Belakang</label>
                    {% if validasi['latar_belakang'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['latar_belakang']}}</p>
                    {% endif %}
                    <textarea class="form-control" rows="5" placeholder="Latar belakang alasan membutuhkan donasi ..." name="latar_belakang"></textarea>
                  </div>
                  <div class="form-group col-xs-4">
                    <label for="bukti_gambar">File input</label>
                    <input type="file" id="exampleInputFile" name="bukti_gambar[]" accept=".jpg, .jpeg, .png" multiple>
                    <p class="help-block">Pilih Foto untuk bukti</p>
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
            <!-- form end -->
          </div>
      <!-- /.box -->

    </section>
</div>
{% endblock %}

{% block morejs %}
<script src="{{url('adminlte/plugins/iCheck/icheck.min.js')}}"></script>
<script type="text/javascript">
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
    radioClass   : 'iradio_minimal-blue'
  });
</script>
{% endblock %}