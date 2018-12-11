<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/28
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>系统登录</title>
    <link rel="stylesheet" href="/159000701OSS/css/logl.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script src="/159000701OSS/layui/layui.js"></script>
    <script type="text/javascript">
        function loginCheck(){
            var username = document.getElementById("username");
            var password = document.getElementById("password");
            if(username.value==""&& password.value==""){
                alert("密码和用户名不能为空");
                return false;
            }
            if(username.value==""){
                alert("用户名不能为空");
                return false;
            }
            if(password.value==""){
                alert("密码不能为空");
                return false;
            }
            return true;
        }
    </script>


</head>
<body style="background-image:url(/159000701OSS/images/black.jpg);background-repeat:no-repeat;background-size:100% 100%;">
<div class="hei"></div>

<div class="denglu">
    <div  style="  width: 800px;font-size: 100px;font-family: 华文琥珀;text-align: center; color: white;"><b style="background: linear-gradient(to right, #009dff, #223aff);
            -webkit-background-clip: text;
            color: transparent;">在线学习系统</b></div>
    <div class="denglu_2">Online Study System</div>
    <form action="/159000701OSS/login" method="post">
        <div style="margin-top: 50px;margin-left: 120px"><i class="layui-icon layui-icon-username" style="font-size: 35px; color: #ffffff;"></i>  <input style="width: 500px;height: 30px;font-size: 24px;font-family: 方正舒体;border-radius: 10px" type="text" name="username" placeholder="用户名"></div>
        <div style="margin-top: 50px;margin-left: 120px"><i class="layui-icon layui-icon-password" style="font-size: 35px; color: #ffffff;"></i>  <input style="width: 500px;height: 30px;font-size: 24px;font-family: 方正舒体;border-radius: 10px" type="password" name="password" placeholder="密码"></div>
        <input style="margin-top: 14px;margin-left: 35%"type="submit" value="登  录"  class="layui-btn" lay-submit lay-filter="formDemo" onclick="return loginCheck()"  />
        <a href="/159000701OSS/register.jsp" class="layui-btn" style="margin-left: 100px;margin-top: 14px">注册</a>
    </form>
</div>

</body>
<script>

</script>

</html>