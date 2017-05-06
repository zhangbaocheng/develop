<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<script src="nanjingsubway/my/show_passenger_infomation/js/show_passeger_infomation.js"></script>
</head>
<body>
	<!-- 水平排列，让表单内的元素保持水平排列 -->
	<form class="form-horizontal">
										
		<div class="form-group has-feedback">
			<span class="col-sm-2"></span>
			<label class="col-sm-3 control-label">用户姓名：</label>
				<div class="col-sm-3">
					<input type="hidden" id="show_passenger_id"/>
					<input type="text" class="form-control" placeholder="请输入您用户名" id="show_name" value="${passenger.name }" readonly="true"/>
				</div>
		</div>

		<div class="form-group has-feedback">
			<span class="col-sm-2"></span>
			<label class="col-sm-3 control-label">邮箱：</label>
				<div class="col-sm-3">
				<input type="email" class="form-control" placeholder="请输入您的邮箱" id="show_email" value="${passenger.email }" readonly="true"/>
				</div>
		</div>
		
		<div class="form-group has-feedback">
			<span class="col-sm-2"></span>
			<label class="col-sm-3 control-label">联系方式：</label>
				<div class="col-sm-3">
				<input type="email" class="form-control" placeholder="请输入您的联系方式" id="show_phone_number" value="${passenger.phoneNumber }" readonly="true"/>
				</div>
		</div>
		<div class="form-group has-feedback">
			<span class="col-sm-2"></span>
			<label class="col-sm-3 control-label">昵称：</label>
				<div class="col-sm-3">
				<input type="email" class="form-control" placeholder="请输入您的号码" id="show_nick_name" value="${passenger.nickName }" readonly="true"/>
				</div>
		</div>
		<div class="form-group has-feedback">
			<span class="col-sm-2"></span>
			<label class="col-sm-3 control-label"></label>
				<div class="col-sm-3">
					<button class="btn btn-info" id="modify_user_infomation">修改</button>					
				</div>
		</div>
	</form>
</body>
</html>