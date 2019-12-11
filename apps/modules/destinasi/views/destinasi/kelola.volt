{% extends '../layout/index.volt' %}

{% block title %}Ajukan Wisata{% endblock %}

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
                        <h2 class="text-center" style="color:white">Ajukan Wisata</h2>
                        <br><br>
                        {{flashSession.output()}}
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
                    <form action="{{url('kelola')}}" method="post" enctype="multipart/form-data">
                        <div class="single-job-content">
                            <div class="title"><span>Wisata yang Anda Ajukan</span></div>
                            <div class="single-job-form">
                                <div class="single-info mb-14">
                                    <label for="judul" class="uppercase pull-left m-0">Nama Destinasi</label>
                                    <div class="form-box fix">
                                        <input required type="text" id="judul" name="judul" value="">
                                    </div>
                                </div>
                                <div class="single-info mb-14">
                                    <label for="deskripsi" class="uppercase pull-left m-0">Deskripsi</label>
                                    <div class="form-box fix">
                                        <input required type="text" id="deskripsi" name="deskripsi" value="">
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
        </div>
    </div>
    <!--End of Single Job Post Area-->
  </div>   
  <!--End of Bg White--> 
</div>    
{% endblock %}