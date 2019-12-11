{% extends '../layout/base.volt' %}

{% block title %}
{% endblock %}

{% block morecss%}
{% endblock %}

{% block content %}

<h1>Index</h1>
<p class='important'>Welcome on my awesome homepage.</p>

{% endblock %}

{% block footer %}
<!--Start of Footer Widget-area-->
<footer class="footer-area" style="background: rgba(0, 0, 0, 0) url('{{url("img/bg1.jpg")}}') no-repeat scroll center center / cover;">
	<div class="footer-widget-area ptb-80 pb-sm-30">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-5">
					<div class="single-footer-widget">
						<h3 class="text-white mb-26">GET IN TOUCH</h3>
						<span class="text-white mb-9"><i class="fa fa-phone"></i>+012 345 678 102 </span>
						<span class="text-white mb-9"><i class="fa fa-envelope"></i>info@example.com</span>
						<span class="text-white mb-9"><i class="fa fa-globe"></i>www.example.com</span>
						<span class="text-white mb-9"><i class="fa fa-map-marker"></i>ur address goes here,street.</span>
					</div>
				</div>                                
				<div class="col-lg-3 col-md-3">
					<div class="single-footer-widget">
						<h3 class="text-white mb-21">By Regions</h3>
						
					</div>
				</div>
				<div class="col-lg-3 d-md-none d-lg-block">
					<div class="single-footer-widget">
						<h3 class="text-white mb-21">Job Types</h3>
						
					</div>
				</div>
				<div class="col-lg-3 col-md-4">
					<div class="single-footer-widget">
						<h3 class="text-white mb-21">Keyword By Jobs</h3>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--End of Footer Widget-area-->
	<!-- Start of Footer area -->
	<div class="copyright-area text-center ptb-20">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="footer-text">
						<span class="text-white block">
							Copyright&copy; 
							<a href="#">PBKK2</a>
							.All right reserved.
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- End of Footer area -->
{% endblock %}

{% block morejs %}
{% endblock %}

