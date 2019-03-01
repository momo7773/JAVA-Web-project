<%--
  Created by IntelliJ IDEA.
  User: taoyi
  Date: 2018/12/25
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>黄浦区公共设施预约</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- mobile specific metas
    ================================================== -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="Resources/css/base.css">
    <link rel="stylesheet" href="Resources/css/vendor.css">
    <link rel="stylesheet" href="Resources/css/main.css">

    <!-- script
    ================================================== -->
    <script src="Resources/js/modernizr.js"></script>
    <script src="Resources/js/pace.min.js"></script>

    <!-- favicons
    ================================================== -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <style>
        .fullscreen_bg {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-size: cover;
            background-position: 50% 50%;
            background-image: url('Resources/images/book-li-bg.jpg');
            background-repeat:repeat;
            overflow: auto;
        }
    </style>
</head>
<div id="fullscreen_bg" class="fullscreen_bg">
    <body>
    <div id="page-wrapper" style="opacity: 0.8;">
        <!-- header
        ================================================== -->
        <header class="s-header">
            <div class="header-logo">
                <a class="site-logo" href="index.jsp">
                    <img src="Resources/images/atom.png" alt="Homepage">
                </a>
            </div>

            <nav class="header-nav">
                <a href="#0" class="header-nav__close" title="close"><span>Close</span></a>
            </nav>  <!-- end header-nav -->
        </header> <!-- end s-header -->

        <!-- home
        ================================================== -->
        <section  class="s-home target-section" data-parallax="scroll" data-image-src="Resources/images/book-li-bg.jpg" data-natural-width=3000 data-natural-height=2000 data-position-y=center>

            <div class="overlay"></div>
            <div class="shadow-overlay"></div>

            <div class="home-content">

                <div class="row home-content__main">

                    <h3>Welcome to</h3>

                    <h1>
                        黄浦区线上预约网站<br><br>
                    </h1>
                    <h2>
                        零距离的温馨社区<br>
                        将生活约出精彩<br>
                    </h2>

                    <div class="home-content__buttons">
                        <a href="Login.jsp" class="smoothscroll btn btn--stroke">
                            登录入口
                        </a>
                        <a href="IndexServlet" class="smoothscroll btn btn--stroke">
                            游客入口
                        </a>
                    </div>

                </div>


            </div> <!-- end home-content -->


            <ul class="home-social">
                <li>
                    <a href="#0"><i class="fa fa-facebook" aria-hidden="true"></i><span>Facebook</span></a>
                </li>
                <li>
                    <a href="#0"><i class="fa fa-twitter" aria-hidden="true"></i><span>Twiiter</span></a>
                </li>
                <li>
                    <a href="#0"><i class="fa fa-instagram" aria-hidden="true"></i><span>Instagram</span></a>
                </li>
                <li>
                    <a href="#0"><i class="fa fa-behance" aria-hidden="true"></i><span>Behance</span></a>
                </li>
                <li>
                    <a href="#0"><i class="fa fa-dribbble" aria-hidden="true"></i><span>Dribbble</span></a>
                </li>
            </ul>
            <!-- end home-social -->

        </section> <!-- end s-home -->
    </div>
    </body>
</div>

</html>
