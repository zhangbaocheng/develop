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
	
	$('#login_remind_message_div').hide();
	$('#login_user_name').keyup(function(){
		if($.trim($('#login_user_name').val()) == ''){
			$('#login_remind_message').text('用户名不能为空！');
			$('#login_remind_message_div').show();
			$('#login_username_remind').addClass('glyphicon-remove');
		}
		else{
			$('#login_remind_message_div').hide();
			$('#login_username_remind').removeClass('glyphicon-remove');
			$('#login_username_remind').addClass('glyphicon-ok');
		}
	});
	$('#login_password').keyup(function(){
		if($.trim($('#login_password').val()) == ''){
			$('#login_remind_message').text('密码不能为空！');
			$('#login_remind_message_div').show();
			$('#login_password_remind').addClass('glyphicon-remove');
		}
		else{
			$('#login_remind_message_div').hide();
			$('#login_password_remind').removeClass('glyphicon-remove');
			$('#login_password_remind').addClass('glyphicon-ok');
		}
	});
//	登录模态框点击登录按钮
	$('#login_login').click(function(){
		
		var name = $.trim($('#login_user_name').val());
		var password = $.trim($('#login_password').val());
		if(name == ''){
			$('#login_remind_message').text('用户名不能为空！');
			$('#login_remind_message_div').show();
			$('#login_username_remind').addClass('glyphicon-remove');
			return;
		}
		else if(password == ''){
			$('#login_remind_message').text('密码不能为空！');
			$('#login_remind_message_div').show();
			$('#login_password_remind').addClass('glyphicon-remove');
			return;
		}
		else{
			var passengerObj = {
					'name':name,
					'password':password
			};
			$.ajax({
				type:'POST',
				url:getRootPath() + '/passenger/loginByName',
				data:passengerObj,
				success:function(str){
					if(str == 'no user'){
						$('#remindUserNotExistModal').modal('show');
					}
					else if(str == 'success'){
						$('#user_quit_and_log_off').hide();
						$('#_registerButton').hide();
						$('#_loginButton').hide();
						$('#registerButton').hide();
						$('#loginButton').hide();
						$('#_user_quit_and_log_off').show();
						$('#_show_user').text($('#login_user_name').val());
						$('#loginModal').modal('hide');
					}
					else if(str =='password error'){
						alert('密码错误');
						$('#remindUserPasswordErrorModal').modal('show');
					}
				},
				error:function(){
					$('#remindLoginErrorModal').modal('show');
				}
			});
		}

	});
	
	//登录失败模态框点击确定和取消按钮
	$('#remind_login_error_ensure').click(function(){
		$('#remindLoginErrorModal').modal('hide');
	});
	$('#remind_login_error_cancel').click(function(){
		$('#remindLoginErrorModal').modal('hide');
	});
	
	//提醒用户密码错误点击确定和取消按钮
	$('#remind_user_password_error_ensure').click(function(){
		$('#remindUserPasswordErrorModal').modal('hide');
	});
	$('#remind_user_password_error_cancel').click(function(){
		$('#remindUserPasswordErrorModal').modal('hide');
	});
	
	//提醒用户不存在的模态框点击确定和取消按钮
	$('#remind_user_not_exist_ensure').click(function(){
		$('#remindUserNotExistModal').modal('hide');
	});
	$('#remind_user_not_exist_cancel').click(function(){
		$('#remindUserNotExistModal').modal('hide');
	});
	
	//登录成功点击退出按钮
	$('#user_quit').click(function(){
		$.ajax({
			type:'POST',
			url:getRootPath() + '/passenger/userQuit',
			success:function(){
				location.reload();
			},
			error:function(){
				console.warn('failure');
			}
		});
	});
	$('#_user_quit').click(function(){
		$.ajax({
			type:'POST',
			url:getRootPath() + '/passenger/userQuit',
			success:function(){
				location.reload();
			},
			error:function(){
				console.warn('failure');
			}
		});
	});
	//登录成功点击注销
	$('#user_log_off').click(function(){
		$.ajax({
			type:'POST',
			url:getRootPath() + '/passenger/userQuit',
			success:function(){
				$('#user_quit_and_log_off').hide();
				$('#_user_quit_and_log_off').hide();
				$('#_registerButton').show();
				$('#_loginButton').show();
				$('#loginModal').modal('show');
			},
			error:function(){
				console.warn('failure');
			}
		});
	});
	$('#_user_log_off').click(function(){
		$.ajax({
			type:'POST',
			url:getRootPath() + '/passenger/userQuit',
			success:function(){
				$('#_user_quit_and_log_off').hide();
				$('#user_quit_and_log_off').hide();
				$('#registerButton').show();
				$('#loginButton').show();
				$('#loginModal').modal('show');
			},
			error:function(){
				console.warn('failure');
			}
		});
	});
	
	
	
});