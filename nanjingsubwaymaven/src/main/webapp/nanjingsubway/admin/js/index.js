$(function(){

    /*点击活动管理*/
    $('#activity_manage').click(function(){
        $('#content').load(getRootPath() + '/admin/showNews');
    });

    /*点击路线管理*/
    $('#routes_manage').click(function(){
        $('#content').load(getRootPath() + '/admin/showSites');
    });

    /*点击乘客管理*/
    $('#passenger_manage').click(function(){
        console.log('passenger_manage')
        $('#content').load(getRootPath() + '/admin/showPassenger');
    });

    /*点击班次管理*/
    $('#banci_manage').click(function(){

    });




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
