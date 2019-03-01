<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2018/12/15
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.PlaceShowBean" %>
<%@ page import="java.util.*" %>
<%@ page import="domain.ShowNewsBean" %>
<html>
  <head>
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

    <link rel="stylesheet" type="text/css" href="Resources/css/bootstrap-table-filter-control.css">

    <style type="text/css">
      .per20{
        width:20%;
      }
      .per10{
        width:20%;
      }
      .per40{
        width:30%;
      }
      table tbody {
        display: block;
        height:150px;
        overflow:auto;
      }
      table thead, tbody tr {
        display:table;
        width:100%;
        table-layout:fixed;
        text-align: left;//If disabled, default align central
      }
      table thead {
        width: calc( 100% - 1em )
      }
    </style>
    <!-- Modernizr JS -->
    <script src="Resources/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="Resources/js/vendor/modernizr-2.8.3.min.js" type="text/javascript"></script>

  </head>
  <div id="fullscreen_bg" class="fullscreen_bg">
    <body>
    <div class="wrapper" style="margin: 10px; padding: 10px">
      <nav class="navbar navbar-default equinav" role="navigation" opacity: 0.8>
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
            <li><a href="#">主页</a></li>
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

          <ul class="navbar-right" style="margin: 20px; ">
            <a href="Register.jsp">   注册 Register </a>
            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">登录 Login    <b class="caret"></b></a>
            <ul class="dropdown-menu depth_0" style="margin-top: -10px;">
              <li><a href="Login.jsp">用户 User</a></li>
              <li><a href="Login.jsp">管理员 Administrator</a></li>
            </ul>
          </ul>
        </div><!-- /.navbar-collapse -->
      </nav>

      <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="Resources/images/slider-1.jpg" alt="First slide">
            <div class="carousel-caption">黄浦区图书馆</div>
          </div>
          <div class="item">
            <img src="Resources/images/slider-2.jpg" alt="Second slide">
            <div class="carousel-caption">黄浦区体育馆</div>
          </div>
          <div class="item">
            <img src="Resources/images/slider-3.jpg" alt="Third slide">
            <div class="carousel-caption">上海博物馆</div>
          </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
      <br><br><br>

      <div class="container-fluid">
        <div class="row-fluid" style="background-color: rgba(255,255,255,0.6);border-radius: 8px;">
          <div class="col-md-6" style="background-color: rgba(255,255,255,0.6);border-radius: 8px;height: 350px;">
            <div class="container mt-5 mb-5">
              <div class="row">
                <div class="col-md-6 offset-md-3">
                  <h4><a href="ShowNewsServlet?angle=1">新闻 一览</a></h4>
                  <%
                    ArrayList<ShowNewsBean> job= (ArrayList<ShowNewsBean>) request.getAttribute("listnews");
                    if(job!=null){
                      System.out.println("!!!");}
                  %>
                  <ul class="timeline" style=" padding-left: 30px;">
                    <%
                      System.out.println(request.getRealPath("/"));
                      System.out.print(job.size());
                      for(int i=0;i<2;i++){
                        ShowNewsBean psb=(ShowNewsBean) job.get(i);
                        if(psb!=null){
                          System.out.println(psb.getTitle());}
                        else
                          System.out.println("用户新闻null了 fk");
                        String title=psb.getTitle();
                        String content=psb.getContent();
                        String image=psb.getImage();

                    %>
                    <li>
                      <a target="_blank" href="ShowNewsServlet?angle=1" style="color: #3592b9"><%=psb.getTitle()%></a>
                      <a href="#" class="float-right" style="color: #3592b9"><%=psb.getSub_time()%></a>
                      <p><%=psb.getContent()%></p>
                    </li>
                    <% }
                    %>
                  </ul>
                </div>
              </div>
            </div>

          </div>
          <div class="col-md-6"  style="background-color: rgba(255,255,255,0.6);border-radius: 8px;height:350px;">
            <div class="container">
              <div class="bootstrap-table">
                <div class="fixed-table-toolbar">
                </div>
                <div class="fixed-table-container" style="padding-bottom: 0px;">
                  <div class="fixed-table-header" style="display:table-header-group">
                    <div class="col-md-6">
                      <table class="table table-hover"  >
                        <thead>
                        <tr>
                          <th style="" data-field="id">
                            <div class="th-inner ">
                              <a href="PlaceServlet" style="color: #3592b9">check</a>
                            </div>
                          </th>
                        </tr>
                        </thead>
                      </table>
                    </div>
                  </div>
                  <div class="fixed-table-body" style="display:table-row-group">
                    <div class="col-md-6" style="margin-top: 0px">
                      <table id="mytable" class="table table-striped table-hover scrolltable ">
                        <thead style="display :block;border-bottom:1px solid #eee;">
                        <th class="per20">预约场馆</th>
                        <th class="per40">预约时间</th>
                        <th  class="per10">空位情况</th>
                        </thead>
                        <tbody style="max-height:200px;overflow-y: scroll">
                        <%
                          ArrayList<PlaceShowBean> job1= (ArrayList<PlaceShowBean>) request.getAttribute("list");
                          if(job!=null){
                            System.out.println("!!!");}
                        %>
                        <%
                          System.out.print(job.size());
                          for(int i=0;i<job.size();i++){
                            PlaceShowBean psb=(PlaceShowBean)job1.get(i);
                            if(psb!=null){
                              System.out.println(psb.getPlace());}
                            else
                              System.out.println("null!!!!");%>
                        <tr>
                          <th><%=psb.getPlace() %></th>
                          <th><%=psb.getTime()%></th>
                          <th><%=psb.getVacant()%>/<%=psb.getMax()%></th>
                        </tr>
                        <% }
                        %>
                        </tbody>
                      </table>
                    </div>
                  </div>
                  <div class="fixed-table-footer" style="display:table-footer-group">
                    <div class="col-md-6">
                      <div class="explore pull-right" style="color: #3c5a66 ">
                        <a href="Login.jsp" >预约详情</a>
                      </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <br><br><br>

      <div class="container">
        <div class="row-fluid">
          <div>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3411.5826917757663!2d121.47640131433121!3d31.232288981465874!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35b27042c04cd82f%3A0x7d41ee6229c0df4a!2sShanghai+Library+Huangpu+Branch!5e0!3m2!1sen!2sus!4v1545007637241" width="1120" height="550" frameborder="0" style="border:0;align-items: center;" allowfullscreen></iframe>
          </div>
        </div>
      </div>

    </div>

    <!-- Owl carousel Js -->
    <script src="Resources/js/owl.carousel.min.js"></script>
    </body>
  </div>
</html>
