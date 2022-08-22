<%--
  Created by IntelliJ IDEA.
  User: SkLily
  Date: 2022/6/22
  Time: 22:47
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
    <style>
        body {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">产品名称</label>
        <div class="layui-input-block">
            <input type="text" id="product_name" name="product_name"  placeholder="请输入产品名称" value="" class="layui-input">
            <tip>产品名称</tip>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">出发城市</label>
        <div class="layui-input-block">
            <input type="text" id="city_name" name="city_name" placeholder="请输入出发城市" value="" class="layui-input">
            <tip>填写出发城市</tip>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">出发时间</label>
        <div class="layui-input-block">
            <input type="text" id="send_time" name="send_time" class="layui-input" placeholder="请输入出发时间">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">价格</label>
        <div class="layui-input-block">
            <input type="text" id="product_price" name="product_price" lay-verify="required"  placeholder="请输入价格" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">商品描述</label>
        <div class="layui-input-block">
            <input type="text" id="product_desc" name="product_desc" placeholder="请输入商品描述" value="" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="saveBtn">修改</button>
        </div>
    </div>
</div>
<script src="../lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form'], function () {
        var form = layui.form,
            layer = layui.layer,
            $ = layui.$;
        var product = parent.myjson;
        $("#product_name").val(product.product_name);
        $("#city_name").val(product.city_name);
        $("#send_time").val(product.send_time_str);
        $("#product_price").val(product.product_price);
        $("#product_desc").val(product.product_desc);
        //监听提交
        form.on('submit(saveBtn)', function (data) {
            $.ajax({
                url:'/ssmredisshiro/update.do',
                type:'post',
                data:{
                    pid:product.pid,
                    productno:product.productno,
                    product_name:$("#product_name").val(),
                    city_name:$("#city_name").val(),
                    send_time:$("#send_time").val(),
                    product_price:$("#product_price").val(),
                    product_desc:$("#product_desc").val(),
                },
                success:function (data) {
                    if(data==1){
                        var index = layer.alert("修改成功", {
                            title: '修改成功'
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

