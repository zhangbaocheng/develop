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
        url : uri + '/admin/showAllNews',
        title : '活动列表',
        iconCls : 'icon-search',
        columns : [[
            {
                field : 'newsId',
                title : '活动id',
                sortable : true,
                width:120,
            },
            {
                field:'newsTheme',
                title:'活动主题',
                width:120,
            },
            {
                field:'newsContent',
                title:'活动内容',
                width:120,
            },
            {
                field : 'newsReleaseDate',
                title : '活动发布日期',
                sortable : true,
                width:120,
                //sorter : function (a,b) {
                //console.log(a + '|' + b);
                //},
            },
            {
                field:'newsDate',
                title:'举办日期',
                width:120,
            },
        ]],
        toolbar:'#tb',
        pagination : true,
        pageSize : 5,
        pageList : [5, 10, 15],
        pageNumber : 1,
        pagePosition : 'bottom',
        sortName : 'newsId',
        sortOrder : 'DESC',
        remoteSort : false,
        //multiSort : true,
        //method : 'get',
        queryParams : {
            id : 1,
        },
        singleSelect:true,
    });


    $('#news_add').click(function(){
        $('#releaseNewsModal').modal('show');
    });

    $('#release_news_ensure').click(function () {
        var newsTheme = $('#news_theme').val();
        var newsContent = $('#news_content').val();
        var newsDate = $('#news_date').val();
        var newsObj = {
            newsTheme:newsTheme,
            newsContent:newsContent,
            newsDate:newsDate,
        }
        $.ajax({
            type:'POST',
            data:newsObj,
            url:getRootPath()+'/admin/releaseNews',
            success:function (response) {
                if(response == 'success'){
                    console.log('cussess');
                    $('#releaseNewsSuccessModal').modal('show');
                    $('#releaseNewsModal').modal('hide');
                }
                else{
                    console.log('error');
                }
            },
        });
    });

    $('#release_news_cancel').click(function(){
        $('#releaseNewsModal').modal('hide');
    });

    $('#release_news_success_ensure').click(function () {
        $('#releaseNewsSuccessModal').modal('hide');
    });


});

