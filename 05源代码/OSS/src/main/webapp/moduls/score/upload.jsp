<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/13
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/159000701OSS/js/jquery-form.js"></script>
    <title>excel导入</title>
    <script type="text/javascript">
        //ajax 方式上传文件操作
        $(document).ready(function(){
            $('#btn').click(function(){
                if(checkData()){
                    $('#form1').ajaxSubmit({
                        url:'/159000701OSS/ajaxUpload.do',
                        dataType: 'text',
                        success: resutlMsg,
                        error: errorMsg
                    });
                    function resutlMsg(msg){
                        alert(msg);
                        $("#upfile").val("");
                    }
                    function errorMsg(){
                        alert("导入excel出错！");
                    }
                }
            });
        });

        //JS校验form表单信息
        function checkData(){
            var fileDir = $("#upfile").val();
            var suffix = fileDir.substr(fileDir.lastIndexOf("."));
            if("" == fileDir){
                alert("选择需要导入的Excel文件！");
                return false;
            }
            if(".xls" != suffix && ".xlsx" != suffix ){
                alert("选择Excel格式的文件导入！");
                return false;
            }
            return true;
        }
    </script>
</head>

<body>
<div>提交excel格式 成绩表</div>
<form method="POST"  enctype="multipart/form-data" id="form1" action="">
    <table>
        <tr>
            <td>上传文件: </td>
            <td> <input id="upfile" type="file" name="upfile"></td>
        </tr>
        <tr>
            <td><input type="button" value="提交" id="btn" name="btn" ></td>
        </tr>
    </table>
</form>

</body>

