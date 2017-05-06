<%@page contentType="text/html; charset=UTF-8" %>
	<!-- 登录模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="loginModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<h4 class="modal-title">会员登录</h4>
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
											<input type="text" class="form-control" placeholder="请输入您用户名" id="login_user_name"/>
											<span class="glyphicon form-control-feedback" id="login_username_remind"></span>
										</div>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">用户密码：</label>
										<div class="col-sm-7">
										<input type="password" class="form-control" placeholder="请输入您的密码" id="login_password"/>
										<span class="glyphicon form-control-feedback" id="login_password_remind"></span>
										</div>
								</div>
								
								<div class="form-group">
									<div class="alert alert-warning" id="login_remind_message_div">
										<strong>提示：</strong><span id="login_remind_message">尚未选择用户类型。</span>
									</div>
								</div>
								
							</form>
							
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="login_register">注册</button>
					<button type="button" class="btn btn-primary" id="login_login">登录</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="./remind_login_fail.jsp" %>
	<%@include file="./remind_login_password_error.jsp" %>
	<%@include file="./remind_user_not_exist.jsp" %>
	
