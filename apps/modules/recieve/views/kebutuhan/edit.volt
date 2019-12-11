{% extends '../layout/index.volt' %}

{% block title %}Edit Data Kebutuhan{% endblock %}

{% block morecss %}
<style>
  .example-modal .modal {
    position: relative;
    top: auto;
    bottom: auto;
    right: auto;
    left: auto;
    display: block;
    z-index: 1;
  }

  .example-modal .modal {
    background: transparent !important;
  }
</style>
{% endblock %}

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
            <form id="edit" action="{{url('kebutuhan/edit')}}" role="form" method="post" enctype="multipart/form-data">
              <input type="hidden" name="id" value="{{kebutuhan.id}}">
              <div class="box-body">
                <div class="row">
                  <div class="form-group col-xs-6">
                    <label for="nama">Nama</label>
                    <p class="pull-right text-right text-danger" style="display:none" id="nama"></p>
                    <input type="text" class="form-control" name="nama" placeholder="Nama Kebutuhan" value="{{kebutuhan.nama}}">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="jumlah">Jumlah</label>
                    <p class="pull-right text-right text-danger" style="display:none" id="jumlah"></p>
                    <input type="text" class="form-control" name="jumlah" placeholder="Jumlah" value="{{kebutuhan.jumlah}}">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="nominal_uang">Dalam Rupiah</label>
                    <p class="pull-right text-right text-danger" style="display:none" id="nominal_uang"></p>
                    <input type="text" class="form-control" name="nominal_uang" placeholder="Nominal uang" value="{{kebutuhan.nominal_uang}}">
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="label_id">Kategori</label>
                    <p class="pull-right text-right text-danger" style="display:none" id="label_id"></p>
                    <select class="form-control select2" style="width: 100%;" name="label_id">
                      {% for label in labels %}
                      <option value="{{label.id}}" {% if label.id == kebutuhan.label.id %}selected{% endif %}>{{label.nama}}</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="resipien_id">Resipien</label>
                    <p class="pull-right text-right text-danger" style="display:none" id="resipien_id"></p>
                    <select class="form-control select2" style="width: 100%;" name="resipien_id">
                      {% for res in resipien %}
                      <option value="{{res.id}}" {% if res.id == kebutuhan.resipien.id %}selected{% endif %}>{{res.nama}}</option>
                      {% endfor %}
                    </select>
                  </div>
                  <div class="form-group col-xs-6">
                    <label for="file">File input</label>
                    <input type="file" id="exampleInputFile" name="file[]" multiple>
                    <p class="help-block">Pilih Foto untuk menampilkan kebutuhan</p>
                  </div>
                  <div class="col-xs-12">
                    <label>File Kebutuhan (Gambar)</label>
                    <div class="text-center">
                    {% for img in images %}
                      {% if img != NULL %}
                        <img src="{{url(img)}}" style="height:200px;width:auto;">
                      {% endif %}
                    {% endfor %}
                    </div>
                  </div>
                  <div class="form-group col-xs-12">
                    <label for="keterangan">Keterangan</label>
                    <p class="pull-right text-right text-danger" style="display:none" id="keterangan"></p>
                    <textarea class="form-control" rows="5" placeholder="Latar belakang alasan membutuhkan donasi ..." name="keterangan">{{kebutuhan.keterangan}}</textarea>
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
<div id="message" class="modal fade" id="modal-default">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Edit Sukses</h4>
      </div>
      <div class="modal-body" style="text-align: center;">
        <i class="fa fa-4x fa-check-circle" style="color:green"></i>
        <p>Edit Data Kebutuhan Berhasil&hellip;</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
{% endblock %}

{% block morejs %}
<script src="{{url('adminlte/plugins/iCheck/icheck.min.js')}}"></script>
<script type="text/javascript">
$('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
    checkboxClass: 'icheckbox_minimal-blue',
    radioClass   : 'iradio_minimal-blue'
  });
$(document).ready(function (e) {
  $("#edit").on('submit',function(e) {
    e.preventDefault();
    $("#message").hide();
    // $('#loading').show();
    $.ajax({
      url: "{{url('kebutuhan/edit')}}", // Url to which the request is send
      type: "POST",             // Type of request to be send, called as method
      data: new FormData(this), // Data sent to server, a set of key/value pairs (i.e. form fields and values)
      contentType: false,       // The content type used when sending data to the server.
      cache: false,             // To unable request pages to be cached
      processData:false,        // To send DOMDocument or non processed data file it is set to false
      success: function(data)   // A function to be called if request succeeds
      {
        if(data['error'] != null){
          $("#message").modal('show');
        }
        else{
          $.each(data, function( key, value ) {
            $("#"+key).show();
            $("#"+key).html(value);
          });
        }
      }
    });
  });
});
</script>
{% endblock %}