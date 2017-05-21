<%--
  Created by IntelliJ IDEA.
  User: destinys
  Date: 2017/5/18
  Time: 下午9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <base href="${pageContext.request.contextPath }/" />
    <script src="easyui/js/jquery.min.js"></script>
</head>
<body>
<a href="${pageContext.request.contextPath}/test/t1">测试1</a>
<a href="${pageContext.request.contextPath}/test/t2">测试2</a>
<button id="btn">按钮</button>
<script>
    $(function(){
        $('#btn').click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/test/t5",
                type:'POST',
                success:function(response){
                    console.log(response);
                }
            });
        });
    });

</script>
</body>
</html>
