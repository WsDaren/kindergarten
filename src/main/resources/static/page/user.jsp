<%--
  Created by IntelliJ IDEA.
  User: SkLily
  Date: 2022/6/22
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">

        <fieldset class="table-search-fieldset">
            <legend>搜索信息</legend>
            <div style="margin: 10px 10px 10px 10px">
                <form class="layui-form layui-form-pane" action="">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">产品名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="product_name" autocomplete="off" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <button type="submit" class="layui-btn layui-btn-primary"  lay-submit lay-filter="data-search-btn"><i class="layui-icon"></i> 搜 索</button>
                        </div>
                    </div>
                </form>
            </div>
        </fieldset>

        <script type="text/html" id="toolbarDemo">
            <div class="layui-btn-container">
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="add"> 添加 </button>
                <button class="layui-btn layui-btn-sm layui-btn-danger data-delete-btn" lay-event="delete"> 批量删除 </button>
                <button class="layui-btn layui-btn-normal layui-btn-sm data-add-btn" lay-event="openExcel"> 导出 </button>
            </div>
        </script>

        <table class="layui-hide" id="currentTableId" lay-filter="currentTableFilter"></table>

        <script type="text/html" id="currentTableBar">
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="edit">查看详情</a>
            <a class="layui-btn layui-btn-normal layui-btn-xs data-count-edit" lay-event="fenpei">分配角色</a>
            <a class="layui-btn layui-btn-xs layui-btn-danger data-count-delete" lay-event="delete">删除</a>&nbsp;&nbsp;
        </script>

        <style type="text/css">
            .layui-table-cell{
                text-align: center;
                height: auto;
                white-space: normal;
            }
            .layui-table img{
                max-width: 100px;
            }
        </style>

    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    var uuid;
    var myjson ;
    layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;

        table.render({
            elem: '#currentTableId',
            url: '/project/user/list',
            toolbar: '#toolbarDemo',
            defaultToolbar: ['filter', 'exports', 'print', {
                title: '提示',
                layEvent: 'LAYTABLE_TIPS',
                icon: 'layui-icon-tips'
            }],
            cols: [[
                {type: "checkbox", width: 50},
                {field: 'user_id', width: 150,height: 100, title: 'ID'},
                {field: 'user_name', width: 150, title: '账号'},
                {field: 'user_portrait',width: 150, title: '姓名'},
                {field: 'user_phone', width: 150, title: '密码'},
                {field: 'is_delete', width: 150, title: '盐'},
                {field: 'create_time', width: 150, title: '电话'},
                {field: 'update_time', width: 50, title: '状态'},
                {field: 'guardian_id', width: 50, title: '状态'},
                {title: '操作', minWidth: 50, toolbar: '#currentTableBar', align: "center"}
            ]],
            limits: [ 5, 10, 15, 20, 25],
            limit: 5,
            page: true,
            skin: 'line'
        });
        // 监听搜索操作
        form.on('submit(data-search-btn)', function (data) {
            // var result = JSON.stringify(data.field);
            // layer.alert(result, {
            //     title: '最终的搜索信息'
            // });
            //执行搜索重载
            table.reload('currentTableId', {
                page: {
                    curr: 1
                }
                , where: {
                    product_name:data.field.product_name,
                }
            }, 'data');

            return false;
        });

        /**
         * toolbar监听事件
         */
        table.on('toolbar(currentTableFilter)', function (obj) {
            if (obj.event === 'add') {  // 监听添加操作
                var index = layer.open({
                    title: '添加用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/add.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
            } else if (obj.event === 'delete') {  // 监听删除操作
                var checkStatus = table.checkStatus('currentTableId')
                    , data = checkStatus.data;
                var flag = 0;
                var str = "";
                for (var i = 0; i < data.length; i++) {
                    flag++;
                    str += data[i].oid+",";
                }
                $.ajax({
                    url:'/ssmredisshiro/deletemore.do',
                    type:'post',
                    data:{
                        str:str
                    },
                    success:function (data) {
                        if(data==flag){
                            var index = layer.alert("删除成功", {
                                title: '删除成功'
                            }, function () {
                                // 关闭弹出层
                                layer.close(index);
                                var iframeIndex = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(iframeIndex);
                                layui.table.reload("currentTableId");
                            });
                        }
                    }
                });
            }else if(obj.event === 'openExcel'){//导出：使用poi技术导出excel
                var page=$(".layui-laypage-skip").find("input").val() //当前页码值
                var limit=$(".layui-laypage-limits").find("option:selected").val() //分页数目
                window.location.href="/ssmredisshiro/import.do?page="+page+"&limit="+limit;
            }
        });

        //监听表格复选框选择
        table.on('checkbox(currentTableFilter)', function (obj) {
            console.log(obj)
        });

        table.on('tool(currentTableFilter)', function (obj) {
            var data = obj.data;
            myjson = data;
            if (obj.event === 'edit') {
                uuid = data.uid;
                var index = layer.open({
                    title: '编辑用户',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/usershow.jsp',
                        });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            }else if(obj.event === 'fenpei'){
                uuid = data.uid;
                $.ajax({
                    url:'/ssmredisshiro/ufindRolesById.do',
                    type:'post',
                    data:{
                        uid:data.uid,
                    },
                    success:function (data) {
                    }
                });
                var index = layer.open({
                    title: '分配角色',
                    type: 2,
                    shade: 0.2,
                    maxmin:true,
                    shadeClose: true,
                    area: ['100%', '100%'],
                    content: '../page/usershowone.jsp',
                });
                $(window).on("resize", function () {
                    layer.full(index);
                });
                return false;
            }
            if (obj.event === 'delete') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url:'/ssmredisshiro/delete.do',
                        type:'post',
                        data:{
                            oid:data.oid
                        },
                        success:function (data) {
                            if(data==1){
                                var index = layer.alert("删除成功", {
                                    title: '删除成功'
                                }, function () {
                                    //关闭弹出层
                                    layer.close(index);
                                    var iframeIndex = parent.layer.getFrameIndex(window.name);
                                    parent.layer.close(iframeIndex);
                                    layui.table.reload("currentTableId");
                                });
                            }
                        }
                    });
                });
            }
        });
    });
</script>

</body>
</html>
