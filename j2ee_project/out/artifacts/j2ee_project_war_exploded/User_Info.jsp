<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2018/12/17
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.*" %>
<%@ page import="java.util.*" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>用户信息</title>
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

    <link rel="stylesheet" type="text/css" href="Resources/css/my-footer.css" />

    <link rel="stylesheet" type="text/css" href="Resources/css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="Resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="Resources/css/bootstrap-table-filter-control.css">
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
    <style type="text/css">
    /* Profile container */
    .profile {
    margin: 20px 0;
    }

    /* Profile sidebar */
    .profile-sidebar {
    padding: 20px 0 10px 0;
    background: #fff;
    }

    .profile-userpic img {
    float: none;
    margin: 0 auto;
    width: 100%;
    height: 60%;
    -webkit-border-radius: 50% ;
    -moz-border-radius: 50% ;
    border-radius: 50% ;
    }

    .profile-usertitle {
    text-align: center;
    margin-top: 20px;
    }

    .profile-usertitle-name {
    color: #5a7391;
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 7px;
    }

    .profile-usertitle-job {
    text-transform: uppercase;
    color: #5b9bd1;
    font-size: 12px;
    font-weight: 600;
    margin-bottom: 15px;
    }

    .profile-userbuttons {
    text-align: center;
    margin-top: 10px;
    }

    .profile-userbuttons .btn {
    text-transform: uppercase;
    font-size: 11px;
    font-weight: 600;
    padding: 6px 15px;
    margin-right: 5px;
    }

    .profile-userbuttons .btn:last-child {
    margin-right: 0px;
    }

    .profile-usermenu {
    margin-top: 30px;
    }

    .profile-usermenu ul li {
    border-bottom: 1px solid #f0f4f7;
    }

    .profile-usermenu ul li:last-child {
    border-bottom: none;
    }

    .profile-usermenu ul li a {
    color: #93a3b5;
    font-size: 14px;
    font-weight: 400;
    }

    .profile-usermenu ul li a i {
    margin-right: 8px;
    font-size: 14px;
    }

    .profile-usermenu ul li a:hover {
    background-color: #fafcfd;
    color: #5b9bd1;
    }

    .profile-usermenu ul li.active {
    border-bottom: none;
    }

    .profile-usermenu ul li.active a {
    color: #5b9bd1;
    background-color: #f6f9fb;
    border-left: 2px solid #5b9bd1;
    margin-left: -2px;
    }

    /* Profile Content */
    .profile-content {
    padding: 20px;
    background: #fff;
    min-height: 460px;
    }
    </style>
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
<body>
<% User user=(User) request.getSession().getAttribute("userinfo_detail");
    System.out.println(user.getImg());%>
<div id="fullscreen_bg" class="fullscreen_bg">
    <div class="wrapper" style="margin: 10px; padding: 10px">
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
                    <li><a href="index_3.jsp">回到本站主页</a></li>
                    <li><a href="#">回到预约主页</a></li>
                    <li><a href="#">查看历史预约</a></li>
                    <li><a href="BoardShowServlet">留言板</a></li>

                </ul>

                <ul class="navbar-right" style="margin: 20px;">
                    <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎回来！<%=user.getUserid()%> <b class="caret"></b></a>
                        <ul class="dropdown-menu depth_0">
                            <li><a href="UserInfoServlet"><i class="icon-cog"></i> 个人信息</a></li>
                            <li class="divider"></li>
                            <li><a href="index.jsp"><i class="icon-off"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>

        <div class="container">
            <div class="row profile">
                <div class="col-md-3">
                    <div class="profile-sidebar" style="background:rgba(0,0,0,0);" >
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">
                            <img src="Resources\images\userImage\<%=user.getImg()%>"  alt="">
                        </div>
                        <div class="profile-usermenu">
                            <ul class="nav">
                                <li class="active">
                                    <a href="#">
                                        <i class="glyphicon glyphicon-home"></i>
                                        个人信息 </a>
                                </li>
                                <li>
                                    <a href="UserInfoModify.jsp">
                                        <i class="glyphicon glyphicon-user"></i>
                                        修改信息</a>
                                </li>
                            </ul>
                        </div>
                        <!-- END MENU -->
                    </div>
                </div>
                <div class="col-md-9" style="padding-top:50px;border-radius: 8px;background: rgba(250,250,250,0.6);">
                    <div class="contact-form">
                        <div class="contact-form-title mb-25">
                            <h2>个人信息</h2>
                        </div>
                        <div class="contact-form-inner">
                            <form id="contact-form" action="#" method="post">
                                <p class="form-messege"></p>
                                <div class="form-field-top mb-20">
                                    <div class="form-field-name" style="padding-top: 50px;">
                                        <label class="col-sm-2 control-label">昵称</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" id="userNickname" type="text" value="<%=user.getNickname()%>"  disabled>
                                        </div>
                                    </div>
                                    <div class="form-field-name" style="padding-top: 50px;">
                                        <label class="col-sm-2 control-label">用户ID</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="userID" value="<%=user.getUserid()%>"  disabled>
                                        </div>
                                    </div>
                                    <div class="form-field-name" style="padding-top: 50px;">
                                        <label class="col-sm-2 control-label">电子邮箱</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="userEmail" type="text" value="<%=user.getEmail()%>"  disabled >
                                        </div>
                                    </div>

                                    <div class="form-field-name" style="padding-top: 50px;">
                                        <label  class="col-sm-2 control-label">密码</label>
                                        <div class="col-sm-10">
                                            <input type="text" name="Pwd" value="<%=user.getPwd()%>" placeholder="·········"  disabled>
                                        </div>
                                    </div>
                                    <div class="form-field-name" style="padding-top: 50px;">
                                        <label class="col-sm-2 control-label">手机</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="userTel" type="text" value="<%=user.getTel()%>"  disabled>
                                        </div>
                                    </div>
                                    <div class="form-field-name" style="padding-top: 50px;">
                                        <label class="col-sm-2 control-label">身份证号</label>
                                        <div class="col-sm-10">
                                            <input class="form-control" name="userIdNum" type="text" value="<%=user.getPwd()%>" disabled>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!----------- Footer ------------>
        <footer class="footer-bs" style="margin-top: 50px; height: 250px;">
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
