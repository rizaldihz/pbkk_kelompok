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
				<div class="col-lg-12 col-md-12 text-center">
					<div class="single-footer-widget">
						<h3 class="text-white mb-26">GET IN TOUCH</h3>
						<p class="text-white mb-9"><i class="fa fa-phone"></i> +628 223 272 2879 </p>
						<p class="text-white mb-9"><i class="fa fa-envelope"></i> pbkk2@example.com</p>
						<p class="text-white mb-9"><i class="fa fa-globe"></i> www.pbkk2.com</p>
						<p class="text-white mb-9"><i class="fa fa-map-marker"></i> ITS</p>
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

