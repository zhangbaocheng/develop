<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE HTML>
<html lang="zh_CN">
<head>
	<meta charset="UTF-8" />
	<title>Document</title>
	<script src="nanjingsubway/my/buy_ticket_history/js/recharge.js"></script>
</head>
<body>
	<!-- 充值模态框模态框 -->
	<!-- 模态声明，show 表示显示 -->
		<!-- 窗口声明 -->
		<div class="modal-dialog " style="border:1px solid #eee">
				<!-- 内容声明 -->
			<div class="">
				<!-- 头部 -->
				<div class="modal-header">
					<span class="modal-title">充值</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<!-- 水平排列，让表单内的元素保持水平排列 -->
							<form class="form-horizontal">
																
								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">充值金额：</label>
										<div class="col-sm-7">
											<input type="text" class="form-control" placeholder="请输入您的充值金额" id="nav_recharge_money"/>
											<span class="glyphicon form-control-feedback" id="nav_recharge_money_remind"></span>
										</div>
								</div>

							</form>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="nav_recharge_ensure">确定</button>
				</div>
			</div>
		</div>
		
		<%@include file="/nanjingsubway/find_subway_lines/jsp/remind_user_not_login.jsp" %>
		<%@include file="/nanjingsubway/find_subway_lines/jsp/recharge_success.jsp" %>
		<%@include file="/nanjingsubway/index/jsp/login.jsp" %>
</body>
</html>