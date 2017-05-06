<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	<!-- 充值成功模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="rechargeSuccessModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<img alt="注册成功" src="nanjingsubway/index/img/register_success.jpg" class="show_user_register_success_img">
					<span class="modal-title">充值成功</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
								<strong>恭喜您，充值成功</strong>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="recharge_success_ensure">确定</button>
				</div>
			</div>
		</div>
	</div>
