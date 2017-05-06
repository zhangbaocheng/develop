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
	
	//	正则匹配邮箱函数
		function checkMail(mail) {
			 var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
			 if (filter.test(mail)){
				 return true;
			 }	 
			 else {
				 return false;
			 }
		}
	
//		注册成功后的定时器的名称
		var timeA = 'timeA';
	
	$('#register_remind_message_div').hide();
	
	//用户名框键盘抬起事件
	$('#register_username').keyup(function(){
		if($.trim($('#register_username').val()) == ''){
			$('#register_remind_message').text('用户名不能为空！');
			$('#register_remind_message_div').show();
			$('#register_username_remind').addClass('glyphicon-remove');
		}
		else{
			$('#register_remind_message_div').hide();
			$('#register_username_remind').removeClass('glyphicon-remove');
			$('#register_username_remind').addClass('glyphicon-ok');
		}
	});
	//邮箱框键盘抬起事件
	$('#register_email').keyup(function(){
		if(checkMail($.trim($('#register_email').val()))){
			$('#register_remind_message_div').hide();
			$('#register_email_remind').removeClass('glyphicon-remove');
			$('#register_email_remind').addClass('glyphicon-ok');
		}
		else{
			$('#register_remind_message').text('邮箱格式不正确！');
			$('#register_remind_message_div').show();
			$('#register_email_remind').addClass('glyphicon-remove');
		}
	});
	//密码框键盘抬起事件
	$('#register_password').keyup(function(){
		if($.trim($('#register_password').val()) == ''){
			$('#register_remind_message').text('密码不能为空！');
			$('#register_remind_message_div').show();
			$('#register_password_remind').addClass('glyphicon-remove');
		}
		else{
			$('#register_remind_message_div').hide();
			$('#register_password_remind').removeClass('glyphicon-remove');
			$('#register_password_remind').addClass('glyphicon-ok');
		}
	});
	//确认密码框键盘抬起事件
	$('#register_password_confirm').keyup(function(){
		if($.trim($('#register_password_confirm').val()) != $.trim($('#register_password').val())){
			$('#register_remind_message').text('两次密码不一致！');
			$('#register_remind_message_div').show();
			$('#register_password_confirm_remind').addClass('glyphicon-remove');
		}
		else{
			$('#register_remind_message_div').hide();
			$('#register_password_confirm_remind').removeClass('glyphicon-remove');
			$('#register_password_confirm_remind').addClass('glyphicon-ok');
		}
	});
	
	
//	点击注册按钮
	$('#register_register_button').click(function(){
		var name = $.trim($('#register_username').val());
		var email = $.trim($('#register_email').val());
		var password = $.trim($('#register_password').val());
		var password_confirm = $.trim($('#register_password_confirm').val());
		if(name == ''){
			$('#register_remind_message').text('用户名不能为空！');
			$('#register_remind_message_div').show();
			$('#register_username_remind').addClass('glyphicon-remove');
		}
		else if(!checkMail(email)){
			$('#register_remind_message').text('邮箱格式不正确！');
			$('#register_remind_message_div').show();
			$('#register_email_remind').addClass('glyphicon-remove');
		}
		else if(password == ''){
			$('#register_remind_message').text('密码不能为空！');
			$('#register_remind_message_div').show();
			$('#register_password_remind').addClass('glyphicon-remove');
		}
		else if(password_confirm != password){
			$('#register_remind_message').text('两次密码不一致！');
			$('#register_remind_message_div').show();
			$('#register_password_confirm_remind').addClass('glyphicon-remove');
		}
		else{
			$('#register_username_remind').removeClass('glyphicon-remove');
			$('#register_username_remind').addClass('glyphicon-ok');
			$('#register_email_remind').removeClass('glyphicon-remove');
			$('#register_email_remind').addClass('glyphicon-ok');
			$('#register_password_remind').removeClass('glyphicon-remove');
			$('#register_password_remind').addClass('glyphicon-ok');
			$('#register_password_confirm_remind').removeClass('glyphicon-remove');
			$('#register_password_confirm_remind').addClass('glyphicon-ok');
			
			$('#register_remind_message_div').hide();
			
			var registerObj = {
					'name':name,
					'email':email,
					'password':password
			};
			$.ajax({
				type:'POST',
				url:getRootPath() + '/passenger/register',
				data:registerObj,
				success:function(message){
					if('user exist' == message){
						$('#remindResisterUserIsExistModal').modal('show');
					}
					else if('register success' == message){
						$('#registerModal').modal('hide');
						$('#registerSuccessModal').modal({backdrop: 'static', keyboard: true});
						var time = 3;
						$('body').everyTime(1000,timeA,function(){
							console.log('timer');
							if(time-- == 0){
								console.log('stop');
								$('body').stopTime(timeA);
								$('#registerSuccessModal').modal('hide');
								$('#loginModal').modal({backdrop: 'static', keyboard: true});
							}
							if(time != -1){
								$('#timer').text(time);
							}
						});
					}
					else if('register error' == message){
						
					}
				},
				error:function(){}
			});
			
		}
	});
	
//	注册成功之后显示的模态框上面点击跳转的提示信息
	$('#register_success_jump').on('click',function(){
		$('body').stopTime(timeA);
		$('#registerSuccessModal').modal('hide');
		$('#loginModal').modal({backdrop: 'static', keyboard: false});
	});
	
	//提醒用户注册已经存在点击确定
	$('#remind_register_user_exist_ensure').click(function(){
		$('#remindResisterUserIsExistModal').modal('hide');
	});
	//提醒用户注册用户已经存在点击取消
	$('#remind_register_user_exist_cancel').click(function(){
		$('#remindResisterUserIsExistModal').modal('hide');
	});
	
	
	
	
});