<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!-- 显示评价模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="showEvaluationModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<span class="modal-title">乘车评价</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<!-- 水平排列，让表单内的元素保持水平排列 -->
							<form class="form-horizontal">
								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">评价星级：</label>
										<div class="col-sm-7">
										<input type="hidden" id="evaluationBuyTiekct"/>
										<select class="form-control" id="evaluation_stars">
									      <option value="1">&nbsp;&nbsp;&nbsp;&nbsp;☆</option>
									      <option value="2">&nbsp;&nbsp;&nbsp;☆☆</option>
									      <option value="3">&nbsp;&nbsp;☆☆☆</option>
									      <option value="4">&nbsp;☆☆☆☆</option>
									      <option value="5" selected>☆☆☆☆☆</option>
								</div>
								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">评价内容：</label>
										<div class="col-sm-7">
										<textarea class="form-control" rows="3" id="evaluation_content" placeholder="好评！"></textarea>
										</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="show_evaluation_ensure">评价</button>
					<button type="button" class="btn btn-primary" id="show_evaluation_cancel">取消</button>
				</div>
			</div>
		</div>
	</div>