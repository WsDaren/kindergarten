<%--
  Created by IntelliJ IDEA.
  User: SkLily
  Date: 2022/6/22
  Time: 22:47
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

<legend>订单信息</legend>
<div class="layui-form layuimini-form">
    <div class="layui-form-item">
        <label class="layui-form-label required">订单编号</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.orderno}" class="layui-input">
        </div>
        <label class="layui-form-label required">下单时间</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.order_time_str}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">路线名称</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.product.product_name}" class="layui-input">
        </div>
        <label class="layui-form-label required">出发城市</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.product.city_name}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">出发时间</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.product.send_time_str}" class="layui-input">
        </div>
        <label class="layui-form-label required">出发人数</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.perple_count}" class="layui-input">
        </div>
    </div>
<legend>其他信息</legend>
    <div class="layui-form-item">
    <label class="layui-form-label required">其他信息</label>
    <div class="layui-input-block">
        <input type="text"  name="city_name"  value="${order.product.product_desc}" class="layui-input">
    </div>
    </div>
<legend>联系人信息</legend>
    <div class="layui-form-item">
        <label class="layui-form-label required">会员</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.member.nick_name}" class="layui-input">
        </div>
        <label class="layui-form-label required">联系人</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.member.member_name}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label required">手机号</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.member.mphone}" class="layui-input">
        </div>
        <label class="layui-form-label required">身份证</label>
        <div class="layui-input-inline">
            <input type="text"  name="product_name"  value="${order.member.credent_no}" class="layui-input">
        </div>
    </div>
        <table class="layui-table" style="text-align: center">
            <thead>
            <tr>
                <th>操作</th>
                <th>ID</th>
                <th>姓名</th>
                <th>性别</th>
                <th>手机号码</th>
                <th>证件类型</th>
                <th>证件号码</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${order.list}" var="traveller">
                    <tr>
                        <td><input type="checkbox" lay-skin="primary"></td>
                        <td>${traveller.tid}</td>
                        <td>${traveller.traveller_name}</td>
                        <td>${traveller.tsex}</td>
                        <td>${traveller.tphone}</td>
                        <td>${traveller.tcredent_type}</td>
                        <td>${traveller.tcredent_no}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
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
        var order = parent.myjson;
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
                    id:product.id,
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

