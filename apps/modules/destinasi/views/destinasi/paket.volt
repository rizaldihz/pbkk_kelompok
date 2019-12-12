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
                            <h2 class="text-center" style="color:white">Tambah Paket Wisata</h2>
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
                            <h2>Tambah Paket</h2>
                        </div>
                    </div>
                </div>
                <div class="all-job-post">
                            <div class="row">
                                <form action="{{url('paket/'~destinasi.id)}}" method="post" enctype="multipart/form-data" class="col-12">
                                    <div class="single-job-content">
                                        <div class="title"><span>Tambah Paket Wisata Anda</span></div>
                                        <div class="single-job-form">
                                            <input type="hidden" name="id_wisata" value="{{destinasi.id}}">
                                            <div class="single-info mb-14">
                                                <label for="nama" class="uppercase pull-left m-0">Nama
                                                    Paket</label>
                                                <div class="form-box fix">
                                                    <input required type="text" id="nama" name="nama" value="">
                                                </div>
                                            </div>
                                            <div class="single-info mb-14">
                                                <label for="deskripsi" class="uppercase pull-left m-0">Deskripsi</label>
                                                <div class="form-box fix">
                                                    <input required type="text" id="deskripsi" name="deskripsi"
                                                        value="">
                                                </div>
                                            </div>
                                            <div class="single-info mb-14">
                                                <label for="harga" class="uppercase pull-left m-0">Harga</label>
                                                <div class="form-box fix">
                                                    <input required type="number" id="harga" name="harga"
                                                        value="">
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of Bg White-->
</div>
{% endblock %}