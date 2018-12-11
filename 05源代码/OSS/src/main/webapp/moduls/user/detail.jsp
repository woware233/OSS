<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/31
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>detail</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script src="/159000701OSS/layui/layui.js"></script>
    <style>
        .layui-tree li i{
            color: rgba(255,255,255,.7);
            display: none;
        }
        .layui-tree li a cite{
            color: rgba(255,255,255,.7)
        }
        .layui-tree li .layui-tree-spread{
            display: block;
            position: absolute;
            right: 30px;
        }
        .layui-tree li{
            line-height: 45px;
            position: relative;
        }
        .layui-tree li ul{
            margin-left: 0;
            background: rgba(0,0,0,.3);
        }
        .layui-tree li ul a{
            padding-left: 20px;
        }
        .layui-tree li a{
            height: 45px;
            border-left: 5px solid transparent;
            box-sizing: border-box;
            width: 100%;
        }
        .layui-tree li a:hover{
            background: #4E5465;
            color: #fff;
            border-left: 5px solid #009688;
        }
        .layui-tree li a.active{
            background: #009688;
        }

    </style>
</head>
<body>
<form class="layui-form" action="" style="width: 400px;margin-top: 150px;margin-left: 550px">
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">用户名</label>
        <div class="layui-input-block">
            <input type="text" id="username" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">密码</label>
        <div class="layui-input-inline">
            <input type="password" id="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">*</div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">姓名</label>
        <div class="layui-input-inline">
            <input type="text" id="studentname" name="studentname" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
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
            <input type="text" id="email" name="email" required  lay-verify="required" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">电话</label>
        <div class="layui-input-block">
            <input type="text" id="phone" name="phone" required  lay-verify="required" placeholder="请输入电话" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item" style="margin-left: 10%">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });

    $.ajax({
        url:"/159000701OSS/selectStudentinfo",
        type:"post",
        data:{},
        dataType: "json",
        success: function (data) {
            var info=data.data;
            $("#username").val(info.username);
            $("#password").val(info.password);
            $("#studentname").val(info.studentname);
            $("#email").val(info.email);
            $("#phone").val(info.phone);
        }
    });
</script>

</body>
</html>
