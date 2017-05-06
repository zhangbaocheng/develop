<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<script src="nanjingsubway/my/buy_ticket_history/js/buy_ticket_history.js"></script>
</head>
<body style="text-align:center;">
	<%@include file="/nanjingsubway/find_subway_lines/jsp/remind_user_not_login.jsp" %>
	<%@include file="./show_evaluation.jsp" %>
	<%@include file="./evaluation_success.jsp" %>
	<%@include file="./evaluation_fail.jsp" %>
	<%@include file="./buy_ticket_again_success.jsp" %>
	
	<div id="show_buy_history" style="width:80%;height:100%;margin:0 auto;"></div>
	
</body>
</html>