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
    <title>用户注册</title>
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
            overflow: auto;
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
<body>
<script>
    function YHMonblus(){
        var username=document.getElementById("nickname");
        if(username.value==""){
            document.getElementById('YHMerror').innerText="请输入用户名";
        }
        else if(username.value.length < 2 ||username.value.length > 18){
            console.log(username.value);
            document.getElementById('YHMerror').innerText="格式错误,长度应为2-18个字符";
        }
        else {
            document.getElementById('YHMerror').innerText ="";
        }
    }
    function MMonblus(){
        var password=document.getElementById("pwd");
        var re = /^(?=.*\d)(?=.*[a-zA-Z])[\da-zA-Z]{6,}$/;
        // var reg=/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/;

        if(password.value==""){
            document.getElementById('MMerror').innerText="请输入密码";
        }
        else if(password.value.length < 6){
            document.getElementById('MMerror').innerText="格式错误,,密码长度至少为6位";
        }

        else if(!re.test(password.value)){
            document.getElementById('MMerror').innerText="格式错误,必须包含英文字母大小写和数字";
        }
        else {
            document.getElementById('MMerror').innerText ="";
        }
    }
    function QRMMonblus(){
        var password=document.getElementById("pwd");
        var confirmPassword=document.getElementById("conpwd");
        if(confirmPassword.value==""){
            document.getElementById('QRMMerror').innerText="请输入确认密码";
        }
        else if(password.value != confirmPassword.value){
            document.getElementById('QRMMerror').innerText="两次密码输入不一致";
        }
        else {
            document.getElementById('QRMMerror').innerText ="";
        }
    }
    function IDonblus()
    {
        var id=document.getElementById("id_num");
        var re=/^[0-9]{18}/;
        if(!re.test(id))
        {
            document.getElementById('IDerror').innerText="身份证格式错误";
        }
        else
            document.getElementById("IDerror").innerText="";
    }
    function LXDHonblus(){
        var phone=document.getElementById("tel");
        var re = /^1\d{10}$/;
        if(phone.value==""){
            document.getElementById('LXDHerror').innerText="请输入联系电话";
        }
        else if(!re.test(phone)){
            document.getElementById('LXDHerror').innerText="电话格式输入错误";
        }
        else {
            document.getElementById('LXDHerror').innerText ="";
        }
    }
    function DZYXonblus(){
        var email=document.getElementById("email");
        var re= /[a-zA-Z0-9]{1,10}@[a-zA-Z0-9]{1,5}\.[a-zA-Z0-9]{1,5}/;
        if(email.value==""){
            document.getElementById('DZYXerror').innerText="请输入电子邮箱";
        }
        else if(!re.test(email.value)){
            document.getElementById("DZYXerror").innerHTML="邮箱格式不正确";
        }
        else {
            document.getElementById('DZYXerror').innerText ="";
        }
    }
</script>
<div id="fullscreen_bg" class="fullscreen_bg">
    <div class="form">

        <ul class="tab-group">
            <li class="tab active"><a href="#reg_user" tabindex="1">普通用户注册</a></li>
        </ul>
        <div class="tab-content">
            <div id="reg_user">
                <h1>Register for Free</h1>
                <br>
                <form action="RegisterServlet" method="get">

                    <input type="hidden" name="userid" required autocomplete="off" value="1"/>

                    <div class="field-wrap">
                        <label>
                            姓名 &nbsp Name<span class="req">*</span>
                        </label>
                        <input type="text" name="userName" required autocomplete="off"/>
                    </div>

                    <div class="field-wrap">
                        <label>
                            密码 &nbsp Password<span class="req">*</span>
                        </label>
                        <input type="password" name="pwd" required autocomplete="off" onblur="MMonblus()"/>
                        <span id="MMerror">
                     </span>
                    </div>

                    <div class="field-wrap">
                        <label>
                            确认密码 &nbsp Confirm Password<span class="req">*</span>
                        </label>
                        <input type="password" name="conpwd" required autocomplete="off" onblur="QRMMonblus()"/>
                        <span id="QRMMerror">
                     </span>
                    </div>
                    <div class="field-wrap">
                        <label>
                            身份证号 &nbsp ID &nbsp Num<span class="req">*</span>
                        </label>
                        <input type="text" name="id_num" required autocomplete="off" onblur="IDonblus()"/>
                        <span id="IDerror">
                     </span>
                    </div>

                    <div class="field-wrap">
                        <label>
                            电子邮箱 &nbsp Email<span class="req">*</span>
                        </label>
                        <input type="email" name="email" required autocomplete="off" onblur="DZYXonblus()"/>
                        <span id="DZYXerror">
                    </span>
                    </div>

                    <div class="field-wrap">
                        <label>
                            昵称 &nbsp Nickname<span class="req">*</span>
                        </label>
                        <input type="text" name="nickname" required autocomplete="off" onblur="YHMonblus()"/>
                        <span id="YHMerror">
                    </span>
                    </div>

                    <div class="field-wrap">
                        <label>
                            电话 &nbsp Telephone<span class="req">*</span>
                        </label>
                        <input type="text" name="tel" required autocomplete="off" onblur="LXDHonblus()"/>
                        <span id="LXDHerror">
                    </span>
                        <input type="hidden" name="img" value="default">
                    </div>

                    <button class="button button-block"/>注册 &nbsp Get Started</button>

                </form>

            </div>

        </div>

        <!-- tab-content -->
    </div>
</div>

<script src="Resources/js/jquery-3.3.1.js"></script>
<script src="Resources/js/index.js"></script>
</body>
</html>
