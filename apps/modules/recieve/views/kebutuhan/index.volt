{% extends '../layout/index.volt' %}

{% block title %}Kebutuhan Index{% endblock %}

{% block morecss%}
<link rel="stylesheet" href="{{url('adminlte/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css')}}">
{% endblock %}

{% block content %}
<div class="content-wrapper">
	<section class="content-header">
      <h1>Daftar Kebutuhan Saat Ini</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Examples</a></li>
        <li class="active">Blank page</li>
      </ol>
    </section>

    <section class="content">
      <!-- Default box -->
      <div class="box">
        <!-- <div class="box-header with-border">
          <h3 class="box-title">Title</h3>

          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip"
                    title="Collapse">
              <i class="fa fa-minus"></i></button>
            <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fa fa-times"></i></button>
          </div>
        </div> -->
        <div class="box-body">
          {% if session.get('auth').priviliges == 1 %}
          <div class="row">
            <div class="col-sm-3 pull-right text-right">
              <a href="{{url("kebutuhan/tambah")}}">
                <button class="btn btn-primary"><i class="fa fa-plus"></i> Tambah Kebutuhan</button>
              </a>
            </div>
          </div>
          {% endif %}
          </br>
	        <div class="table-responsive">
	          <table id="view-penerima" class="table table-bordered table-striped" width="100%">
	            <thead>
	            <tr>
	              <th style="width:30px">Nomor</th>
	              <th>Kebutuhan</th>
	              <th style="width:100px">Jumlah</th>
	              <th>Label</th>
	              <th>Resipien</th>
                {% if session.get('auth').priviliges == 1 %}
	              <th>Options</th>
                {% endif %}
	            </tr>
	            </thead>
	            <tbody>
	            
	            </tbody>
	            <!-- <tfoot>
	            <tr>
	              <th>Rendering engine</th>
	              <th>Browser</th>
	              <th>Platform(s)</th>
	              <th>Engine version</th>
	              <th>CSS grade</th>
	            </tr>
	            </tfoot> -->
	          </table>
	        </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
          Footer
        </div>
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
</div>
<div id="hapus" class="modal fade" id="modal-default">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Hapus?</h4>
      </div>
      <div class="modal-body" style="text-align: center;">
        <i class="fa fa-4x fa-warning" style="color:yellow"></i>
        <h4>Apakah Anda Yakin akan menghapus data ini?</h4>
        <input type="hidden" id="id" name="id">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
        <button id="confirm-delete" onclick="confirm()" type="button" class="btn btn-danger pull-left" data-dismiss="modal">Ya</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<div id="message" class="modal fade" id="modal-default">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Hapus Sukses</h4>
      </div>
      <div class="modal-body" style="text-align: center;">
        <i class="fa fa-4x fa-check-circle" style="color:green"></i>
        <p>Data resipien telah dihapus&hellip;</p>
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
<script src="{{url('adminlte/bower_components/datatables.net/js/jquery.dataTables.min.js')}}"></script>
<script src="{{url('adminlte/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js')}}"></script>
<script>
$(document).ready(function() {
  $('#view-penerima').DataTable({
    serverSide: true,
    ajax: {
        url: "{{url('kebutuhan')}}",
        method: 'POST'
    },
    columns: [
        {data: "id", searchable: false},
        {data: "knama"},
        {data: "jumlah"},
        {data: "lnama"},
        {data: "rnama"}
    ],
    {% if session.get('auth').priviliges == 1 %}
    columnDefs: [ {
  	  targets: [5],
  	  "render": function (data, type, row, meta) {
  	     return '<a href="{{url("kebutuhan/edit/'+row.id+'")}}"><button class="btn btn-primary">Edit</button></a>&nbsp;<button onclick="hapus('+row.id+')" class="btn btn-danger">Hapus</button>';
  	   }
  	}],
    {% endif %}
  });
});

function hapus(id)
{
  $('#hapus').modal('show');
  $('#id').val(id);
}

function confirm()
{
  $("#confirm-delete").prop("disabled", true);
  $.ajax({
    url : '{{url("kebutuhan/hapus")}}',
    type : 'POST',
    data : $("#id").serialize(),
    success: function(result) {
        // Do something with the result
        console.log(result);  
        $('#hapus').modal('hide');
        $('#view-penerima').DataTable().ajax.reload();
        $("#confirm-delete").prop("disabled", false);
        $("#message").modal('show');
    }
  });
}
</script>
{% endblock %}