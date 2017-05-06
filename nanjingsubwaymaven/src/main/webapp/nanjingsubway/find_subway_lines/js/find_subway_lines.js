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
	
	$('#find_subway_lines_btn').click(function(){
		var obj = {
				'lineStart':'4',
				'lineEnd':'s8'
					
		}
//		console.log('asd');
		$.ajax({
			type:'POST',
			url:getRootPath() + '/subwayLines/findLines',
			data:obj
		});
	});
	
	
	$('#find_subway_by_site').click(function(){
		var obj = {
				'siteStart':'南京站',
				'siteEnd':'南京南站'
					
		}
		$.ajax({
			type:'POST',
			url:getRootPath() + '/subwayLines/findSitesPassBy',
			data:obj
		});
	});
	
	$('#select_routes').click(function(){
		var siteStart = $('#siteStart').val();
		var siteEnd = $('#siteEnd').val();
		var obj = {
				'siteStart':siteStart,
				'siteEnd':siteEnd
					
		}
		$.ajax({
			type:'POST',
			url:getRootPath() + '/subwayLines/findSitesPassBy',
			data:obj,
			success:function(obj){
				$('#show_routes').html('出发：<br/>');
				var j = 1;
				var i = '';
				for(i in obj.subwayLineSites){
					if(j == 1){
						$('#show_start_site').val(obj.subwayLineSites[i].siteName);
					}
					$('#show_routes').html($('#show_routes').html()+(j++)+':'+obj.subwayLineSites[i].siteName + '<br>');
				}
				$('#show_end_site').val(obj.subwayLineSites[i].siteName);
				$('#show_routes').html($('#show_routes').html() + '到达');
				$('#show_lines_pass_by').text(obj.lineNumber);
				$('#show_sites_number_pass_by').text(j-2);
				$('#show_price').text(obj.price + ' 元');
				$('#buy_ticket_div').show();
			},
			error:function(){}
			
		});
	});
	
	//点击购买按钮
	$('#buy_ticket_div').on('click',function(){
		var show_lines_pass_by = $('#show_lines_pass_by').text();
		var show_sites_number_pass_by = $('#show_sites_number_pass_by').text();
		var price = parseInt($('#show_price').text());
		var startTime = $('#startDate').val();
		var show_start_site = $('#show_start_site').val();
		var show_end_site = $('#show_end_site').val();
		
		console.log('show_start_site : ' + show_start_site);
		console.log('show_end_site : ' + show_end_site);
		
		if(startTime == ''){
			$('#remindNotChooseStartTimeModal').modal('show');
		}
		else{
			var buyPriceObj = {
					'linesPassBy':show_lines_pass_by,
					'sitesNumberPassBy':show_sites_number_pass_by,
					'price':''+price,
					'startTime':startTime,
					'startPlace':show_start_site,
					'endPlace':show_end_site
					
			}
			
			
			$.ajax({
				type:'POST',
				data:buyPriceObj,
				url:getRootPath() + '/buyTicket/buy',
				success:function(message){
					if(message == 'no login'){
						$('#remindUserNotLoginModal').modal('show');
					}
					else if(message == 'money not enough'){
						$('#remindMoneyNotEnoughModal').modal('show');
					}
					else{
						$('#buyTicketSuccessModal').modal('show');
					}
				},
				error:function(){}
			});
			
		}
		
		
	});
	
	//提醒用户尚未登录模态框点击确定按钮
	$('#remind_user_not_login_ensure').click(function(){
		$('#remindUserNotLoginModal').modal('hide');
		$('#loginModal').modal('show');
	});
	//提醒用户尚未登录模态框点击取消按钮
	$('#remind_user_not_login_cancel').click(function(){
		$('#remindUserNotLoginModal').modal('hide');
	});
	
	//购买成功点击确定按钮
	$('#buy_ticket_success_ensure').click(function(){
		$('#buyTicketSuccessModal').modal('hide');
	});
	
	//提醒余额不足点击确定
	$('#remind_money_not_enough_ensure').click(function(){
		$('#remindMoneyNotEnoughModal').modal('hide');
		$('#rechargeModal').modal('show');
	});
	//提醒余额不足点击取消
	$('#remind_money_not_enough_cancel').click(function(){
		$('#remindMoneyNotEnoughModal').modal('hide');
	});
	//充值模态框点击确定
	$('#recharge_ensure').click(function(){
		var recharge_money = $('#recharge_money').val();
		var obj = {
				'rechargeMoney':recharge_money
		}
		$.ajax({
			type:'POST',
			data:obj,
			url:getRootPath() + '/buyTicket/recharge',
			success:function(message){
				if("success" == message){
					$('#rechargeModal').modal('hide');
					$('#rechargeSuccessModal').modal('show');
				}
			},
			error:function(){}
		});
	});
	//充值模态框点击取消
	$('#recharge_cancel').click(function(){
		$('#rechargeModal').modal('hide');
	});
	
	//充值成功模态框点击确定
	$('#recharge_success_ensure').click(function(){
		$('#rechargeSuccessModal').modal('hide');
	});
	//提醒尚未选择出发日期模态框点击确定
	$('#remind_not_choose_start_time_ensure').click(function(){
		$('#remindNotChooseStartTimeModal').modal('hide');
	});
	
});