<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/5
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>add</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script src="/159000701OSS/layui/layui.js"></script>
    <script src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
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
<form class="layui-form" action="/159000701OSS/uploadfile" style="width: 80%;margin-top: 50px" method="post" enctype="multipart/form-data">
    <div class="layui-form-item">
        <label class="layui-form-label">文件名</label>
        <div class="layui-input-block">
            <input type="text" name="name"  required  lay-verify="required" placeholder="请输入文件名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">文件</label>
        <div class="layui-input-block">
            <input type="file" name="file" required  lay-verify="required" placeholder="请输入课程名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">文件描述</label>
        <div class="layui-input-block">
            <input type="text" name="text" required  lay-verify="required" placeholder="请输入文件描述" autocomplete="off" class="layui-input" >
        </div>

    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">文件类型</label>
        <div class="layui-input-block">
            <select name="type" lay-verify="required">
                    <option value="0">视频</option>
                    <option value="1">课件</option>
            </select>
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

</script>

</body>
</html>
