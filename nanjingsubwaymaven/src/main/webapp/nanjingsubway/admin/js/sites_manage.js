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
    $('#show_news_manage').datagrid({
        width : 800,
        //url : 'content.json',
        url : uri + '/admin/showAllSites',
        title : '线路站点列表',
        iconCls : 'icon-search',
        columns : [[
            {
                field : 'siteName',
                title : '站点名称',
                sortable : true,
                width:120,
                //sorter : function (a,b) {
                //console.log(a + '|' + b);
                //},
            },
            {
                field:'lineNumber',
                title:'所在线路',
                width:180,
            },

            {
                field:'siteDetails',
                title:'站点细节信息',
                width:120,
            },
            {
                field:'recharged',
                title:'是否可充值',
                width:120,
                formatter:function(value){
                    if(value == 'y'){
                        return "是";
                    }
                    else{
                        return "否";
                    }
                }
            },
            {
                field:'toilet',
                title:'是否有卫生间',
                width:120,
                formatter:function(value){
                    if(value == 'y'){
                        return "是";
                    }
                    else{
                        return "否";
                    }
                }
            },
        ]],
        toolbar:'#tb',
        pagination : true,
        pageSize : 5,
        pageList : [5, 10, 15],
        pageNumber : 1,
        pagePosition : 'bottom',
        sortName : 'lineNumber',
        sortOrder : 'DESC',
        remoteSort : false,
        //multiSort : true,
        //method : 'get',
        queryParams : {
            id : 1,
        },
        singleSelect:true,
    });



});

