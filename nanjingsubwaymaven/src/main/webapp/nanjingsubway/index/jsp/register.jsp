<%@page contentType="text/html; charset=UTF-8" %>
	<!-- 注册模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="registerModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4 class="modal-title">会员注册</h4>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<!-- 水平排列，让表单内的元素保持水平排列 -->
							<form class="form-horizontal">
								
								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">用户姓名：</label>
									<div class="col-sm-7">
										<input type="text" class="form-control" placeholder="请输入您用户名" id="register_username">
										<span class="glyphicon form-control-feedback" id="register_username_remind"></span>
									</div>
								</div>


								<div class="form-group has-feedback">
									<label class="col-sm-3  control-label">电子邮件：</label>
									<div class="col-sm-7">
											<input type="email" class="form-control" placeholder="请输入您的邮件" id="register_email"/>
											<span class="glyphicon form-control-feedback" id="register_email_remind"></span>
										
									</div>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">用户密码：</label>
										<div class="col-sm-7">
										<input type="password" class="form-control" placeholder="请输入您的密码" id="register_password">
										<span class="glyphicon form-control-feedback" id="register_password_remind"></span>
										</div>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">确认密码：</label>
										<div class="col-sm-7">
											<input type="password" class="form-control" placeholder="请确认您的密码" id="register_password_confirm">
											<span class="glyphicon form-control-feedback" id="register_password_confirm_remind"></span>
										</div>
										
								</div>
								
								<div class="form-group">
									<div class="alert alert-warning" id="register_remind_message_div">
										<strong>提示：</strong><span id="register_remind_message">尚未选择用户类型。</span>
									</div>
								</div>
								
							</form>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" id="register_register_button" class="btn btn-default">注册</button>
					<button type="button" id="register_login_button" class="btn btn-primary">登录</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./user_exist.jsp" %>
	<%@include file="./register_success.jsp" %>
	