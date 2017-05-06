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
	
	$('#nav_recharge_ensure').click(function(){
		$.ajax({
			type:'POST',
			url:getRootPath() + '/buyTicket/isLogin',
			success:function(message){
				if("success" == message){
					var nav_recharge_money = $('#nav_recharge_money').val();
					var obj = {
							'rechargeMoney':nav_recharge_money
					}
					$.ajax({
						type:'POST',
						data:obj,
						url:getRootPath() + '/buyTicket/recharge',
						success:function(message){
							if("success" == message){
								$('#rechargeSuccessModal').modal('show');
							}
						},
						error:function(){}
					});
					
				}
				else{
					$('#remindUserNotLoginModal').modal('show');
				}
			},
			error:function(){}
		});
		
	});
	
	//提醒用户没登录确定
	$('#remind_user_not_login_ensure').click(function(){
		$('#remindUserNotLoginModal').modal('hide');
		$('#loginModal').modal('show');
	});
	//提醒用户没登录取消
	$('#remind_user_not_login_cancel').click(function(){
		$('#remindUserNotLoginModal').modal('hide');
	});
	$('#recharge_success_ensure').click(function(){
		$('#rechargeSuccessModal').modal('hide');
	});
	
});