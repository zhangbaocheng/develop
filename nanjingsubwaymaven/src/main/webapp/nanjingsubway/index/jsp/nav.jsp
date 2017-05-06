<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 导航条 -->
	<nav class="navbar navbar-default" role="navigation"> 
		<div class="container-fluid"> 
	        <div class="navbar-header"> 
	        	<img src="nanjingsubway/index/img/subway_logo.jpg" alt="图片" class="img-circle" style="width:50px;height:50px;">
	        </div> 
	        <ul class="nav navbar-nav navbar-left"> 
	            <a class="navbar-brand" href="#" id="title">南京地铁售票系统</a> 
	        </ul>


				<!--向左对齐-->
	        <ul class="nav navbar-nav navbar-left">
	        	<li class="active" id="query_lines"><a href="#">查询线路</a></li>
            	<li id="newest_activity"><a href="#">最新活动</a></li>
            	<li id="recharge"><a href="#">充值</a></li>
	            <li class="dropdown" id="dropdown_list">
	                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	                    我的...
	                    <b class="caret"></b>
	                </a>
	                <ul class="dropdown-menu">
	                    <li id="buy_ticket_history"><a href="#">历史记录</a></li>
	                    <li id="ride_evaluation"><a href="#">乘车评价</a></li>
	                    <li id="user_feedback"><a href="#">用户反馈</a></li>
	                    <li class="divider"></li>
	                    <li id="modify_infomation"><a href="#">修改信息</a></li>
	                    <li class="divider"></li>
	                    <li id="my_community"><a href="#">我的社区</a></li>
	                </ul>
	            </li>
	        </ul>
	        <form class="navbar-form navbar-left" role="search">
	            <!-- <div class="form-group">
	                <input type="text" class="form-control" placeholder="Search">
	            </div>
	            <button type="submit" class="btn btn-default">提交</button> -->

	            <div class="input-group">
					<input type="text" class="form-control" placeholder="Search">
					<a class="input-group-addon btn">搜索</a>
				</div>
	        </form>


	        <ul class="nav navbar-nav navbar-right">
	        	<c:if test="${empty loginUser }">
		            <li><a href="#" id="registerButton"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
		            <li><a href="#" id="loginButton"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
	        	</c:if> 
	        	
	            <c:if test="${!empty loginUser }">
	            	<li id="user_quit_and_log_off">
		        		<a href="javascript:void(0);">
		        			<span>欢迎您:</span>
		        			<span class="userClick">${loginUser.name }</span>
		        			<button class="btn btn-default btn-sm" id="user_quit">退出</button>
		        			<button class="btn btn-default btn-sm btn-info" id="user_log_off">注销</button>
		        		</a>
		        		
		        	</li>
	            </c:if>
	            
	            
	            <li><a href="#" id="_registerButton"><span class="glyphicon glyphicon-user"></span> 注册</a></li> 
	            <li><a href="#" id="_loginButton"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
        	
            	<li id="_user_quit_and_log_off">
	        		<a href="javascript:void(0);">
	        			<span>欢迎您:</span>
	        			<span class="userClick" id="_show_user">${loginUser.name }</span>
	        			<button class="btn btn-default btn-sm" id="_user_quit">退出</button>
	        			<button class="btn btn-default btn-sm btn-info" id="_user_log_off">注销</button>
	        		</a>
	        		
	        	</li>
		            
	        </ul>
	        
	    </div> 
	</nav>