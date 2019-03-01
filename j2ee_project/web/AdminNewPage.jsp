<%@ page import="domain.ShowNewsBean" %><%--
  Created by IntelliJ IDEA.
  User: taoyi
  Date: 2018/12/21
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html>
<head><  <!-- MetisMenu CSS -->
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

<link rel="stylesheet" type="text/css" href="Resources/css/my-footer.css" />

<link rel="stylesheet" type="text/css" href="Resources/css/bootstrap-table-filter-control.css">

<title>新闻管理</title>
    <style type="css/text">
         .card-text{
            width:60px;
             height: 60px;
            display:block;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;

        }
    </style>

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
<body>
<div id="fullscreen_bg" class="fullscreen_bg">
<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="opacity: 0.8;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand">管理员控制系统</span>
        </div><!-- /.navbar-header -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav " style="padding-left: 770px" >
                <li><a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                    <ul class="dropdown-menu depth_0" style="width:270px">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet,</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>

                <li> <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                    <ul class="dropdown-menu depth_0" style="width:270px">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="pull-right" style="margin-top: 18px;padding-right: 100px">
                <li><a href="#" class=" pull-right" >欢迎回来！</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation" style="margin-top: -5px;">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="AdminMainPage.jsp"><i class="fa fa-dashboard fa-fw"></i>图形化查看</a>
                    </li>
                    <li>
                        <a href="AdminOrderPlace.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>预约查看<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="AdminUserOrderServlet">用户预约信息</a>
                            </li>
                            <li>
                                <a href="AdminPlaceServlet">场馆预约信息</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="ShowNewsServlet?angle=2"><i class="fa fa-table fa-fw"></i>新闻信息</a>
                    </li>
                    <li>
                        <a href="AdminBoardServlet"><i class="fa fa-edit fa-fw"></i>留言板</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>

    <div class="container">
        <div class="col-lg-10 pull-right">
        <h1 class="jumbotron-heading">新闻管理区</h1>
        <p class="lead text-muted" style="opacity: 0.8;background-color: rgba(0,0,0,0);">滑动查看最新新闻发布，底部修改所有新闻信息</p>
            <div style="float: right;">
                <p>
                    <a href="AdminAddNews.jsp" class="btn btn-primary my-2 pull-right">新增新闻</a>
                </p>
            </div>

    </div>
    </div>
    <div class="container">
        <div class="col-lg-10 pull-right">
            <%
                ArrayList<ShowNewsBean> job= (ArrayList<ShowNewsBean>) request.getAttribute("listnews");
                if(job!=null){
                    System.out.println("!!!");}
            %>
                    <%
                        System.out.println(request.getRealPath("/"));
                        System.out.print(job.size());
                        for(int i=0;i<job.size();i++){
                            ShowNewsBean psb=(ShowNewsBean) job.get(i);
                            if(psb!=null){
                                System.out.println(psb.getTitle());}
                            else
                                System.out.println("null!!!!");
                            String title=psb.getTitle();
                            String content=psb.getContent();
                            String image=psb.getImage();

                    %>
                    <div class="col-md-4" style="padding-top:40px;">
                        <div class="card mb-4 box-shadow">
                            <img class="card-img-top" data-src="holder.js/100px225?theme=thumb&amp;bg=55595c&amp;fg=eceeef&amp;text=Thumbnail" alt="Thumbnail [100%x225]" src="Resources\images\newsImage\<%=psb.getImage()%>" data-holder-rendered="true" style="height: 225px; width: 100%; display: block;">
                            <br>
                            <div class="card-img-overlay"> <span class="badge badge-pill badge-danger"><%=psb.getTitle()%></span> </div>
                            <div class="card-body">
                                <div class="news-title">
                                    <p class="card-text" id="content"style="overflow:hidden;width:300px;white-space:nowrap;text-overflow:ellipsis;"><%=psb.getContent()%></p><br>
                                    <div class="d-flex justify-content-between align-items-center" style="margin-top: -24px">
                                        <div class="explore">
                                            <a href="javascript:location.href=encodeURI('AdminEditServlet?auto_incr=<%=psb.getAuto_incr()%>&title=<%=psb.getTitle()%>&content=<%=psb.getContent()%>&image=<%=psb.getImage()%>')">编辑</a>
                                            <a href="AdminDeleteNewsServlet?auto_incr=<%=psb.getAuto_incr()%>">删除</a>
                                        </div>
                                        <small class="text-muted pull-right" style="margin-top: 10px;margin-left: 10px;"><%=psb.getSub_time()%></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            <!-- <br> -->
            <!-- <br> -->
                    <% }
                    %>
                </div>
            </div>
    <!----------- Footer ------------>
    <footer class="footer-bs" style="margin-top: 70px; height: 250px;">
        <div class="row">
            <div class="col-md-3 footer-brand animated fadeInLeft" style="top:0px;">
                <h2 style="font-size: 30px;">黄浦区公共设施</h2>
                <p>© 2018 Yiqing Tao, Jin Wang. All rights reserved</p>
            </div>
            <div class="col-md-4 footer-nav animated fadeInUp">
                <h4 style="color: #FFFFFF">Menu —</h4>
                <div class="col-md-6">
                    <ul class="pages">
                        <li><a href="#">Library</a></li>
                        <li><a href="#">Stadium</a></li>
                        <li><a href="#">History</a></li>
                        <li><a href="#">Education</a></li>
                        <li><a href="#">Advice</a></li>
                    </ul>
                </div>
                <div class="col-md-6">
                    <ul class="list">
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Contacts</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-2 footer-social animated fadeInDown">
                <h4 style="color: #FFFFFF">Follow Us</h4>
                <ul>
                    <li><a href="#">Facebook</a></li>
                    <li><a href="#">Twitter</a></li>
                    <li><a href="#">Instagram</a></li>
                    <li><a href="#">Google</a></li>
                </ul>
            </div>
            <div class="col-md-3 footer-ns animated fadeInRight">
                <h4 style="color: #FFFFFF">Newsletter</h4>
                <p>A rover wearing a fuzzy suit doesn’t alarm the real penguins</p>
                <p>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Send mail to us...">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-envelope"></span></button>
                      </span>
                </div><!-- /input-group -->
                </p>
            </div>
        </div>
    </footer>
    <section style="text-align:center; margin:10px auto;">
        <p>
            Designed by <a href=#">Yiqing Tao, Jin Wang</a>
            <br><br>
        </p>
    </section>
</div>
</div>
</body>
</html>
