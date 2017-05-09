<%@ page contentType="text/html;charset=UTF-8" language="java" %>
	<!-- 发布活动模态框 -->
	<!-- 模态声明，show 表示显示 -->
	<div class="modal fade" tabindex="-1" id="releaseNewsModal" >
		<!-- 窗口声明 -->
		<div class="modal-dialog ">
				<!-- 内容声明 -->
			<div class="modal-content">
				<!-- 头部 -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
					<span class="modal-title">发布活动</span>
				</div>
				<!-- 主体 -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<!-- 水平排列，让表单内的元素保持水平排列 -->
							<form class="form-horizontal">
								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">活动主题：</label>
										<div class="col-sm-7">
										<select class="form-control" id="news_theme">
									      <option value="1">主题1</option>
									      <option value="2">主题2</option>
									      <option value="3">主题3</option>
									      <option value="4">主题4</option>
									      <option value="5">主题5</option>
										</select>
										</div>
								</div>
								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">活动内容：</label>
										<div class="col-sm-7">
										<textarea class="form-control" rows="3" id="news_content" placeholder="请输入活动内容！"></textarea>
										</div>
								</div>

								<div class="form-group has-feedback">
									<label class="col-sm-3 control-label">活动日期：</label>
									<div class="col-sm-7">
										<input type="date" class="form-control" id="news_date"/>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
				<!-- 注脚 -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="release_news_ensure">评价</button>
					<button type="button" class="btn btn-primary" id="release_news_cancel">取消</button>
				</div>
			</div>
		</div>
	</div>