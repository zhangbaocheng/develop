<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<!-- 注册成功模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="registerSuccessModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<img alt="注册成功" src="nanjingsubway/index/img/register_success.jpg" class="show_user_register_success_img">
					<span class="modal-title">注册成功</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
								<strong>恭喜您，注册成功</strong>
								<span id="timer">3</span> 秒后跳转到登录框，或点击<a href="javascript:void(0);" id="register_success_jump">此处</a>进行跳转
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>
