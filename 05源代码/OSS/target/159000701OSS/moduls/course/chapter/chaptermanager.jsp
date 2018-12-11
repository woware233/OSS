<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/2
  Time: 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.oss.domain.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <base href="<%=basePath%>">
    <title>在线学习系统后台</title>
    <base target="iframe_a">
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="/159000701OSS/js/jquery.ztree.core-3.5.min.js"></script>
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
<script>

        function addchapter() {
            var courseid=<%=session.getAttribute("courseid")%>
            layer.open({
                type: 2,
                title: '添加章节',
                shadeClose: true,
                shade: 0.8,
                area: ['40%', '70%'],
                content: ['/159000701OSS/addchapter.do?courseid='+courseid, 'no'] //iframe的url
            });
        }

</script>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">章节管理</div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a id="addchapter"  onclick="addchapter()">添加</a></li>
            <li class="layui-nav-item"><a href="">删除</a></li>
        </ul>
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

            <li class="layui-nav-item"><a href=""></a></li>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->

                    <ul id="treeDemo" class="ztree"></ul>

        </div>
    </div>


    <!-- 选项卡要显示的地方 -->
    <div class="layui-body">
        <div class="layui-tab" lay-filter="tabs" lay-allowClose="true" >
            <ul class="layui-tab-title">
            </ul>
            <div class="layui-tab-content">

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
            ,nodes: <%=session.getAttribute("chaptermenu")%>
            ,autoRefresh:true
            ,click: function(node){
                console.log(node.id);
                var url="/159000701OSS/moduls/course/chapter/coursefile/coursefilemanager.jsp?chapterid="+node.id
                var exist=$("li[lay-id='"+node.id+"']").length;
                console.log(exist)
                if (exist > 0) {//判断是否已经发开选项卡
                    element.tabChange('tabs', node.id);// 切换到已有的选项卡
                } else {//如果没打开就新建一个选项卡
                        element.tabAdd('tabs', {
                            title:node.name//选项卡的名称
                            //把这个页面嵌套进选项卡中
                            ,content:'<iframe name="iframe_a" scrolling="no" frameborder="0" src='+url+' width="99%" height="99%"></iframe>'//支持传入html
                            //这是选项卡的id
                            ,id:node.id
                        });
                        element.tabChange('tabs', node.id);
                    }
                }


        });

    });
</script>
</body>
</html>
