{% extends '../layout/index.volt' %}

{% block title %}Daftar Destinasi{% endblock %}

{% block content %}
<div class="as-mainwrapper">
{{flashSession.output()}}
  <!--Bg White Start-->
  <div class="bg-white">
    <!--Breadcrumb Banner Area Start-->
    <div class="breadcrumb-banner-area pt-94 pb-85" style="background:rgba(0, 0, 0, 0) url('{{url("img/find.jpg")}}') no-repeat scroll center top / cover;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-text">
                        <h2 class="text-center" style="color:white">Paket yang telah di pesan</h2>
                        <br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of Breadcrumb Banner Area-->
    <!--Start of Job Post Area-->
    <div class="canditates-area ptb-130 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center ">
                        <h2>Daftar Wisata</h2>
                        <p>Daftar tempat wisata yang menunggu anda kunjungi</p>
                    </div>
                </div>
            </div>
            <div class="all-job-post">                           
                <!-- Tab panes -->
                <!-- Nav tabs -->
                <div class="post-tab nav">
                    <a class="nav-link active" data-toggle="tab" href="#featured">Rencana Booking</a>
                    <a class="nav-link" data-toggle="tab" href="#recent_job">Riwayat Booking</a>
                </div>       
                <div class="tab-content">
                    <div class="tab-pane active" id="featured">
                        <div class="row">
                            {% if pesan == null %}
                            <div class="col-12 text-center">
                            <h1>Anda belum memesan apa-apa</h1>
                            </div>
                            {% else %}
                            {% for cart in pesan %}
                            <div class="col-md-6">
                                <div class="single-job-post">
                                     <div class="img-icon">
                                    </div>
                                    <div class="address">
                                        <h6 >Nama Destinasi : {{cart['judul']}}</h6>
                                        <p >Paket : {{cart['nama']}}</p>
                                        <p >Harga : {{cart['harga']}}</p>
                                        <a href="{{url('destinasi/'~ cart['id_wisata'])}}"><button class="button btn-primary"><i class="fa fa-history"></i></button></a>
                                        <a href="{{url('book/'~ cart['id'])}}"><button class="button btn-success"><i class="fa fa-check"></i></button></a>
                                        <a href="{{url('rencana/hapus/'~ cart['id'])}}"><button class="button btn-danger"><i class="fa fa-times"></i></button></a>
                                    </div>
                                    <!-- <div class="button-box"><a href="{{url('destinasi/'~dest.id)}}" class="button button-black">Lihat Detail</a></div> -->
                                </div>                                    
                            </div>
                            {% endfor %}
                            {% endif %}
                        </div>
                    </div>
                    <div class="tab-pane" id="recent_job">
                        <div class="row">
                            {% if pesanan == null%}
                            <div class="col-12 text-center">
                            <h1>Anda belum memesan apa-apa</h1>
                            </div>
                            {% else %}
                            {% for pesan in pesanan %}
                            <div class="col-md-6">
                                <div class="single-job-post">
                                     <div class="img-icon">
                                        <?php $img = explode('%%',$pesan->paket->destinasi->gambar);?>
                                        <img src="{{img[0]}}" style="width:200px">
                                    </div>
                                    <div class="address">
                                        <h6 >Destinasi : {{pesan.paket.destinasi.judul}}</h6>
                                          <p >Paket : {{pesan.paket.nama}}</p>
                                          <p >Harga : Rp {{pesan.paket.harga}}</p>
                                          <p >Pengelola : {{pesan.paket.destinasi.users.nama}}</p>
                                          <p >Tiba : {{pesan.mulai}}</p>
                                          <p >Pulang : {{pesan.sampai}}</p>
                                          <br>
                                          {% if  pesan.bukti_transfer == null %}
                                          <form action="{{url('book')}}" method="post" enctype="multipart/form-data">
                                            <input type="hidden" name="id_pesan" value="{{pesan.id}}">
                                            <label for='bukti_transfer'>Upload Bukti Transfer Disini</label>
                                            <input type="file" name="bukti_transfer">
                                            <input type="submit" class="button">
                                          </form>
                                            {% elseif pesan.bukti_wisata == null %}
                                            <p class="text-warning">Menunggu Konfirmasi</p>
                                          {% elseif pesan.bukti_wisata != null %}
                                          <a href="{{url(pesan.bukti_wisata)}}">Bukti</a>
                                          {% endif %}
                                    </div>
                                </div>                                    
                            </div>
                            {% endfor %}
                            {% endif %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Job Post Area -->
  </div>   
  <!--End of Bg White--> 
</div>    
<!--End of Main Wrapper Area--> 
{% endblock %}