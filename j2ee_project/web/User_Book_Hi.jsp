<%--
  Created by IntelliJ IDEA.
  User: wangj
  Date: 2018/12/18
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="domain.PlaceShowBean" %>
<%@ page import="java.util.*" %>
<%@ page import="domain.BookHiBean" %>
<%@ page import="domain.OrderBean" %>
<%@ page import="domain.UserLoginBean" %>
<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>黄浦区名人故居预约主页</title>
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


    <!-- MetisMenu CSS -->
    <link href="Resources/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="Resources/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="Resources/css/morris.css" rel="stylesheet">

    <link rel="stylesheet" type="text/css" href="Resources/css/my-footer.css">

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
    <script src="Resources/bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" type="text/javascript"></script>

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

<% //判断session是否get到userid
    UserLoginBean ulb=(UserLoginBean) request.getSession().getAttribute("user");
    if(ulb!=null)
        System.out.println(ulb.getUserid());
    else
        System.out.println("null,前端");%>
<div id="fullscreen_bg" class="fullscreen_bg">
    <nav class="navbar navbar-default equinav" role="navigation" style="opacity: 0.8;">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand">黄浦区名人故居预约</span>
        </div><!-- /.navbar-header -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="User_Book.jsp">预约首页</a></li>
                <li><a href="UserBookLiServlet">图书馆预约</a></li>
                <li><a href="UserBookSpServlet">体育馆预约</a></li>
                <li><a href="UserBookEdServlet">科普教育基地预约</a></li>
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
    <div class="wrapper" style="margin: 10px; padding: 10px; opacity: 0.8;">

        <div class="container" style="margin-top:10px;padding-left: 0px;">
            <div style="margin: 15px">
                <a href="UserBookHiServlet">刷新</a>
            </div>
            <ul id="myTab" class="nav nav-tabs" style="background-color: #f8f8f8;margin-left: 15px;">
                <li class="active"><a href="#library" data-toggle="tab" style="width: 375px;">名人故居</a></li>
                <li><a href="#new_order" data-toggle="tab"style="width: 375px;">最新预约</a></li>
                <li><a href="#order_history" data-toggle="tab" style="width: 375px;">我的历史</a></li>

            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="library">
                    <div class="container">
                        <div class="bootstrap-table">
                            <div class="fixed-table-toolbar">
                            </div>
                            <div class="fixed-table-header" style="display:table-header-group">
                                <table id="table" data-url="json/data1.json" data-filter-control="true" data-filter-show-clear="true" class="table table-hover">
                                    <thead>
                                    <tr>
                                    </tr>
                                    </thead>

                                </table>
                                <div class="fixed-table-body" style="display:table-row-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    以下是可以预约的名人故居：
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div class="panel-body">
                                                    <table width="100%" class="table table-striped table-bordered table-hover" id="hi_order">
                                                        <thead>
                                                        <tr>
                                                            <th>预约场馆</th>
                                                            <th>预约时间</th>
                                                            <th>空位情况</th>
                                                            <th>最大人数</th>
                                                            <th>预约</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="overflow-y: scroll;">
                                                        <%
                                                            ArrayList<BookHiBean> job= (ArrayList<BookHiBean>) request.getAttribute("list");
                                                            if(job!=null){
                                                                for(int i=0;i<job.size();i++){
                                                                    BookHiBean blb=(BookHiBean)job.get(i);
                                                        %>
                                                        <tr >
                                                            <td><%=blb.getIdplace()%></td>
                                                            <td><%=blb.getTime()%></td>
                                                            <td><%=blb.getVacancy()%></td>
                                                            <td><%=blb.getMax()%></td>
                                                            <td><a href="UserOrderHiServlet?idplace=<%=blb.getIdplace()%>&book_time=<%=blb.getTime()%>&vacancy=<%=blb.getVacancy()%>&userid=<%=ulb.getUserid()%>">预约</a> </td>
                                                        </tr>
                                                        <% }}
                                                        %>
                                                        </tbody>
                                                    </table>
                                                    <!-- /.table-responsive -->
                                                    <div class="well" style="letter-spacing: 2px; line-height: 1.5;">
                                                        <h4>黄浦区名人故居咨询</h4>
                                                        <p>上海宋庆龄故居位于淮海中路1843号，是一幢红瓦白墙的小洋房。这幢房子原是一个德国人的私人别墅，从1948年到1963年，宋庆龄在这里工作、生活达15年之久。
                                                            上海宋庆龄故居为国家重点文物保护单位、上海宋庆龄故居纪念馆为国家二级博物馆、上海市爱国主义教育基地。
                                                            <a target="_blank" href="http://www.shhpl.com/lib/Index.html">http://www.shhpl.com</a>.</p>
                                                        <a class="btn btn-default btn-lg btn-block" target="_blank" href="http://www.shhpl.com/lib/Index.html">前往上海宋庆龄故居主页</a>
                                                    </div>
                                                </div>
                                                <!-- /.panel-body -->
                                            </div>
                                            <!-- /.panel -->
                                        </div>
                                        <!-- /.col-lg-12 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="new_order">
                    <div class="container">
                        <div class="bootstrap-table">
                            <div class="fixed-table-toolbar">
                            </div>
                            <div class="fixed-table-header" style="display:table-header-group">
                                <table id="table2" data-url="json/data1.json" data-filter-control="true" data-filter-show-clear="true" class="table table-hover">
                                    <thead>
                                    <tr>
                                    </tr>
                                    </thead>


                                </table>
                                <div class="fixed-table-body" style="display:table-row-group">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    以下是最新的名人故居预约记录：
                                                </div>
                                                <!-- /.panel-heading -->
                                                <div class="panel-body">
                                                    <table width="100%" class="table table-striped table-bordered table-hover" id="latest_order">
                                                        <thead>
                                                        <tr>
                                                            <th>用户ID</th>
                                                            <th>预约场馆</th>
                                                            <th>预约时间</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody style="overflow-y: scroll;">
                                                        <%
                                                            ArrayList<OrderBean> latest_order= (ArrayList<OrderBean>) request.getAttribute("latest_order");
                                                            if(latest_order!=null){
                                                                for(int i=0;i<latest_order.size();i++){
                                                                    OrderBean ob=(OrderBean)latest_order.get(i);
                                                        %>
                                                        <tr>
                                                            <%
                                                                String place="";
                                                                if(ob.getIdplace() == 8){
                                                                    place = "宋庆龄故居";
                                                                }
                                                                else if(ob.getIdplace() == 9){
                                                                    place= "中共一大会址";
                                                                }
                                                                else
                                                                    continue;
                                                            %>
                                                            <td><%=ob.getIduser()%></td>
                                                            <td><%=place%></td>
                                                            <td><%=ob.getBook_time()%></td>
                                                        </tr>
                                                        <% }}
                                                        %>
                                                        </tbody>
                                                    </table>
                                                    <!-- /.table-responsive -->
                                                    <div class="well" style="letter-spacing: 2px; line-height: 1.5;">
                                                        <h4>黄浦区名人故居咨询</h4>
                                                        <p>上海宋庆龄故居位于淮海中路1843号，是一幢红瓦白墙的小洋房。这幢房子原是一个德国人的私人别墅，从1948年到1963年，宋庆龄在这里工作、生活达15年之久。
                                                            上海宋庆龄故居为国家重点文物保护单位、上海宋庆龄故居纪念馆为国家二级博物馆、上海市爱国主义教育基地。
                                                            <a target="_blank" href="http://www.shhpl.com/lib/Index.html">http://www.shhpl.com</a>.</p>
                                                        <a class="btn btn-default btn-lg btn-block" target="_blank" href="http://www.shhpl.com/lib/Index.html">前往上海宋庆龄故居主页</a>
                                                    </div>
                                                </div>
                                                <!-- /.panel-body -->
                                            </div>
                                            <!-- /.panel -->
                                        </div>
                                        <!-- /.col-lg-12 -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="tab-pane fade" id="order_history">
                    <div class="container">
                        <div class="bootstrap-table">
                            <div class="fixed-table-toolbar">
                            </div>
                            <div class="fixed-table-header" style="display:table-header-group">
                                <table id="table3" data-url="json/data1.json" data-filter-control="true" data-filter-show-clear="true" class="table table-hover">
                                    <thead>
                                    <tr>
                                    </tr>
                                    </thead>
                                </table>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                仅显示成功的预约，若要查看待审核的预约以及所有预约历史，请点击 用户信息-历史订单 查看
                                            </div>
                                            <!-- /.panel-heading -->
                                            <div class="panel-body">
                                                <table width="100%" class="table table-striped table-bordered table-hover" id="my_order">
                                                    <thead>
                                                    <tr>
                                                        <th>预约场馆</th>
                                                        <th>预约时间</th>
                                                        <th>删除</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody style="overflow-y: scroll;">
                                                    <%
                                                        ArrayList<OrderBean> my_order= (ArrayList<OrderBean>) request.getAttribute("my_order");
                                                        if(my_order!=null){
                                                            for(int i=0;i<my_order.size();i++){
                                                                OrderBean ob=(OrderBean)my_order.get(i);
                                                    %>
                                                    <tr >
                                                        <%
                                                            String place="";
                                                            if(ob.getIdplace() == 8 && ob.getStatus() == 1){
                                                                place = "宋庆龄故居";
                                                            }
                                                            else if(ob.getIdplace() == 9 && ob.getStatus() == 1){
                                                                place= "中共一大会址";
                                                            }
                                                            else
                                                                continue;
                                                        %>
                                                        <td><%=place%></td>
                                                        <td><%=ob.getBook_time()%></td>
                                                        <td><a href="UserOrderSpServlet?del_idplace=<%=ob.getIdplace()%>&del_book_time=<%=ob.getBook_time()%>&del_userid=<%=ob.getIduser()%>">删除</a> </td>
                                                    </tr>
                                                    <% }}
                                                    %>
                                                    </tbody>
                                                </table>
                                                <!-- /.table-responsive -->
                                                <div class="well" style="letter-spacing: 2px; line-height: 1.5;">
                                                    <h4>黄浦区名人故居咨询</h4>
                                                    <p>上海宋庆龄故居位于淮海中路1843号，是一幢红瓦白墙的小洋房。这幢房子原是一个德国人的私人别墅，从1948年到1963年，宋庆龄在这里工作、生活达15年之久。
                                                        上海宋庆龄故居为国家重点文物保护单位、上海宋庆龄故居纪念馆为国家二级博物馆、上海市爱国主义教育基地。
                                                        <a target="_blank" href="http://www.shhpl.com/lib/Index.html">http://www.shhpl.com</a>.</p>
                                                    <a class="btn btn-default btn-lg btn-block" target="_blank" href="http://www.shhpl.com/lib/Index.html">前往上海宋庆龄故居主页</a>
                                                </div>
                                            </div>
                                            <!-- /.panel-body -->
                                        </div>
                                        <!-- /.panel -->
                                    </div>
                                    <!-- /.col-lg-12 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <!-- Metis Menu Plugin JavaScript -->
            <script src="Resources/js/metisMenu.min.js"></script>

            <!-- DataTables JavaScript -->
            <script src="Resources/js/jquery.dataTables.min.js"></script>
            <script src="Resources/js/dataTables.bootstrap.min.js"></script>
            <script src="Resources/js/dataTables.responsive.js"></script>

            <!-- Custom Theme JavaScript -->
            <script src="Resources/js/sb-admin-2.js"></script>

            <!-- Page-Level Demo Scripts - Tables - Use for reference -->
            <script>
                $(document).ready(function() {
                    $('#hi_order').DataTable({
                        responsive: true
                    });
                });
            </script>

            <script>
                $(document).ready(function() {
                    $('#latest_order').DataTable({
                        responsive: true
                    });
                });
            </script>

            <script>
                $(document).ready(function() {
                    $('#my_order').DataTable({
                        responsive: true
                    });
                });
            </script>


            <script>
                $(function(){
                    $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
                        // 获取已激活的标签页的名称
                        var activeTab = $(e.target).text();
                        // 获取前一个激活的标签页的名称
                        var previousTab = $(e.relatedTarget).text();
                        $(".active-tab span").html(activeTab);
                        $(".previous-tab span").html(previousTab);
                    });
                });
            </script>

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
