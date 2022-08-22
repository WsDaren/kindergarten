<%--
  Created by IntelliJ IDEA.
  User: SkLily
  Date: 2022/8/6
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>

<legend>分配角色</legend>
<div class="layui-form layuimini-form">
    <table class="layui-table" style="text-align: center">
        <thead>
        <tr>
            <th>操作</th>
            <th>ID</th>
            <th>角色名</th>
            <th>角色描述</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${roles}" var="role">
            <tr>
                <td><input type="checkbox" lay-skin="primary" lay-filter="checkboxs" value="${role.rid}" onchange="dianji()"></td>
                <td>${role.rid}</td>
                <td>${role.rolename}</td>
                <td>${role.roledes}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">添加角色</button>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;
        var uid = parent.uuid;
        var rids = [];
        //判断多选框是否被选中
        form.on('checkbox(checkboxs)', function(data){
            if(data.elem.checked){//选中时添加rid
                rids.push(data.elem.value);
            }else if(!data.elem.checked){//取消选中后移除rid
                var key = rids.indexOf(data.elem.value);
                rids.splice(key,1);
            }
            alert(rids);
        });
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.ajax({
                url:'/ssmredisshiro/uaddRoles.do',
                type:'post',
                data:{
                    uid:uid,
                    rids:rids,
                },
                success:function (data) {
                    if(data==rids.length){
                        var index = layer.alert("添加角色成功", {
                            title: '添加角色成功'
                        }, function () {
                            //关闭弹出层
                            layer.close(index);
                            var iframeIndex = parent.layer.getFrameIndex(window.name);
                            parent.layer.close(iframeIndex);
                            parent.layui.table.reload("currentTableId");
                        });
                    }
                }
            });
            return false;
        });

    });
</script>
</body>
</html>

