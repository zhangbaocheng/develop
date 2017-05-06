<%@page contentType="text/html; charset=UTF-8" %>
	<!-- 购票成功模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="buyTicketSuccessModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<img alt="购买成功" src="nanjingsubway/index/img/register_success.jpg" class="show_user_register_success_img">
					<span class="modal-title">购买成功</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
									<strong>感谢您的合作，购买成功</strong>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="buy_ticket_success_ensure">确定</button>
				</div>
			</div>
		</div>
	</div>