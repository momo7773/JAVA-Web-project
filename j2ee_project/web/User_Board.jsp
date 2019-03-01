<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2018/12/20
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ page import="domain.UserLoginBean" %>
<%@ page import="domain.BoardBean" %>
<%@ page import="java.util.*" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>留言板</title>
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

    <!-- comment board css -->
    <link rel="stylesheet" href="Resources/css/comment-board.css">
    <!-- Modernizr JS -->
    <script src="Resources/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="Resources/js/vendor/modernizr-2.8.3.min.js" type="text/javascript"></script>
    <style>
        .fullscreen_bg {
            position: fixed;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            background-size: cover;
            background-position: 50% 50%;
            background-image: url('Resources/images/user-info-bg.jpg');
            background-repeat:repeat;
            overflow: auto;
        }
    </style>
</head>
<body>
<% //判断session是否get到userid
    UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
    if(ulb!=null)
        System.out.println(ulb.getUserid());
    else
        System.out.println("null,前端");%>
<div id="fullscreen_bg" class="fullscreen_bg">
<div class="wrapper" style="margin: 10px; padding: 10px">
    <nav class="navbar navbar-default equinav" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand">留言板</span>
        </div><!-- /.navbar-header -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="User_Book.jsp">回到预约首页</a></li>
                <li><a href="index.jsp">回到本站首页</a></li>
            </ul>

            <ul class="navbar-right" style="margin: 20px;">
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎回来！<%=ulb.getUserid()%> <b class="caret"></b></a>
                    <ul class="dropdown-menu depth_0">
                        <li><a href="UserInfoServlet"><i class="icon-cog"></i> 个人信息</a></li>
                        <li class="divider"></li>
                        <li><a href="index.jsp"><i class="icon-off"></i> Logout</a></li>
                    </ul>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="row bootstrap snippets" style="padding-top: 20px">
        <div class="main-comment-box">
            <div class="comment-wrapper" style="padding-left: 50px;">
                <div class="panel panel-info">
                    <div class="panel-heading" style="font-size: large">
                        发布新留言
                    </div>
                    <div class="panel-body">
                        <form action="BoardServlet" method="get" enctype="multipart/form-data">

                        <textarea class="form-control" name="comment-title" placeholder="write a title..." rows="1"></textarea>
                        <br>
                        <textarea class="form-control" name="comment-content" placeholder="write a comment..." rows="6"></textarea>
                        <br>
                        <button type="submit" class="btn btn-info pull-right" style="border-radius: 4px">提交</button>
                        </form>
                        <div class="clearfix"></div>
                        <hr>
                        <ul class="media-list">
                            <%
                                ArrayList<BoardBean> board= (ArrayList<BoardBean>) request.getAttribute("board");
                                if(board!=null){
                                    System.out.println("前端显示留言不为null");
                                    for(int i=0;i<board.size();i++) {
                                        BoardBean bb = (BoardBean) board.get(i);
                            %>
                            <li class="media">
                                <a href="#" class="pull-left">
                                    <img src="Resources\images\userImage\<%=bb.getImg()%>" alt="" class="img-circle">
                                </a>
                                <div class="media-body">
                                <span class="text-muted pull-right">
                                    <small class="text-muted"><span class="glyphicon glyphicon-time"></span> <%=bb.getSub_time()%></small>
                                </span>
                                    <strong class="text-success comment-name"><span class="glyphicon glyphicon-user"></span><%=bb.getIduser()%></strong>
                                    <strong class="text-success" style="margin-left: 20px"><%=bb.getTitle()%></strong>
                                    <p>
                                        <%=bb.getContent()%>
                                    </p>
                                    <span class="glyphicon glyphicon-heart-empty pull-right comment-like"><p class="comment-like"><%=bb.getLike()%></p></span>
                                </div>
                            </li>
                            <%
                                    }
                                }
                                else{
                                System.out.println("前端留言板为null！！！！");}%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card">
        <div class="box">
            <div class="img">
                <img src="https://bootdey.com/img/Content/user_1.jpg">
            </div>
            <h2>欢迎来到留言板<br><span>黄浦区公共预约中心</span></h2>
            <p > 期待您的留言与反馈。<br><br>点击以下链接分享本站。<br></p>
            <span>
            <ul>
                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
            </ul>
        </span>
        </div>
    </div>
    <div class="card2">
        <div class="box" style="padding: 50px;">
            <h2>当前留言板</h2><br>
            <h1>总数  <%=(String) request.getAttribute("cnt_board")%>  条</h1>
        </div>
    </div>
    <div class="card3">
        <div class="box" style="padding: 50px;">
            <h2 style="text-align: center">公告栏</h2>
            <p><br>近期天气转凉，大家请注意身体，小心着凉。<br>近期有用户发反馈图书馆小偷频现，请大家在图书馆自习时随身保管好重要财物，避免意外发生。<br>本站定于每周一晚 8:00 - 9:00 进行系统维护更新，届时将不对公众开放，敬请谅解。<br></p>
        </div>
    </div>
</div>

<div>
    <br>
    <a href="BoardShowServlet">刷新</a>
    <br>
</div>
</div>
</body>
</html>
