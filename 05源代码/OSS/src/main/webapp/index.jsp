<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/28
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.oss.domain.*" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>在线学习系统后台</title>
    <base target="iframe_a">
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css">
    <script type="text/javascript" src="/159000701OSS/jquery-easyui-1.5.3/jquery.min.js"></script>
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
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">在线学习系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">

        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <%=((User)session.getAttribute("user")).getUsername()%>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div id="index" class="layui-side layui-bg-black" style="height: 720px">
        <div  class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <div class="layui-side layui-bg-black">
                <div class="layui-side-scroll " >
                    <div title="菜单缩放" class="kit-side-fold"><i class="fa fa-navicon" aria-hidden="true"></i></div>
                    <ul id="sidemenubar" lay-filter="test" ></ul>
                </div>
            </div>
        </div>
    </div>


    <!-- 选项卡要显示的地方 -->
    <div class="layui-body">
        <div class="layui-tab" lay-filter="tabs" lay-allowClose="true" >
            <ul class="layui-tab-title">
            </ul>
            <div class="layui-tab-content" style="background-image:url(/159000701OSS/images/black.jpg);height: 100%;background-repeat:no-repeat;background-size:100% 100%;">

            </div>
        </div>
    </div>



    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
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
            ,nodes: <%=session.getAttribute("menu")%>
            ,autoRefresh:true
            ,click: function(node){
                console.log(node.id);
                var exist=$("li[lay-id='"+node.id+"']").length;
                if (exist > 0) {//判断是否已经发开选项卡
                    element.tabChange('tabs', node.id);// 切换到已有的选项卡
                } else {//如果没打开就新建一个选项卡
                    if (node.href!=null) {

                        element.tabAdd('tabs', {
                            title:node.name//选项卡的名称
                            //把这个页面嵌套进选项卡中
                            ,content:'<iframe name="iframe_a" scrolling="no" frameborder="0" src="'+node.href+'" width="99%" height="99%"></iframe>'//支持传入html
                            //这是选项卡的id
                            ,id:node.id
                        });
                        element.tabChange('tabs', node.id);
                    }
                }
            }
        });

    });


</script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
    var isShow = true;  //定义一个标志位
    $('.kit-side-fold').click(function(){
        //选择出所有的span，并判断是不是hidden
        $('.layui-nav-item span').each(function(){
            if($(this).is(':hidden')){
                $(this).show();
            }else{
                $(this).hide();
            }
        });
        //判断isshow的状态
        if(isShow){
            $('.layui-side.layui-bg-black').width(60); //设置宽度
            $('.kit-side-fold i').css('margin-right', '70%');  //修改图标的位置
            //将footer和body的宽度修改
            $('.layui-body').css('left', 60+'px');
            $('.layui-footer').css('left', 60+'px');
            //将二级导航栏隐藏
            $('dd span').each(function(){
                $(this).hide();
            });
            //修改标志位
            isShow =false;
        }else{
            $('.layui-side.layui-bg-black').width(200);
            $('.kit-side-fold i').css('margin-right', '10%');
            $('.layui-body').css('left', 200+'px');
            $('.layui-footer').css('left', 200+'px');
            $('dd span').each(function(){
                $(this).show();
            });
            isShow =true;
        }
    });

</script>

</body>
</html>
