<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/6
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <link rel="stylesheet" href="/159000701OSS/video-js-7.3.0/video-js.css">
    <script type="text/javascript" src="/159000701OSS/video-js-7.3.0/video.js"></script>
    <script type="text/javascript" src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
    <style>
        .vjs-big-play-button{
            margin-left: 45%;
            margin-top:20%;
        }

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
<div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll " >
                <ul id="sidemenubar" lay-filter="test"></ul>
            </div>
        </div>
    </div>
</div>
    <script src="/159000701OSS/layui/layui.js"></script>
    <script>

        layui.use(['element','layer','jquery','tree'], function(){
            var element = layui.element;
            var layer = layui.layer;
            var $ = layui.jquery;

            layui.tree({
                elem: '#sidemenubar' //传入元素选择器
                ,nodes: <%=session.getAttribute("chaptermenuvideo")%>
                ,autoRefresh:true
                ,click: function(node){
                    console.log(node.id);
                    $.ajax({
                        type:"post",
                        url:"/159000701OSS/findVideoBychpterid",
                        data:{"chapterid":node.id},
                        dataType:"json",
                        success:function (data) {
                            var file=data.data;
                            console.log(file.id);


                        }

                    });


                }
            });

        });


    </script>
</body>
</html>

