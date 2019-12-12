{% extends '../layout/index.volt' %}

{% block title %}Ajukan Wisata{% endblock %}

{% block content %}
<div class="as-mainwrapper">
    <!--Bg White Start-->
    <div class="bg-white">
        <!--Breadcrumb Banner Area Start-->
        <div class="breadcrumb-banner-area pt-94 pb-85"
            style="background:rgba(0, 0, 0, 0) url('{{url("img/find.jpg")}}') no-repeat scroll center top / cover;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="breadcrumb-text">
                            <h2 class="text-center" style="color:white">Ajukan Wisata</h2>
                            <br><br>
                            {{flashSession.output()}}
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
                    <div class="post-tab nav">
                        <a class="nav-link active" data-toggle="tab" href="#featured">Ajukan</a>
                        <a class="nav-link" data-toggle="tab" href="#recent_job">Kelola</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="featured">
                            <div class="row">
                                <form action="{{url('kelola')}}" method="post" enctype="multipart/form-data" class="col-12">
                                    <div class="single-job-content">
                                        <div class="title"><span>Wisata yang Anda Ajukan</span></div>
                                        <div class="single-job-form">
                                            <div class="single-info mb-14">
                                                <label for="judul" class="uppercase pull-left m-0">Nama
                                                    Destinasi</label>
                                                <div class="form-box fix">
                                                    <input required type="text" id="judul" name="judul" value="">
                                                </div>
                                            </div>
                                            <div class="single-info mb-14">
                                                <label for="deskripsi" class="uppercase pull-left m-0">Deskripsi</label>
                                                <div class="form-box fix">
                                                    <input required type="text" id="deskripsi" name="deskripsi"
                                                        value="">
                                                </div>
                                            </div>
                                            <div class="single-info mb-14 fix">
                                                <label class="uppercase pull-left m-0">Gambar</label>
                                                <div class="uploader fix pull-left fileupload">
                                                    <input required type="file" id="gambar" name="gambar">
                                                    <span class="filename">Upload gambar tempat wisata</span>
                                                    <span class="action"><i class="zmdi zmdi-folder"></i>Browse</span>
                                                </div>
                                            </div>
                                            <div class="single-info mb-14 fix">
                                                <label class="uppercase pull-left m-0">Bukti</label>
                                                <div class="uploader fix pull-left fileupload">
                                                    <input required type="file" id="bukti" name="bukti">
                                                    <span class="filename">Upload bukti tempat wisata</span>
                                                    <span class="action"><i class="zmdi zmdi-folder"></i>Browse</span>
                                                </div>
                                            </div>
                                            <div class="ml-160 mt-38">
                                                <button type="submit" class="button button-large-box">Submit</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="tab-pane" id="recent_job">
                            <div class="row">
                                {% if user.destinasi %}
                                {% for dest in user.destinasi %}
                                <div class="area-title col-12">
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
                                            <a  href="{{url('paket/'~dest.id)}}">
                                                <button class="btn btn-primary" {% if dest.status == 'pending' %} disabled {% endif %}>Tambah Paket</button>
                                            </a>
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
    </div>
    <!--End of Bg White-->
</div>
{% endblock %}