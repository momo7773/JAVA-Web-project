<%--
  Created by IntelliJ IDEA.
  User: taoyi
  Date: 2018/12/21
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="Resources/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="Resources/css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="Resources/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="Resources/css/bootstrap.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="Resources/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="Resources/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="Resources/css/responsive.css">
    <!-- customizer style css -->
    <!-- <link rel="stylesheet" href="../css/style-customizer.css"> -->
    <link href="#" data-style="styles" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="Resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="Resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="Resources/css/bootstrap-table-filter-control.css">

    <title>Title</title>

    <script src="Resources/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="Resources/js/vendor/modernizr-2.8.3.min.js" type="text/javascript"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="Resources/js/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="Resources/js/raphael.min.js"></script>
    <script src="Resources/js/morris.min.js"></script>
    <script src="Resources/js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="Resources/js/sb-admin-2.js"></script>
</head>
<body>
<div class="preloader">
    <div class="loading-center">
        <div class="loading-center-absolute">
            <div class="object object_one"></div>
            <div class="object object_two"></div>
            <div class="object object_three"></div>
        </div>
    </div>
</div>


<div class="wrapper">
    <!--Header section start-->
    <div class="header-section about-us">
        <div class="bg-opacity"></div>
        <div class="top-header sticky-header">
            <div class="top-header-inner">
                <div class="container">
                    <div class="mgea-full-width">
                        <div class="row">
                            <div class="col-md-2 col-sm-2 col-xs-12">
                                <div class="logo mt-15">
                                    <a href="index.html"><img src="images/logo/logo.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-md-10 col-sm-10 hidden-xs">
                                <div class="header-top ptb-10">
                                    <div class="adresses">
                                        <div class="phone">
                                            <p>call <span>+012 345 678 102 </span></p>
                                        </div>
                                        <div class="email">
                                            <p>Email: <span>info@example.com</span></p>
                                        </div>
                                    </div>
                                    <div class="social-links">
                                        <a href="#"><i class="mdi mdi-facebook"></i></a>
                                        <a href="#"><i class="mdi mdi-rss"></i></a>
                                        <a href="#"><i class="mdi mdi-google-plus"></i></a>
                                        <a href="#"><i class="mdi mdi-pinterest"></i></a>
                                        <a href="#"><i class="mdi mdi-instagram"></i></a>
                                    </div>
                                </div>
                                <div class="menu mt-20">
                                    <div class="menu-list hidden-sm hidden-xs">
                                        <nav>
                                            <ul>
                                                <li><a href="index.html">home</a></li>
                                                <li><a href="about-us.html">About</a></li>
                                                <li><a href="gallery.html">Gallery</a></li>
                                                <li><a href="#">pages<i class="fa fa-angle-down"></i></a>
                                                    <ul class="dropdown_menu">
                                                        <li><a href="404.html">404</a></li>
                                                        <li><a href="booking-information.html">Booking Information</a></li>
                                                        <li><a href="personal-information.html">Personal Information</a></li>
                                                        <li><a href="payment-information.html">Parment Information</a></li>
                                                        <li><a href="booking-done.html">Booking Done</a></li>
                                                        <li><a href="room-booking.html">Room booking</a></li>
                                                        <li><a href="news.html">News</a></li>
                                                        <li><a href="gallery.html">Gallery</a></li>
                                                        <li><a href="staff.html">Staff</a></li>
                                                        <li><a href="our-room.html">Room</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="contact-us.html">Contact</a></li>
                                            </ul>
                                        </nav>
                                    </div>
                                    <div class="search-bar-icon">
                                        <a class="search-open" href="#"><i class="fa fa-search"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Mobile menu start -->
            <div class="mobile-menu-area hidden-lg hidden-md">
                <div class="container">
                    <div class="col-md-12">
                        <nav id="dropdown">
                            <ul>
                                <li><a href="index.html">home</a></li>
                                <li><a href="about-us.html">About</a></li>
                                <li><a href="gallery.html">Gallery</a></li>
                                <li><a href="#">pages</a>
                                    <ul>
                                        <li><a href="404.html">404</a></li>
                                        <li><a href="booking-information.html">Booking Information</a></li>
                                        <li><a href="personal-information.html">Personal Information</a></li>
                                        <li><a href="payment-information.html">Parment Information</a></li>
                                        <li><a href="booking-done.html">Booking Done</a></li>
                                        <li><a href="room-booking.html">Room booking</a></li>
                                        <li><a href="news.html">News</a></li>
                                        <li><a href="gallery.html">Gallery</a></li>
                                        <li><a href="staff.html">Staff</a></li>
                                        <li><a href="our-room.html">Room</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact-us.html">contact</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Mobile menu end -->
        </div>
        <!-- ERROR AREA START -->
        <div class="error-area text-center ptb-100">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="error-content ">
                            <h2>404</h2>
                            <h3>Page not found!</h3>
                            <h4>Oops! Looks like something going rong</h4>
                            <p>We can’t seem to find the page you’re looking for <br>
                                make sure that you have typed the currect URL</p>
                            <a class="go-home" href="index.html">Go to home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--Header section end-->
    <!-- search bar Start -->
    <div class="search-bar animated slideOutUp">
        <div class="table">
            <div class="table-cell">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2">
                            <div class="search-form-wrap">
                                <button class="close-search"><i class="mdi mdi-close"></i></button>
                                <form action="#">
                                    <input type="text" placeholder="Search here..." value="Search here..."/>
                                    <button class="search-button" type="submit">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- search bar End -->
    <!-- Start page content -->



    <!-- End page content -->
    <!--hotel team start-->
    <div class="hotel-team pt-100 white_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="team-brand pb-100">
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-1.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-3.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-5.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-1.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-3.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-4.jpg" alt=""></a>
                        </div>
                        <div class="single-team">
                            <a href="#"><img src="images/brand/b-5.jpg" alt=""></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="newsletter">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="newsletter-title">
                                    <h2>SUBSCRIBE TO OUR NEWSLETTER</h2>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="newsletter-form">
                                    <form id="mc-form" class="mc-form" >
                                        <input id="mc-email" type="email" autocomplete="off" placeholder="Enter Address..." />
                                        <button id="mc-submit" type="submit">Subscribe</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--hotel team end-->
    <!--Footer start -->
    <div class="footer ptb-100">
        <div class="footer-bg-opacity"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="single-footer mt-0">
                        <div class="logo">
                            <img src="images/logo/logo.png" alt="">
                        </div>
                        <div class="f-adress">
                            <p><span>Address:</span> ur address goes here,street Crossroad123.</p>
                        </div>
                        <div class="hotel-contact">
                            <p><span>phone:</span> 99 55 88586 5478.</p>
                            <p><span>Email:</span>info@example.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 hidden-sm col-xs-6">
                    <div class="single-footer">
                        <h3>Quick Links</h3>
                        <div class="quick-item">
                            <ul>
                                <li><a href="#">Rooms</a></li>
                                <li><a href="#">Food & Drinks</a></li>
                                <li><a href="#">Manifesto</a></li>
                                <li><a href="#">Beach Venues</a></li>
                                <li><a href="#">Wellness</a></li>
                                <li><a href="#">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="single-footer">
                        <h3>Get in touch</h3>
                        <div class="get-touch">
                            <p>There are many varins of passages of Lorem Ipsum available, but</p>
                            <div class="get-conatct">
                                <form action="#">
                                    <input type="text" value="Your name">
                                    <input type="text" value="Your email">
                                    <button type="submit">Send</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4 col-xs-6">
                    <div class="single-footer">
                        <h3>instagram</h3>
                        <div class="instagram-post">
                            <div class="single-post">
                                <a href="#"><img src="images/instagram/ins-1.jpg" alt=""></a>
                            </div>
                            <div class="single-post">
                                <a href="#"><img src="images/instagram/ins-2.jpg" alt=""></a>
                            </div>
                            <div class="single-post">
                                <a href="#"><img src="images/instagram/ins-3.jpg" alt=""></a>
                            </div>
                            <div class="single-post">
                                <a href="#"><img src="images/instagram/ins-4.jpg" alt=""></a>
                            </div>
                            <div class="single-post">
                                <a href="#"><img src="images/instagram/ins-5.jpg" alt=""></a>
                            </div>
                            <div class="single-post">
                                <a href="#"><img src="images/instagram/img-6.jpg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright ptb-20 white_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-8 col-xs-12">
                    <p>Copyright© CHONDO 2018.All right reserved.Created by <a href="https://freethemescloud.com/"> Free themes Cloud</a></p>
                </div>
                <div class="col-md-6 col-sm-4 col-xs-12">
                    <div class="footer-menu">
                        <ul>
                            <li><a href="#">Privacy policy</a></li>
                            <li><a href="#">Term of use</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer end -->
</div>
</body>
</html>
