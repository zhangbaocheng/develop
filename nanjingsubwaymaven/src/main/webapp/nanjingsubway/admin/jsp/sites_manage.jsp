<%--
  Created by IntelliJ IDEA.
  User: destinys
  Date: 2017/5/7
  Time: 下午5:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/nanjingsubway/admin/js/sites_manage.js"></script>
</head>
<body>
    <table id="show_news_manage"></table>

    <div id="tb" style="padding: 5px;height: auto;">
        <div style="margin-bottom:5px">
            <a href="javascript:void(0);" id="news_add" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
            <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
        </div>

    </div>

    <%--<%@include file="release_news.jsp"%>--%>
    <%--<%@include file="release_news_success.jsp"%>--%>
</body>
</html>
