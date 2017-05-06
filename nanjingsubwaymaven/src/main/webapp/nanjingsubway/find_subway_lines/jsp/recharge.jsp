<%@page contentType="text/html; charset=UTF-8" %>
	<!-- 充值模态框模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="rechargeModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
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
											<input type="text" class="form-control" placeholder="请输入您的充值金额" id="recharge_money"/>
											<span class="glyphicon form-control-feedback" id="recharge_money_remind"></span>
										</div>
								</div>

							</form>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="recharge_ensure">确定</button>
					<button type="button" class="btn btn-primary" id="recharge_cancel">取消</button>
				</div>
			</div>
		</div>
	</div>