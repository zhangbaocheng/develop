<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
	<meta charset="UTF-8">
	<base href="${pageContext.request.contextPath }/" />
	<title>Document</title>
	<link rel="stylesheet" href="nanjingsubway/find_subway_lines/css/find_subway_lines.css"/>
	<script src="nanjingsubway/find_subway_lines/js/find_subway_lines.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
</head>
<body>

	<!-- 内联表单 -->
	<div class="form-inline" style="margin:0 auto;">
		<div class="form-group">
			<label>出发站点</label>
			<input type="text" id="siteStart" class="form-control" placeholder="请输入出发站点" value="南京站">
		</div>
		<div class="form-group">
			<label>到达站点</label>
			<input type="text" id="siteEnd" class="form-control" placeholder="请输入到达站点" value="南京南站">
		</div>
		<div class="form-group">
			<label>出发日期</label>
			<input type="date" id="startDate" class="form-control">
		</div>
		<button class="btn btn-info" id="select_routes">确定</button>
	</div>
	<div id="show_line" style="background-color:#eee;width:400px;height:200px;padding:15px;">
		<div><span>线路：</span><span id="show_lines_pass_by"></span></div>
		<div><span>经过的站点数：</span><span id="show_sites_number_pass_by"></span></div>
		<div><span>价格：</span><span id="show_price"></span></div>
		<input type="hidden" id="show_start_site" />
		<input type="hidden" id="show_end_site" />
		<div id="buy_ticket_div" style="margin-top:10px;display:none;"><button class="btn btn-info">购买</button></div>
	</div>
	<br />
	<div style="background-color:#eee; width:400px;height:300px;overflow:auto;padding:15px;">
		经过站点：
		<div id="show_routes"></div>
	</div>
	
	<%@include file="./remind_user_not_login.jsp" %>
	<%@include file="./buy_ticket_success.jsp" %>
	<%@include file="./remind_money_not_enough.jsp" %>
	<%@include file="./recharge.jsp" %>
	<%@include file="./recharge_success.jsp" %>
	<%@include file="./remind_not_choose_start_time.jsp" %>
</body>
</html>