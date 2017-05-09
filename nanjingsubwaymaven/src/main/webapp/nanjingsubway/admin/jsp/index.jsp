<%--
  Created by IntelliJ IDEA.
  User: destinys
  Date: 2017/5/7
  Time: 下午5:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="${pageContext.request.contextPath }/" />

    <script src="easyui/js/jquery.min.js"></script>
    <script src="easyui/js/jquery.easyui.min.js"></script>
    <script src="easyui/js/easyui-lang-zh_CN.js"></script>
    <script src="bootstrap-3.3.7/js/bootstrap.js"></script>

    <link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css"/>
    <link rel="stylesheet" href="easyui/themes/default/easyui.css"/>
    <link rel="stylesheet" href="easyui/themes/icon.css"/>


    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <script src="nanjingsubway/admin/js/index.js"></script>
    <link rel="stylesheet" href="nanjingsubway/admin/css/index.css"/>

    <script src="jquery.timers-1.1.2/jquery.timers.js"></script>

</head>
<body>
    <div id="top">aa</div>
    <div id="bottom">
        <div id="left">
            <a href="javascript:void(0);" class="btn btn-info admin-manage" id="activity_manage">活动管理</a>
            <a href="javascript:void(0);" class="btn btn-info admin-manage" id="routes_manage">路线管理</a>
            <a href="javascript:void(0);" class="btn btn-info admin-manage" id="passenger_manage">乘客管理</a>
            <a href="javascript:void(0);" class="btn btn-info admin-manage" id="banci_manage">班次管理</a>
        </div>
        <div id="content">right</div>
    </div>


</body>
</html>
