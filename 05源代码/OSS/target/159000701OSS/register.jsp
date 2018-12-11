<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/28
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>

    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script src="/159000701OSS/layui/layui.js"></script>
</head>
<body style="background-image:url(/159000701OSS/images/black.jpg);background-repeat:no-repeat;background-size:100% 100%;">
<p style="color: white;font-size: 50px;margin-left: 870px;top:120px;position: absolute;font-family: 华文彩云">register</p>
<form class="layui-form" action="/159000701OSS/register" style="width: 500px;margin-left: 650px;margin-top: 200px">
    <div class="layui-form-item">
    <label class="layui-form-label" style="color: white">用户名</label>
    <div class="layui-input-block">
        <input type="text" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
    </div>
</div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">密码</label>
        <div class="layui-input-block">
            <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="studentname" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">性别</label>
        <div class="layui-input-block">
            <select name="sex" lay-verify="required">
                <option value="0">男</option>
                <option value="1">女</option>

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">邮箱</label>
        <div class="layui-input-block">
            <input type="text" name="email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">电话</label>
        <div class="layui-input-block">
            <input type="text" name="phone" required  lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" style="margin-left: 100px">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script>
    //Demo
    layui.use('form', function() {
        var form = layui.form;

        //监听提交
        function addUser() {
            $.ajax({
                url: 'addUserAction',
                data: form,
                type: "post",
                scriptCharset: 'UTF-8',
                error: function () {
                    if (form == null) {
                        alert("添加一条数据！");
                    }

                },
                success: function (ress) {
                    console.log(ress);

                }
            });

        }
    });
</script>

</body>
</html>
