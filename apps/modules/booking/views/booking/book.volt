{% extends '../layout/index.volt' %}

{% block title %}Daftar Destinasi{% endblock %}

{% block content %}
<div class="as-mainwrapper">
  <!--Bg White Start-->
  <div class="bg-white">
    <!--Breadcrumb Banner Area Start-->
    <div class="breadcrumb-banner-area pt-94 pb-85" style="background:rgba(0, 0, 0, 0) url('{{url("img/find.jpg")}}') no-repeat scroll center top / cover;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-text">
                        <h2 class="text-center" style="color:white">Book Wisata</h2>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of Breadcrumb Banner Area-->
    <!--Start of Single Job Post Area-->
    <div class="single-job-post-area pt-130 pt-sm-60 pb-70 pb-sm-30">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 mr-auto ml-auto">
                    <form action="{{url('book')}}" method="post">
                        <div class="single-job-content">
                            <div class="title"><span>Pesan Wisata</span></div>
                            <div class="single-job-form">
                                <div class="single-info pb-14">
                                    <label for="title" class="uppercase pull-left m-0">Tempat Wisata</label>
                                    <div class="form-box fix">
                                        <input type="text" id="title" value="{{paket.destinasi.judul}}" disabled>
                                    </div>
                                </div>
                                <div class="single-info pb-14">
                                    <label for="desc" class="uppercase pull-left m-0">Nama Paket</label>
                                    <div class="form-box fix">
                                        <input type="text" id="desc" value="{{paket.nama}}" disabled>
                                    </div>
                                </div>
                                <div class="single-info pb-14">
                                    <label for="location" class="uppercase pull-left m-0">Harga Paket</label>
                                    <div class="form-box fix">
                                        <input type="text" id="location" value="Rp {{paket.harga}}" disabled>
                                    </div>
                                </div>
                                <div class="single-info pb-14">
                                    <label for="type" class="uppercase pull-left m-0">Deskripsi Paket</label>
                                    <div class="form-box fix">
                                        <textarea class="fix textarea" cols="30" rows="10" disabled>{{paket.deskripsi}}</textarea>
                                    </div>
                                </div>
                                <input type="hidden" name="id_paket" value="{{paket.id}}" style="display:none">
                            </div>
                            <div class="title"><span>Pemesan</span></div>
                            <div class="single-job-form">
                                <div class="single-info mb-14">
                                    <label for="company-name" class="uppercase pull-left m-0">Nama Peseman</label>
                                    <div class="form-box fix">
                                        <input type="text" id="company-name" value="{{session.get('auth').nama}}" disabled>
                                    </div>
                                </div>
                                <div class="single-info mb-14">
                                    <label for="company-name" class="uppercase pull-left m-0">Tanggal Mulai</label>
                                    <div class="form-box fix">
                                        <input type="date" name="mulai" class="form-control">
                                    </div>
                                </div>
                                <div class="single-info mb-14">
                                    <label for="company-name" class="uppercase pull-left m-0">Tanggal Hingga</label>
                                    <div class="form-box fix">
                                        <input type="date" name="sampai" class="form-control">
                                    </div>
                                </div>
                                <div class="single-info mb-14">
                                    <label for="company-name" class="uppercase pull-left m-0">Nama Pengunjung</label>
                                    <div class="form-box fix">
                                        <input type="text" id="nama-pengunjung" name="nama[]">
                                    </div>
                                </div>
                                <div class="single-info mb-14">
                                    <label for="company-name" class="uppercase pull-left m-0">Nomor KTP</label>
                                    <div class="form-box fix">
                                        <input type="text" id="nomor-ktp" name="no_ktp[]">
                                    </div>
                                </div>
                                <div class="single-info mb-14">
                                    <a href="#" class="tambahmember">(+) TAMBAH</a> 
                                    <a href="#" class="hapusmember">(-) HAPUS</a>
                                </div>
                                <div class="ml-160 mt-38">
                                    <input type="submit" class="button button-large-box">
                                </div>
                            </div>
                        </div>
                    </form>    
                </div>
            </div>
        </div>
    </div>
    <!--End of Single Job Post Area-->
  </div>   
  <!--End of Bg White--> 
</div>    
<!--End of Main Wrapper Area--> 
{% endblock %}
{% block morejs %}
<script >
$(document).ready(function(){
    var total_member =1;

    function tambahMember(){

        var n =total_member + 1;

        var isi = '<div class="single-info mb-14"><label for="company-name" class="uppercase pull-left m-0">Nama Pengunjung</label><div class="form-box fix"><input type="text" id="nama-pengunjung" name="nama[]"></div></div><div class="single-info mb-14"><label for="company-name" class="uppercase pull-left m-0">Nomor KTP</label><div class="form-box fix"><input type="text" id="nomor-ktp" nama="no_ktp[]"></div></div>'

        $('a.tambahmember').before(isi);
        $('#tambahmember'+total_member).slideDown('medium');
        total_member++;
    }

    function hapusMember(){
        total_member--;
        if(total_member<=1){
            total_member =1;
        }
        
        $('#tambahmember'+total_member).slideUp('medium',function(){
            $(this).remove();
        });
    }

    $('a.tambahmember').click(function(){
        tambahMember();
    });

    $('a.hapusmember').click(function(){
        hapusMember();
    });

});
</script>
{% endblock %}