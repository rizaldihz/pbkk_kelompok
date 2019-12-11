{% extends '../layout/index.volt' %}

{% block title %}Selamat Datang{% endblock %}

{% block content %}
<div class="as-mainwrapper">
  <!--Bg White Start-->
  <div class="bg-white">
    <!--Start of Slider Area-->
    <div class="slider-area">
        <div class="preview-2">
            <div id="nivoslider" class="slides">    
                <img src="{{url('img/g1.jpg')}}" alt="" title="#slider-1-caption1"/>
                <!-- <img src="{{url('jobhere/images/slider/1.jpg')}}" alt="" title="#slider-1-caption2"/> -->
            </div> 
            <div id="slider-1-caption1" class="nivo-html-caption nivo-caption">
                <div class="banner-content slider-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="text-content-wrapper">
                                    <div class="text-content text-center">
                                        <h4 class="title2 wow bounceInLeft text-white mb-16" data-wow-duration="3s" data-wow-delay="0s">Wisata tak terbatas jarak.</h4>
                                        <h1 class="title1 wow bounceInRight text-white mb-16" data-wow-duration="3s" data-wow-delay="0s">Temukan Destinasi anda sekarang</h1>
                                        <p class="sub-title wow bounceInRight hidden-xs" data-wow-duration="3s" data-wow-delay="1s"> Ada banyak Tempat Wisata indah yang menunggu untuk anda kunjungi</p>
                                        <!-- <div class="banner-readmore wow bounceInUp mt-35" data-wow-duration="3s" data-wow-delay="2s">
                                            <a class="button slider-btn" href="#">ABOUT US</a>                    
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>  
        </div>
    </div>
    <!--End of Slider Area-->
    <!-- Search Form Start -->
    <div class="search-catestyle2">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 ml-auto mr-auto">
                    <div class="job-search-content text-center">
                        <form action="{{url('cari')}}" method="post">
                            <div class="form-container">
                                <div class="row">
                                    <div class="col-8">
                                        <div class="box-select">
                                            <input type="text" name="cari" style="height:60px">
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="box-select">
                                            <div class="select">
                                                <button type="button">Search</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                        </form> 
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Form End -->
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
                <div class="tab-content">
                    <div class="tab-pane active" id="featured">
                        <div class="row">
                            {% for dest in destinasi %}
                            <?php $img = explode('%%',$dest->gambar);?>
                            <div class="col-md-6">
                                <div class="single-job-post">
                                     <div class="img-icon">
                                        <img src="{{url(img[0])}}" alt="">
                                    </div>
                                    <div class="address">
                                        <h6>{{dest.judul}}</h6>
                                        <p>{{dest.deskripsi}}</p>
                                    </div>
                                    <div class="button-box"><a href="#" class="button button-black">Lihat Detail</a></div>
                                </div>                                    
                            </div>
                            {% endfor %}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Job Post Area -->
    <!--End of Testimonial Area-->
  </div>   
  <!--End of Bg White--> 
</div>    
<!--End of Main Wrapper Area--> 
{% endblock %}