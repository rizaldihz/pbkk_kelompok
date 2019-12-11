{% extends '../layout/index.volt' %}

{% block title %}Tambah Donasi{% endblock %}

{% block content %}
<div class="content-wrapper">
  <section class="content-header">
      <h1>Tambah Donasi</h1>
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
            <form action="{{url('donasi/tambah')}}" role="form" method="post" enctype="multipart/form-data">
              <div class="box-body">
                {{flashSession.output()}}
                <div class="row">
                  <div class="form-group col-xs-6">
                    <label for="judul">Judul Donasi</label>
                    {% if validasi['judul'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['judul']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="judul" placeholder="Judul Donasi">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="kebutuhan_id">Kebutuhan</label>
                    {% if validasi['kebutuhan_id'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['kebutuhan_id']}}</p>
                    {% endif %}
                    <select class="form-control select2" style="width: 100%;" name="kebutuhan_id">
                      {% for butuh in kebutuhan %}
                      <option value="{{butuh.id}}">{{butuh.nama}} - untuk {{butuh.resipien.nama}}</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="jumlah">Jumlah</label>
                    {% if validasi['jumlah'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['jumlah']}}</p>
                    {% endif %}
                    <input type="text" class="form-control" name="jumlah" placeholder="Jumlah">
                    <!-- <p class="help-block">Example block-level help text here.</p> -->
                  </div>
                  <div class="form-group col-xs-4">
                    <label for="bukti_donasi">File input</label>
                    <input type="file" id="exampleInputFile" name="bukti_donasi[]" accept=".jpg, .jpeg, .png" multiple>
                    <p class="help-block">Pilih Foto untuk bukti donasi</p>
                  </div>
                  <div class="form-group col-xs-12">
                    <label for="keterangan">Keterangan</label>
                    {% if validasi['keterangan'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['keterangan']}}</p>
                    {% endif %}
                    <textarea class="form-control" rows="5" placeholder="Latar belakang alasan membutuhkan donasi ..." name="keterangan"></textarea>
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="tipe">Jenis Donasi</label>
                    {% if validasi['donasi'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['donasi']}}</p>
                    {% endif %}
                    <div class="radio">
                      <label>
                        <input type="radio" class="minimal" name ="tipe" value="0"> Uang
                      </label>
                      <label>
                        <input type="radio" class="minimal" name ="tipe" value="1"> Barang
                      </label>
                    </div>
                  </div>
                  <div class="form-group col-xs-12">
                    <label for="tanggal">Tanggal</label>
                    {% if validasi['tanggal'] is defined %}
                      <p class="pull-right text-right text-danger">{{validasi['tanggal']}}</p>
                    {% endif %}
                    <input type="date" class="form-control" name="tanggal" placeholder="tanggal">
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