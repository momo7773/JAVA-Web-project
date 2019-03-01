
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>预约首页</title>
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
    <link href="Resources/css/bootstrap-select.min.css" rel="stylesheet" />
    <script src="Resources/js/bootstrap-select.min.js"></script>
    <script src="Resources/js/i18n/defaults-zh_CN.min.js"></script>

    <link rel="stylesheet" type="text/css" href="Resources/css/bootstrap-table-filter-control.css">
    <link rel="stylesheet" type="text/css" href="Resources/css/user-board-main.css">
    <link rel="stylesheet" type="text/css" href="Resources/css/my-footer.css">

    <style type="text/css">
        #home_quicklinks {
            padding: 20px 0;
            text-align: center;
        }
        a.quicklink.link1 {
            background: #fc6719;
        }
        a.quicklink {
            display: inline-block;
            width: 302px;
            height: 173px;
            position: relative;
            margin: 90px 30px;
        }
        a.quicklink .ql_caption {
            display: block;
            height: 100%;
            width: 100%;
            position: relative;
        }
        .outer {
            display: table;
            position: relative;
            vertical-align: middle;
            text-align: center;
            height: 100%;
            width: 100%;
            border-spacing: 0px;
            padding: 0px;
        }
        .inner {
            display: table-cell;
            position: relative;
            vertical-align: middle;
            text-align: center;
            height: 100%;
            width: 100%;
            border-spacing: 0px;
            padding: 0px;
        }
        a.quicklink .ql_caption h2 {
            margin: 0px;
            padding: 0px;
            text-transform: uppercase;
            line-height: 1.46em;
            color: #fff;
        }
        a.quicklink.link1 .ql_top {
            border-bottom-color: #fc6719;
        }
        a.quicklink.link1 .ql_bottom {
            border-top-color: #fc6719;
        }


        .ql_top {
            bottom: 173px;
            border-bottom: 89px solid #ccc;
        }
        .ql_bottom {
            top: 173px;
            border-top: 89px solid #ccc;
        }
        .ql_top, .ql_bottom {
            position: absolute;
            left: 0px;
            width: 0px;
            border-left: 151px solid transparent;
            border-right: 151px solid transparent;
        }

        a.quicklink.link2 {
            background: #fcf4e7;
        }
        a.quicklink.link2 .ql_top {
            border-bottom-color: #fcf4e7;
        }
        a.quicklink.link2 .ql_bottom {
            border-top-color: #fcf4e7;
        }


        a.quicklink.link3 .ql_top {
            border-bottom-color: #bcbdc0;
        }
        a.quicklink.link3 .ql_bottom {
            border-top-color: #bcbdc0;
        }
        a.quicklink.link3 {
            background: #bcbdc0;
        }
        a.quicklink {
            font-size: 36px;
            font-weight: 500;
            text-decoration:none;
        }
        .btn-sq-lg {
            width: 150px;
            height: 150px;
        }

        .btn-sq {
            width: 100px;
            height: 100px;
            font-size: 10px;
        }

        .btn-sq-sm {
            width: 50px;
            height: 50px;
            font-size: 10px;
        }

        .btn-sq-xs {
            width: 25px ;
            height: 25px ;
            padding:2px;
        }
    </style>
    <!-- Modernizr JS -->
    <script src="Resources/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="Resources/js/vendor/modernizr-2.8.3.min.js" type="text/javascript"></script>
</head>
<body>

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
                <li><a href="index.jsp">主页</a></li>
                <li><a href="ShowNewsServlet">新闻浏览 </a>
                </li>

                <li><a href="BoardShowServlet">留言板 </a>
                </li>

            </ul>
            <% UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
                if(ulb!=null)
                    System.out.println(ulb.getUserid());
                else
                    System.out.println("null,前端");%>
            <ul class="navbar-right" style="margin: 20px;">
                <li><a href="#" class="dropdown-toggle" data-toggle="dropdown">欢迎回来！<%=ulb.getUserid()%> <b class="caret"></b></a>
                    <ul class="dropdown-menu depth_0">
                        <li><a href="UserInfoServlet"><i class="icon-cog"></i> 个人信息</a></li>
                        <li class="divider"></li>
                        <li><a href="index.jsp"><i class="icon-off"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </nav>
    <div class="col-md-8" style="left: 10%; margin-bottom: 100px;">
        <figure class="snip0078 yellow" style="height: 250px">
            <img src="Resources/images/library.jpg" alt="" />
            <figcaption>
                <h2 style="margin-top: -15px; font-size: small">图书馆 <span> Library</span></h2>
                <p>前往图书馆预约主页</p>
            </figcaption>
            <a href="UserBookLiServlet"></a>
        </figure>
        <figure class="snip0078 green" style="height: 250px"><img src="Resources/images/stadium.jpg" alt="" />
            <figcaption>
                <h2 style="margin-top: -15px; font-size: small">体育馆 <span> Stadium</span></h2>
                <p>前往体育馆预约主页</p>
            </figcaption>
            <a href="UserBookSpServlet"></a>
        </figure>
        <figure class="snip0078 red" style="height: 250px"><img src="Resources/images/history.jpg" alt="" />
            <figcaption>
                <h2 style="margin-top: -15px; font-size: small">名人故居 <span> History</span></h2>
                <p>前往名人故居预约主页</p>
            </figcaption>
            <a href="UserBookHiServlet"></a>
        </figure>
        <figure class="snip0078 blue" style="height: 250px"><img src="Resources/images/education.jpg" alt="" />
            <figcaption>
                <h2 style="margin-top: -15px; font-size: small">科普教育基地 <span> Edu</span></h2>
                <p>前往科普教育基地主页</p>
            </figcaption>
            <a href="UserBookEdServlet"></a>
        </figure>
    </div>

</div>


<!----------- Footer ------------>
<footer class="footer-bs" style="margin-top: 50px; height:900px">
    <div class="row">
        <div class="col-md-3 footer-brand animated fadeInLeft" style="top:100px;">
            <h2>黄浦区公共设施</h2>
            <p>Shall I compare thee to a summer's day?
                Thou art more lovely and more temperate.
                Rough winds do shake the darling buds of May,
                And summer's lease hath all too short a date. 4
                Sometime too hot the eye of heaven shines,
                And often is his gold complexion dimm'd;</p>
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
</body>
</html>
