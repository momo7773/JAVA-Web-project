<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2018/12/17
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>用户登录</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,300,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="Resources/css/normalize.min.css">
    <link rel="stylesheet" href="Resources/css/login-style.css">

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

    <!-- Modernizr JS -->
    <script src="Resources/js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="Resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="Resources/js/vendor/modernizr-2.8.3.min.js" type="text/javascript"></script>

    <script  src="Resources/js/index.js"></script>
    <style>
        .fullscreen_bg {
                    position: fixed;
                    top: 0;
                    right: 0;
                    bottom: 0;
                    left: 0;
                    background-size: cover;
                    background-position: 50% 50%;
                    background-image: url('Resources/images/login-bg.jpg');
                    background-repeat:repeat;
                }
    </style>

</head>
<div id="fullscreen_bg" class="fullscreen_bg">
    <body>
    <div class="form">

        <ul class="tab-group">
            <li class="tab active"><a href="#login_user" tabindex="=1">普通用户登录</a></li>
            <li class="tab"><a href="#login_admin" tabindex="2">管理员登录</a></li>
        </ul>

        <div class="tab-content">
            <div id="login_user">
                <h1>Welcome Back!</h1>
                <form action="LoginServlet" method="post">

                    <div class="field-wrap">
                        <br>
                        <label>
                            用户ID &nbsp User &nbsp id<span class="req">*</span>
                        </label>
                        <input type="text" name="userid" required autocomplete="off"/>
                    </div>

                    <div class="field-wrap">
                        <br>
                        <label>
                            密码 &nbsp Password<span class="req">*</span>
                        </label>
                        <input type="password" name="pwd" required autocomplete="off"/>
                    </div>

                    <br>

                    <button class="button button-block"/>登录 &nbsp Log In</button>

                </form>

            </div>
            <div id="login_admin">
                <h1>Welcome Back!</h1>
                <form action="AdminLoginServlet" method="post">

                    <div class="field-wrap">
                        <br>
                        <label>
                            管理员ID &nbsp User &nbsp id<span class="req">*</span>
                        </label>
                        <input type="text" name="name" required autocomplete="off"/>
                    </div>

                    <div class="field-wrap">
                        <br>
                        <label>
                            密码 &nbsp Password<span class="req">*</span>
                        </label>
                        <input type="password" name="pwd" required autocomplete="off"/>
                    </div>

                    <br>

                    <button class="button button-block"/>登录 &nbsp Log In</button>

                </form>

            </div>

        </div><!-- tab-content -->

    </div>
    <script src="Resources/js/jquery-3.3.1.js"></script>
    <script src="Resources/js/index.js"></script>
    </body>
</div>

</html>
