<%--
  Created by IntelliJ IDEA.
  User: taoyi
  Date: 2018/12/20

  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.ShowNewsBean" %>
<%@ page import="java.util.*" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>黄浦区公共设施预约</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="Resources/images/apple-touch-icon.png" type="images/x-icon" rel="shortcut icon">
    <!-- Place favicon.ico in the root directory -->

    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
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

    <script src="Resources/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="Resources/js/vendor/modernizr-2.8.3.min.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="Resources/css/bootstrap-table-filter-control.css">
    <link rel="stylesheet" type="text/css" href="Resources/css/user-board-main.css">
    <link rel="stylesheet" type="text/css" href="Resources/css/my-footer.css">
    <style>
        .fullscreen_bg {
            position: fixed;
            overflow: auto;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-size: cover;
            background-position: 50% 50%;
            background-image: url('Resources/images/index-3-bg.jpg');
            background-repeat:repeat;
        }
    </style>
</head>
<body>
<div id="fullscreen_bg" class="fullscreen_bg">
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
        <nav class="navbar navbar-default equinav" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <span class="navbar-brand">黄浦区公共设施查询</span>
            </div><!-- /.navbar-header -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index.jsp">主页</a></li>
                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">图书馆 <b class="caret"></b></a>
                        <ul class="dropdown-menu depth_0">
                            <li><a href="Login.jsp">图书馆预约</a></li>
                            <li><a href="ShowNewsServlet?angle=1">图书馆新闻</a></li>
                        </ul>
                    </li>

                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">体育馆 <b class="caret"></b></a>
                        <ul class="dropdown-menu depth_0">
                            <li><a href="Login.jsp">体育馆预约</a></li>
                            <li><a href="ShowNewsServlet?angle=1">体育馆新闻</a></li>
                        </ul>
                    </li>

                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">名人故居 <b class="caret"></b></a>
                        <ul class="dropdown-menu depth_0">
                            <li><a href="Login.jsp">名人故居预约</a></li>
                            <li><a href="ShowNewsServlet?angle=1">名人故居新闻</a></li>
                        </ul>
                    </li>

                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">科普教育基地 <b class="caret"></b></a>
                        <ul class="dropdown-menu depth_0">
                            <li><a href="Login.jsp">科普教育基地预约</a></li>
                            <li><a href="ShowNewsServlet?angle=1">科普教育基地新闻</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
        <!--Welcome secton-->
        <div class="welcome-section text-center ptb-110" style="height: 500px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcurbs-inner">
                            <div class="breadcrubs">
                                <h2>Our news</h2>
                                <div class="breadcrubs-menu">
                                    <ul>
                                        <li><a href="#">场馆新闻<i class="mdi mdi-chevron-right"></i></a></li>
                                    </ul>
                                </div>
                            </div>
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
    <div class="our-news text-center ptb-80 white_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-title mb-80">
                        <h2>最新 <span>新闻</span></h2>
                        <p>生活需要新鲜感，新事在你身边</p>
                    </div>
                </div>
            </div>
            <%
                ArrayList<ShowNewsBean> job= (ArrayList<ShowNewsBean>) request.getAttribute("listnews");
                if(job!=null){
                    System.out.println("!!!");}
            %>
            <div class="news-list">
                <div class="row">
                    <div class="our-news-list owl-pagination">
                <%
                    System.out.println(request.getRealPath("/"));
                    System.out.print(job.size());
                    for(int i=0;i<job.size();i++){
                        ShowNewsBean psb=(ShowNewsBean) job.get(i);
                        if(psb!=null){
                            System.out.println(psb.getTitle());}
                        else
                            System.out.println("用户新闻null了 fk");
                        String title=psb.getTitle();
                        String content=psb.getContent();
                        String image=psb.getImage();

                %>
                        <div class="single-view_post">
                            <div class="col-md-12 pb-80">
                                <div class="news-inner">
                                    <div class="news-img">
                                        <img src="Resources\images\newsImage\<%=psb.getImage()%>" alt="新闻图片">
                                        <div class="news-post">
                                            <div class="n-date"><%=psb.getSub_time()%></div>
                                            <a href="#" class="comment"><span><i class="mdi mdi-comment-processing-outline"></i></span> 20</a>
                                            <div class="news-views">
                                                <a href="#"><span><i class="mdi mdi-heart"></i></span>40</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="news-desc">
                                        <h3 class="news-title"><a href="#"><%=psb.getTitle()%></a> </h3>
                                        <p class="news_desc"><%=psb.getContent()%></p>
                                        <div class="news-action">
                                            <div class="news-share">
                                                <p>Share:</p>
                                                <a href="#"><i class="mdi mdi-facebook"></i></a>
                                                <a href="#"><i class="mdi mdi-rss"></i></a>
                                                <a href="#"><i class="mdi mdi-google-plus"></i></a>
                                                <a href="#"><i class="mdi mdi-instagram"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% }
                            %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>
