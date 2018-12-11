<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/6
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>add</title>
    <base href="<%=basePath%>">
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
<form id="batchfrom" class="layui-form" action="" style="width: 30%;margin-top: 200px;margin-left: 500px">
    <div class="layui-form-item">
        <label class="layui-form-label" style="color: white">批次名</label>
        <div class="layui-input-block">
            <select name="batchid" lay-verify="required">
                <option value="0">—无—</option>
                <c:forEach items="${requestScope.batchs}" var="item">
                    <option value="${item.batchid}">${item.batchname}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item" style="margin-left: 20%">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo" onclick="sbm()">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script>
    layui.use('form', function(){
        var form = layui.form;
        form.render();
    });
function sbm() {
    $.ajax({
        url:"/159000701OSS/ChooseBatch",
        type:"post",
        data:$('#batchfrom').serialize(),
        datatype:"json",
        success:function (data) {
            if (data==1) {alert("已经选择过了");}
            else{alert("选择成功");}
        }

    })
}

</script>

</body>
</html>
