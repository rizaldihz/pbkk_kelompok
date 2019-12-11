{% extends '../layout/index.volt' %}

{% block title %}Tambah Kebutuhan{% endblock %}

{% block morecss %}
<link rel="stylesheet" href="{{url('adminlte/bower_components/select2/dist/css/select2.min.css')}}">
<link rel="stylesheet" href="{{url('adminlte/dist/css/AdminLTE.min.css')}}">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="{{url('adminlte/dist/css/skins/_all-skins.min.css')}}">
{% endblock %}

{% block content %}
<div class="content-wrapper">
  <section class="content-header">
      <h1>Tambah Kebutuhan</h1>
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
            {{flashSession.output()}}
            <form action="{{url('kebutuhan/tambah')}}" role="form" method="post" enctype="multipart/form-data">
              <div class="box-body">
                <div class="row">
                  <div class="form-group col-xs-6">
                    <label for="nama">Nama</label>
                    {% if validasi['nama'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['nama']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="nama" placeholder="Nama Kebutuhan">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="jumlah">Jumlah</label>
                    {% if validasi['jumlah'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['jumlah']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="jumlah" placeholder="Jumlah">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="nominal_uang">Dalam Rupiah</label>
                    {% if validasi['nominal_uang'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['nominal_uang']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="nominal_uang" placeholder="Nominal uang">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="label_id">Kategori</label>
                    {% if validasi['label_id'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['label_id']}}</p>
                    {% endif %}
                    <select class="form-control select2" style="width: 100%;" name="label_id">
                      {% for label in labels %}
                      <option value="{{label.id}}">{{label.nama}}</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="resipien_id">Resipien</label>
                    {% if validasi['resipien_id'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['resipien_id']}}</p>
                    {% endif %}
                    <select class="form-control select2" style="width: 100%;" name="resipien_id">
                      {% for res in resipien %}
                      <option value="{{res.id}}">{{res.nama}}</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="file">File input</label>
                    <input type="file" id="exampleInputFile" name="file[]" multiple>
                    <p class="help-block">Pilih Foto untuk menampilkan kebutuhan</p>
                  </div>
                  <div class="form-group col-xs-12">
                    <label for="keterangan">Keterangan</label>
                    {% if validasi['keterangan'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['keterangan']}}</p>
                    {% endif %}
                    <textarea class="form-control" rows="5" placeholder="Latar belakang alasan membutuhkan donasi ..." name="keterangan"></textarea>
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
<script src="{{url('adminlte/bower_components/select2/dist/js/select2.full.min.js')}}"></script>
<script type="text/javascript">
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
    radioClass   : 'iradio_minimal-blue'
  });
$('.select2').select2();
</script>
{% endblock %}