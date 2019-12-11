{% extends '../layout/index.volt' %}

{% block title %}Daftar Destinasi{% endblock %}

{% block content %}
<div class="as-mainwrapper">
  <!--Bg White Start-->
  <div class="bg-white">
    <!--Breadcrumb Banner Area Start-->
    <?php $img = explode('%%',$detail->gambar);?>
    <div class="breadcrumb-banner-area pt-94 pb-85" style="background:rgba(0, 0, 0, 0) url('{{url("img/find.jpg")}}') no-repeat scroll center top / cover;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="breadcrumb-text">
                        <h2 class="text-center" style="color:white">{{detail.judul}}</h2>
                        <div class="breadcrumb-bar">
                            <ul class="breadcrumb text-center m-0">
                                <li style="color:white"> Dikelola oleh:</li><br>
                                <li><a href="index.html" style="color:white">{{detail.users.nama}}</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--End of Breadcrumb Banner Area-->
    <div class="blog-area pt-130 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="single-blog hover-effect">
                        <div class="blog-image">
                            <img src="{{url(img[0])}}" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Start of Single Job Post Area-->
    <div class="single-job-post-area pb-130 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form action="#">
                        <div class="single-job-content">
                            <div class="title"><span>deskripsi wisata</span></div>
                            <div class="single-job-form">
                                <p>{{detail.deskripsi}}</p>
                            </div>
                            <div class="title"><span>paket yang ditawarkan</span></div>
                            <div class="area-title">
                                <div class="row">
                                    {% for pak in paket %}
                                    <div class="col-md-6">
                                        <div class="single-job-post">
                                            <div class="img-icon">
                                            </div>
                                            <div class="address">
                                                <h6>{{pak.nama}}</h6>
                                                <p><span>{{pak.deskripsi}}</span></p>
                                                <p>Rp {{pak.harga}}</p>
                                            </div>
                                            <div class="button-box"><a href="{{url('rencana/'~pak.id)}}" class="button button-black">Pesan paket</a></div>
                                        </div>                                    
                                    </div>
                                    {% endfor %}
                                </div>
                            </div>
                            <div class="buttonback">
                                <a href="#" class="button button-large-box lg-btn mr-20">back</a>
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