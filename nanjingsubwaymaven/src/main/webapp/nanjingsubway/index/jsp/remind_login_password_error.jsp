<%@page contentType="text/html; charset=UTF-8" %>
	<!-- 提醒用户密码错误模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="remindUserPasswordErrorModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<img alt="密码错误" src="nanjingsubway/index/img/warn.jpg" class="show_user_login_error_img">
					<span class="modal-title">密码错误</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
								<strong>请重新输入正确的密码</strong>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="remind_user_password_error_ensure">确定</button>
					<button type="button" class="btn btn-primary" id="remind_user_password_error_cancel">取消</button>
				</div>
			</div>
		</div>
	</div>