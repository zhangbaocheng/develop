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
$(function(){
    var uri = getRootPath();
    $('#show_passenget_manage').datagrid({
        width : 800,
        //url : 'content.json',
        url : uri + '/admin/showAllPassenger',
        title : '用户列表',
        iconCls : 'icon-search',
        columns : [[
            {
                field : 'name',
                title : '账号',
                sortable : true,
                width:120,
            },
            {
                field:'nickName',
                title:'昵称',
                width:120,
            },
            {
                field:'password',
                title:'密码',
                formatter:function(val){
                    return '······';
                },
                width:120,
            },
            {
                field : 'email',
                title : '邮件',
                sortable : true,
                width:120,
                //sorter : function (a,b) {
                //console.log(a + '|' + b);
                //},
            },
            {
                field:'phoneNumber',
                title:'联系方式',
                width:120,
            },
            {
                field:'registerTime',
                title:'注册时间',
                formatter:function(value){
                    var date = new Date(value);
                    return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDay();
                },
                width:120,
            }
        ]],
        pagination : true,
        pageSize : 5,
        pageList : [5, 10, 15],
        pageNumber : 1,
        pagePosition : 'bottom',
        sortName : 'name',
        sortOrder : 'DESC',
        remoteSort : false,
        //multiSort : true,
        //method : 'get',
        queryParams : {
            id : 1,
        }
    });

});

