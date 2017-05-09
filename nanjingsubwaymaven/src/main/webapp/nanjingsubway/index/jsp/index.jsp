<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	
	<base href="${pageContext.request.contextPath }/" />
	<script src="easyui/js/jquery.min.js"></script>
	<script src="easyui/js/jquery.easyui.min.js"></script>
	<script src="easyui/js/easyui-lang-zh_CN.js"></script>
	<script src="bootstrap-3.3.7/js/bootstrap.js"></script>

	<link rel="stylesheet" href="easyui/css/easyui.css"/>
	<link rel="stylesheet" href="easyui/css/icon.css"/>
	<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.css"/>

	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
	<link rel="stylesheet" href="nanjingsubway/index/css/index.css"/>
	
	<script src="jquery.timers-1.1.2/jquery.timers.js"></script>
	<script type="text/javascript" src="nanjingsubway/index/js/index.js"></script>
	<script src="nanjingsubway/index/js/login.js"></script>
	<script src="nanjingsubway/index/js/register.js"></script>
	<script type="text/javascript" src="nanjingsubway/my/buy_ticket_history/js/buy_ticket_history.js"></script>
</head>
<body>

	<%@include file="/nanjingsubway/index/jsp/nav.jsp" %>
	<%@include file="/nanjingsubway/index/jsp/register.jsp" %>
	<%@include file="/nanjingsubway/index/jsp/login.jsp" %>
	<div id="show_body_content"></div>

</body>
</html>
<script>
	$(function(){
		// 点击注册按钮显示注册模态框
		$('#registerButton').on('click', function () {
			$('#registerModal').modal('show');
		});
		// 点击登录按钮显示登录模态框
		$('#loginButton').on('click', function () {
			$('#loginModal').modal('show');
		}); 
		// 点击注册模态框中登录按钮
		$('#btnRegLogin').on('click', function () {
			$('#registerModal').modal('hide');
			$('#loginModal').modal('show');
		});
		
		// 点击登录模态框中注册按钮
		$('#btnLoginRegister').on('click', function () {
			$('#loginModal').modal('hide');
			$('#registerModal').modal('show');
		});
		
		
		
	});

</script>