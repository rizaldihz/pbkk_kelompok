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
                        <h2 class="text-center" style="color:white">Cari Wisata</h2>
                        <br><br>
                    </div>
                </div>
            </div>
             <div class="row">
                <div class="col-lg-12 ml-auto mr-auto">
                    <form action="{{url('cari')}}" method="post">
                        <div class="form-container">
                            <div class="row">
                                <div class="col-9 pull-right">
                                    <div class="box-select">
                                        <input type="text" name="cari" style="height:60px">
                                    </div>
                                </div>
                                <div class="col-3">
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
                                    <div class="button-box"><a href="{{url('destinasi/'~dest.id)}}" class="button button-black">Lihat Detail</a></div>
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
  </div>   
  <!--End of Bg White--> 
</div>    
<!--End of Main Wrapper Area--> 
{% endblock %}