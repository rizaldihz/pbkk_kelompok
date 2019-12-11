{% extends '../layout/index.volt' %}

{% block title %}Selamat Datang{% endblock %}

{% block content %}
<div class="as-mainwrapper">
  <!--Bg White Start-->
  <div class="bg-white">
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
    <!--Testimonial Area Start-->
    <div class="testimonial-area bg-2 text-center fix ptb-100 ptb-sm-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 ml-auto mr-auto">
                    <div class="section-title text-white">
                        <h2>Client Say</h2>
                        <p>Lorem ipsum dolor sit amet, contetur adipisil elit sed do</p>
                    </div>
                    <div class="testimonial-carousel carousel-style-one">
                        <div class="single-testimonial">
                            <div class="testimonial-text pt-46">
                                <p class="text-white p-0">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tem incidi ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostru exercitation ullamco laboris nisi ut aliquip</p>
                            </div>
                              <div class="testimonial-info">
                                <span class="testimonial-name text-white">Kevin Roberts</span>
                            </div>                                       
                        </div>
                    </div> 
                </div>  
            </div>
        </div>
    </div>
    <!--End of Testimonial Area-->
  </div>   
  <!--End of Bg White--> 
</div>    
<!--End of Main Wrapper Area--> 
{% endblock %}