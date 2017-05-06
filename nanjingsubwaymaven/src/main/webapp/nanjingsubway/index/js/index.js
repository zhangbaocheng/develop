$(function(){
	//js获取项目根路径
	function getRootPath(){  
	    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp  
	    var curWwwPath=window.document.location.href;  
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp  
	    var pathName=window.document.location.pathname;  
	    var pos=curWwwPath.indexOf(pathName);  
	    //获取主机地址，如： http://localhost:8083  
	    var localhostPaht=curWwwPath.substring(0,pos);  
	    //获取带"/"的项目名，如：/uimcardprj  
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);  
	    return(localhostPaht+projectName);  
	}
	
	$('#show_body_content').load(getRootPath() + '/subwayLines/findSubwayLines');
	
	// 点击注册按钮显示注册模态框
	$('#registerButton').on('click', function () {
		$('#registerModal').modal('show');
	});
	$('#_registerButton').click(function(){
		$('#registerModal').modal('show');
	});
	
	// 点击登录按钮显示登录模态框
	$('#loginButton').on('click', function () {
		$('#loginModal').modal('show');
	}); 
	$('#_loginButton').on('click', function () {
		$('#loginModal').modal('show');
	}); 
	
	// 点击注册模态框中登录按钮
	$('#register_login_button').on('click', function () {
		$('#registerModal').modal('hide');
		$('#loginModal').modal('show');
	});
	
	// 点击登录模态框中注册按钮
	$('#login_register').on('click', function () {
		$('#loginModal').modal('hide');
		$('#registerModal').modal('show');
	});
	
	$('#_registerButton').hide();
	$('#_loginButton').hide();
	$('#_user_quit_and_log_off').hide();
	
	$('.userClick').click(function(){
		$('#show_body_content').load(getRootPath() + '/passenger/showPassengerInfomation');
	});
	
	//点击查询线路
	$('#query_lines').click(function(){
		$('#query_lines').addClass('active');
		$('#newest_activity').removeClass('active');
		$('#recharge').removeClass('active');
		$('#dropdown_list').removeClass('active');
		
		$('#my_community').removeClass('active');
		$('#buy_ticket_history').removeClass('active');
		$('#ride_evaluation').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#modify_infomation').removeClass('active');
		
		$('#show_body_content').load(getRootPath() + '/subwayLines/findSubwayLines');
	});
	//点击最新活动
	$('#newest_activity').click(function(){
		$('#newest_activity').addClass('active');
		
		$('#query_lines').removeClass('active');
		$('#recharge').removeClass('active');
		$('#dropdown_list').removeClass('active');
		
		$('#my_community').removeClass('active');
		$('#buy_ticket_history').removeClass('active');
		$('#ride_evaluation').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#modify_infomation').removeClass('active');
	});
	//点击充值
	$('#recharge').click(function(){
		$('#recharge').addClass('active');
		
		$('#newest_activity').removeClass('active');
		$('#query_lines').removeClass('active');
		$('#dropdown_list').removeClass('active');
		
		$('#my_community').removeClass('active');
		$('#buy_ticket_history').removeClass('active');
		$('#ride_evaluation').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#modify_infomation').removeClass('active');
		
		$('#show_body_content').load('nanjingsubway/my/buy_ticket_history/jsp/nav_recharge.jsp');
	});
	
	//下面的为列表里的信息
	$('#dropdown_list').click(function(){
		$('#dropdown_list').addClass('active');
		
		$('#recharge').removeClass('active');
		$('#newest_activity').removeClass('active');
		$('#query_lines').removeClass('active');
	});
	//点击历史记录
	$('#buy_ticket_history').click(function(){
		$('#dropdown_list').addClass('active');
		$('#buy_ticket_history').addClass('active');
		
		$('#ride_evaluation').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#modify_infomation').removeClass('active');
		$('#my_community').removeClass('active');
		
		$('#show_body_content').load('nanjingsubway/my/buy_ticket_history/jsp/buy_ticket_history.jsp');
		
	});
	//点击乘车评价
	$('#ride_evaluation').click(function(){
		$('#dropdown_list').addClass('active');
		$('#ride_evaluation').addClass('active');
		
		$('#buy_ticket_history').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#modify_infomation').removeClass('active');
		$('#my_community').removeClass('active');
		
		
	});
	//点击用户反馈
	$('#user_feedback').click(function(){
		$('#dropdown_list').addClass('active');
		$('#user_feedback').addClass('active');
		
		$('#buy_ticket_history').removeClass('active');
		$('#ride_evaluation').removeClass('active');
		$('#modify_infomation').removeClass('active');
		$('#my_community').removeClass('active');
		
	});
	//点击修改信息
	$('#modify_infomation').click(function(){
		$('#dropdown_list').addClass('active');
		$('#modify_infomation').addClass('active');

		$('#buy_ticket_history').removeClass('active');
		$('#ride_evaluation').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#my_community').removeClass('active');
	});
	//点击我的社区
	$('#my_community').click(function(){
		$('#dropdown_list').addClass('active');
		$('#my_community').addClass('active');
		
		$('#buy_ticket_history').removeClass('active');
		$('#ride_evaluation').removeClass('active');
		$('#user_feedback').removeClass('active');
		$('#modify_infomation').removeClass('active');
	});

});