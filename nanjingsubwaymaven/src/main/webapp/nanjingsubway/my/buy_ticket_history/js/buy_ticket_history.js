$(function(){
	$.ajax({
		type:'POST',
		url:getRootPath() + '/buyTicket/isLogin',
		success:function(message){
			if(message == 'no user'){
				$('#remindUserNotLoginModal').modal('show');
			}
			else{//登录才进行查找历史记录
				$.ajax({
					type:'POST',
					url:getRootPath() + '/buyTicket/buyTicketHistory',
					success:function(message){
						var str = '<table class="table table-striped table-bordered table-hover">';
						var str = str + '<tr>';
						var str = str + '<th>出发站点</th>';
						var str = str + '<th>到达站点</th>';
						var str = str + '<th>价格</th>';
						var str = str + '<th>购买日期</th>';
						var str = str + '<th>出发时间</th>';
						var str = str + '<th>是否评价过</th>';
						var str = str + '<th>经过的线路</th>';
						var str = str + '<th>经过的站点数</th>';
						var str = str + '<th>操作</th>';
						var str = str + '</tr>';
						for(var i in message){
							str = str + '<tr>';
							for(var j in message[i]){
								if(j == 'isEvaluation'){
									if(message[i][j]=='y'){
										str = str + '<td>是</td>';
									}
									else{
										str = str + '<td>否</td>';
									}
								}
								else if(j != 'buyTicketId' && j != 'passengerId'){
									str = str + '<td>' + message[i][j] + '</td>';
								}
							}
							if(message[i].isEvaluation == 'n'){
								str = str + '<td><button class="btn btn-info btn-sm" onclick="evaluation('+message[i].buyTicketId+')">乘车评价</button>';
							}
							else{
								str = str + '<td><button class="btn btn-info btn-sm" onclick="showEvaluationContent('+message[i].buyTicketId+')">查看评价</button>';
							}
							str = str + ' <button class="btn btn-warning btn-sm"onclick="buyAgain('+message[i].buyTicketId+')">再次购买</button></td></tr>';
							str = str + '</tr>';
						}
						str = str + '</table>';
//						console.log(str);
						$('#show_buy_history').html(str);
					},
					error:function(){}
				});
			}
			
		},
		error:function(){}
	});
	
	//提醒用户没登录模态框点击确定
	$('#remind_user_not_login_ensure').click(function(){
		$('#remindUserNotLoginModal').modal('hide');
		$('#loginModal').modal('show');
	});
	//提醒用户没登录模态框点击取消
	$('#remind_user_not_login_cancel').click(function(){
		$('#remindUserNotLoginModal').modal('hide');
	});
	$('#show_evaluation_ensure').on('click',function(){
		var evaluationObj = {
				buyTicketId:$('#evaluationBuyTiekct').val(),
				evaluationStars:$('#evaluation_stars').val(),
				evaluationContent:$('#evaluation_content').val()
		}
		$.ajax({
			type:'POST',
			data:evaluationObj,
			url:getRootPath() + '/buyTicket/evaluation',
			success:function(response){
				if(response == "success"){
					$('#showEvaluationModal').modal('hide');
					$('#evaluationSuccessModal').modal('show');
				}
				else{
					$('#evaluationErrorModal').modal('show');
				}
			}
		});
	});
	
	$('#evaluation_success_ensure').on('click',function(){
		$('#evaluationSuccessModal').modal('hide');
		$('body').oneTime(500,function(){
			$('#show_body_content').load('nanjingsubway/my/buy_ticket_history/jsp/buy_ticket_history.jsp');
		});
	});
	$('#show_evaluation_cancel').click(function(){
		$('#showEvaluationModal').modal('hide');
	});
//	$('#evaluationSuccessModal').on('hide.bs.modal', function () {
//		$('#buy_ticket_history').trigger('click');
//	} );
	
	
	
});

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
//显示评价页面
function evaluation(buyTicketId){
	console.log('评价：'+buyTicketId);
	$('#evaluation_stars').removeAttr('disabled');
	$('#evaluation_content').removeAttr('readonly');
	$('#evaluation_stars').val('5');
	$('#evaluation_content').val('好评！');
	$('#showEvaluationModal').modal('show');
	$('#evaluationBuyTiekct').val(buyTicketId);
}
//再次购买
function buyAgain(buyTicketId){
	console.log('再次购买：'+buyTicketId);
	$.ajax({
		type:'GET',
		url:getRootPath() + '/buyTicket/buyAgain?buyTicketId='+buyTicketId,
		success:function(response){
			if(response == "success"){
				console.log('购买成功');
				$('#buyTicketAgainSuccessModal').modal('show');
				
			}
		}
	});
	
}
//查看评价内容
function showEvaluationContent(buyTicketId){
	console.log('查看评价内容：'+buyTicketId);
	$.ajax({
		type:'GET',
		url:getRootPath() + '/buyTicket/showEvaluationContent?buyTicketId='+buyTicketId,
		success:function(passengerEvaluation){
			$('#evaluation_stars').val(passengerEvaluation.evaluationStars);
			$('#show_evaluation_ensure').hide();
			$('#show_evaluation_cancel').html('确定');
			$('#evaluation_stars').attr('disabled','true');
			$('#evaluation_content').attr('readonly','true');
			$('#evaluation_content').val(passengerEvaluation.evaluationContent);
			$('#showEvaluationModal').modal('show');
		}
	});
}
//再次购票成功模态框点击确定
$('#buy_ticket_again_success_ensure').click(function(){
	$('#buyTicketAgainSuccessModal').modal('hide');
	$('body').oneTime(500,function(){
		$('#show_body_content').load('nanjingsubway/my/buy_ticket_history/jsp/buy_ticket_history.jsp');
	});
});