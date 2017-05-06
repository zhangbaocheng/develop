<%@page contentType="text/html; charset=UTF-8" %>
	<!-- 提醒用户余额不足模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="remindNotChooseStartTimeModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<img alt="尚未选择出发日期" src="nanjingsubway/index/img/warn.jpg" class="show_user_login_error_img">
					<span class="modal-title">尚未选择出发日期</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
									<strong>请您先进行选择出发日期再进行购买操作</strong>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="remind_not_choose_start_time_ensure">确定</button>
				</div>
			</div>
		</div>
	</div>