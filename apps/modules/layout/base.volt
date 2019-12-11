<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>{% block title %}{% endblock %} || CampTour</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- favicon
    ============================================ -->        
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
    
    <!-- Google Fonts
    ============================================ -->        
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet"> 
    
    <!-- All css files are included here
    ============================================ -->    
    <!-- Bootstrap CSS
    ============================================ -->        
    <link rel="stylesheet" href="{{url('jobhere/css/bootstrap.min.css')}}"> 
    
    <!-- This core.css file contents all plugins css file
    ============================================ -->
    <!-- Nice select css
    ============================================ -->
    <link rel="stylesheet" href="{{url('jobhere/css/nice-select.css')}}">
    <!-- This core.css file contents all plugins css file
    ============================================ -->
    <link rel="stylesheet" href="{{url('jobhere/css/core.css')}}">
    
    <!-- Theme shortcodes/elements style
    ============================================ -->  
    <link rel="stylesheet" href="{{url('jobhere/css/shortcode/shortcodes.css')}}">
    
    <!--  Theme main style
    ============================================ -->  
    <link rel="stylesheet" href="{{url('jobhere/style.css')}}">
    
    <!-- Color CSS
    ============================================ -->
    <link rel="stylesheet" href="{{url('jobhere/css/plugins/color.css')}}">
    
    <!-- Responsive CSS
    ============================================ -->
    <link rel="stylesheet" href="{{url('jobhere/css/responsive.css')}}">
    
    <!-- Modernizr JS -->
    <script src="{{url('jobhere/js/vendor/modernizr-2.8.3.min.js')}}"></script>
</head>
<body>
<div class="as-mainwrapper">
  {% include '../layout/header.volt' %}
  {% block content%}
  {% endblock %}
  {% block footer %}
  {% endblock %}
</div>
{% include '../layout/register.volt' %}
{% include '../layout/login.volt' %}
  <!-- jQuery 3 -->
<!--<script src="{{url('adminlte/bower_components/jquery/dist/jquery.min.js')}}"></script>-->
<!-- jQuery UI 1.11.4 -->
<!--<script src="{{url('adminlte/bower_components/jquery-ui/jquery-ui.min.js')}}"></script>-->
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- jquery latest version
========================================================= -->   
<script src="{{url('jobhere/js/vendor/jquery-1.12.4.min.js')}}"></script>

<!-- Bootstrap framework js
========================================================= -->          
<script src="{{url('jobhere/js/bootstrap.min.js')}}"></script> 
<script src="{{url('jobhere/js/popper.js')}}"></script>

<!-- Owl Carousel js
========================================================= -->       
<script src="{{url('jobhere/js/owl.carousel.min.js')}}"></script>
    
<!-- Jquery nice select js 
========================================================= -->   
<script src="{{url('jobhere/js/jquery.nice-select.min.js')}}"></script>

<!-- nivo slider js
========================================================= -->       
<script src="{{url('jobhere/lib/nivo-slider/js/jquery.nivo.slider.js')}}"></script>
<script src="{{url('jobhere/lib/nivo-slider/home.js')}}"></script>

<!-- Js plugins included in this file
========================================================= -->   
<script src="{{url('jobhere/js/plugins.js')}}"></script>

<!-- Video Player JS
========================================================= -->           
<script src="{{url('jobhere/js/jquery.mb.YTPlayer.js')}}"></script>

<!-- AJax Mail JS
========================================================= -->           
<script src="{{url('jobhere/js/ajax-mail.js')}}"></script>

<!-- Mail Chimp JS
========================================================= -->           
<script src="{{url('jobhere/js/jquery.ajaxchimp.min.js')}}"></script>

<!-- Waypoint Js
========================================================= -->   
<script src="{{url('jobhere/js/waypoints.min.js')}}"></script>

<!-- Main js file contents all jQuery plugins activation
========================================================= -->       
<script src="{{url('jobhere/js/main.js')}}"></script>
{% block morejs %}  
{% endblock %}
</body>