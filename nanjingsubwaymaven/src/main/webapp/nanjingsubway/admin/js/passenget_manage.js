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
        width : 500,
        //url : 'content.json',
        url : uri + '/admin/showAllPassenger',
        title : '用户列表',
        iconCls : 'icon-search',
        columns : [[
            {
                field : 'name',
                title : '账号',
                sortable : true,
            },
            {
                field : 'email',
                title : '邮件',
                sortable : true,
                //sorter : function (a,b) {
                //console.log(a + '|' + b);
                //},
            },
        ]],
        pagination : true,
        pageSize : 1,
        pageList : [1, 2, 3],
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

