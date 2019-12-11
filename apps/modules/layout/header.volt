<!--Header Area Start-->
<header id="sticky-header" class="header-area">
    <!-- Header Top Start -->
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="logo"><a href="index.html"><h3><strong>Camp</strong>Tour</h3></a></div>
            </div>
            <div class="col-lg-9 d-none d-lg-block">
                <div class="pull-right">
                    <nav id="primary-menu">
                        <ul class="main-menu text-right">
                            <li><a href="{{url('')}}">Home</a></li>
                            <li><a href="{{url('destinasi')}}">Cari</a></li>
                            <li><a href="about.html">Kelola Wisata</a></li>
                            {% if session.has('auth')%}
                            <li><a href="#">{{session.get('auth').nama}}</a>
                                <ul class="dropdown">
                                    <li><a href="job-board.html">Profil</a></li>
                                     <li><a href="{{url('pesan')}}">Pesanan Saya</a></li>
                                    <li><a href="{{url('logout')}}">Sign Out</a></li>
                                </ul>
                            </li>
                            {% endif %}
                        </ul>
                    </nav>
                    {% if !session.has('auth')%}
                    <div class="login-btn">
                        <a class="modal-view button" href="#" data-toggle="modal" data-target="#register">Register</a>
                        <a class="modal-view button" href="#" data-toggle="modal" data-target="#productModal">Login</a>
                    </div>
                    {% endif %}
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu Area start -->
    <div class="mobile-menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="mobile-menu">
                        <nav id="dropdown">
                            <ul class="main-menu text-right">
                                <li><a href="index.html">Home</a></li>
                                <li><a href="job-board.html">Cari</a></li>
                                <li><a href="about.html">Booking</a></li>
                                <li><a href="about.html">Kelola Wisata</a></li>
                                <!-- <li><a href="#">Booking</a>
                                    <ul class="dropdown">
                                        <li><a href="job-board.html">Job Board</a></li>
                                        <li><a href="single-job-post.html">Single Job</a></li>
                                        <li><a href="job-details.html">Job Details</a></li>
                                        <li><a href="candidates.html">Candidates</a></li>
                                        <li><a href="resume.html">Resume</a></li>
                                        <li><a href="blog.html">Blog Page</a></li>
                                        <li><a href="blog-details.html">Blog Details</a></li>
                                        <li><a href="contact.html">Contact Us</a></li>
                                    </ul>
                                </li> -->
                                <!-- <li><a href="blog.html">Blog</a>
                                    <ul class="dropdown">
                                        <li><a href="blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact</a></li> -->
                            </ul>
                            <!-- <ul>
                                <li><a href="index.html">HOME</a>
                                    <ul>
                                        <li><a href="index.html">Home Version One</a></li>
                                        <li><a href="index-2.html">Home Version Two</a></li>
                                        <li><a href="index-3.html">Home Box Layout</a></li>
                                    </ul>
                                </li>
                                <li><a href="job-board.html">Job</a>
                                    <ul class="sub-menu">
                                        <li><a href="single-job-post.html">Single Job</a></li>
                                        <li><a href="job-details.html">Job Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="about.html">About</a></li>
                                <li><a href="#">Page</a>
                                    <ul class="sub-menu">
                                        <li><a href="job-board.html">Job Board</a></li>
                                        <li><a href="single-job-post.html">Single Job</a></li>
                                        <li><a href="job-details.html">Job Details</a></li>
                                        <li><a href="candidates.html">Candidates</a></li>
                                        <li><a href="resume.html">Resume</a></li>
                                        <li><a href="blog.html">Blog Page</a></li>
                                        <li><a href="blog-details.html">Blog Details</a></li>
                                        <li><a href="contact.html">Contact</a></li>
                                    </ul>
                                </li>
                                <li><a href="blog.html">Blog</a>
                                    <ul class="sub-menu">
                                        <li><a href="blog-details.html">Blog Details</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul> -->
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Mobile Menu Area end -->  
</header>
<!-- End of Header Area -->