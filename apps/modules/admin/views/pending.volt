{% extends '../layout/index.volt' %}

{% block title %}Destinasi Pending{% endblock %}

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
                        <h2 class="text-center" style="color:white">Destinasi Pending</h2>
                        <br><br>
                        {{flashSession.output()}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of Breadcrumb Banner Area-->
  </div>   
  <!--End of Bg White--> 
  <div class="canditates-area ptb-130 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title text-center ">
                        <h2>Kelola Transaksi</h2>
                        <p>Kelola Wisata dan Pesanan User</p>
                    </div>
                </div>
            </div>
            <div class="post-tab nav">
                <a class="nav-link active" data-toggle="tab" href="#featured">Wisata</a>
                <a class="nav-link" data-toggle="tab" href="#recent_job">Pesanan</a>
            </div>   
            <div class="tab-content">
                <div class="tab-pane active" id="featured">
                    {% for dest in destinasi %}
                    <div class="area-title">
                        <div class="single-job-post">
                            <?php $img = explode('%%',$dest->gambar);?>
                            <?php $bkt = explode('%%',$dest->bukti);?>
                            <div class="img-icon">
                                <img src="{{url(img[0])}}" alt="" style="max-width: 200px;">
                            </div>
                            <div class="address">
                                <h6>{{dest.judul}}</h6>
                                <p>{{dest.deskripsi}}</p>
                                <a href="{{url(bkt[0])}}">Bukti</a>
                            </div>
                            <div class="button-box">
                                <a href="{{url('terima/'~dest.id)}}" class="button button-black">Terima</a>
                            </div>
                            <div class="button-box">
                                <a href="{{url('tolak/'~dest.id)}}" class="button button-black">Tolak</a>
                            </div>
                        </div> 
                    </div>
                    {% endfor %}
                </div>
                <div class="tab-pane" id="recent_job">
                    {% for dest in pesan %}
                    <div class="area-title">
                        <div class="single-job-post">
                            <?php if($dest->bukti_transfer!=null) $bkt = explode('%%',$dest->bukti_transfer);?>
                            <?php $img = explode('%%',$dest->paket->destinasi->gambar);?>
                            <?php $count = count($dest->pengunjung);?>
                            <div class="img-icon">
                                <img src="{{url(img[0])}}" alt="" style="max-width: 200px;">
                            </div>
                            <div class="address">
                                <h6>Nama Paket: {{dest.paket.nama}}</h6>
                                <p>Deskripi: {{dest.paket.deskripsi}}</p>
                                <p>Berangkat: {{dest.mulai}}</p>
                                <p>Berangkat: {{dest.sampai}}</p>
                                <p>Jumlah Pengunjung: {{count}}</p>
                                {% if dest.bukti_transfer %}
                                <a href="{{url(bkt[0])}}">Bukti</a>
                                {% else %}
                                <p class="text-danger">Bukti Transfer Belum Dikirim</p>
                                {% endif %}
                            </div>
                            <div class="button-box">
                                <a href="{{url('terima/pesan/'~dest.id)}}" class="button button-black">Terima</a>
                            </div>
                            <div class="button-box">
                                <a href="{{url('tolak/pesan/'~dest.id)}}" class="button button-black">Tolak</a>
                            </div>
                        </div> 
                    </div>
                    {% endfor %}
                </div>
            </div>
        </div>
    </div>
</div>    

{% endblock %}