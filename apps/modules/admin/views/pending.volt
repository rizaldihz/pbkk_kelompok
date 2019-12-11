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
                <a href="{{url('/terima/'~dest.id)}}" class="button button-black">Terima</a>
            </div>
            <div class="button-box">
                <a href="{{url('/tolak/'~dest.id)}}" class="button button-black">Tolak</a>
            </div>
        </div> 
    </div>
    {% endfor %}
</div>    

{% endblock %}