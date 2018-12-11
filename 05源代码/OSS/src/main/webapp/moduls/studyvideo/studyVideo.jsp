<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/5
  Time: 13:45
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
            margin-top:22%;
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
<input id="videoid" type="hidden" value=""><input id="vplaytime" type="hidden" value="">
 <div id="Title" style="position: absolute;top: 30px;left: 120px" >

 </div>
<div id="aaa" style="color:white;position: absolute;top: 45px;left: 180px;font-size: 30px;font-family: 黑体;font-weight:bold;background: #3d5c9d;height: 50px;width: 1202px" >
    标题
</div>
<div style="color:white;position: absolute;bottom: 32px;left: 180px;height: 100px;width: 1202px;background: #3d5c9d;font-size: 20px;font-family: 新宋体;">简介：
<p id="text">

</p>
</div>
<div id="video_box" style="float: left;width: 1000px;margin-left: 180px;margin-top: 100px" >
<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" style="height: 570px">
    <source id="vid1" src="111" type="video/mp4">
</video>
</div>
<div  style="float: left; background-color: #3d5c9d;width: 200px;height: 570px;position: absolute;right: 280px;top: 100px">
    <ul id="aaaa" style="height: 100px;background: #0060ed;border-radius: 10%">课程名称</ul>
    <ul id="sidemenubar" lay-filter="test"></ul>
</div>
<script>
    $(document).ready(function () {
        var player;
        var isMousedown = false;
        var oldTime = 0, newTime = 0, maxTime = 0;
        var fileid=$("#videoid").val();
        var isFirst = true;
        $(function () {
            console.log("play.js loaded...");
            reloadVideo();

            console.log(fileid);
            var vplaytime=$("#vplaytime").val()
            player.currentTime(vplaytime);

        })

        function reloadVideo() {
            player && player.dispose();
            player = videojs('example_video_1', {fluid: true,autoplay:false}, function () {
                console.log('Good to go!');

            });


            player.on('play', function () {
                console.log('开始/恢复播放');
                var fileid=$("#videoid").val();
                console.log(isFirst)
                    if(isFirst==true){
                        $.ajax({
                            type: "post",
                            url: "/159000701OSS/updateFileinfo",
                            data: {"fileid": fileid},
                            dataType: "json",
                            success: function (data) {
                                //alert(data.info.id)
                                player.currentTime(data.info.playtime);
                                isFirst = false;
                                console.log(isFirst)
                            }
                        });
                }
            });


            player.on('pause', function () {
                console.log('暂停播放');
                var alltime=player.duration();
                var playtime=maxTime;
                var fileid=$("#videoid").val();
                var firatio=playtime/alltime;
                console.log(firatio);
                $.ajax({
                    type: "post",
                    url: "/159000701OSS/addFileinfo",
                    data: {"fileid": fileid,
                           "alltime":alltime,
                           "playtime":playtime,
                           "firatio":firatio},
                    dataType: "json",
                    success: function (data) {
                        //alert(data)
                    }
                });
            });


            player.on('ended', function () {
                console.log('结束播放');
            });
            // $(".vjs-progress-holder").mousedown(function () {
            //     var oldTime = player.currentTime();
            //     console.log("newTime:"+oldTime)
            //     console.log("maxTime:"+maxTime)
            //
            // });
            //
            // $(".vjs-progress-holder").mouseup(function () {
            //     newTime = player.currentTime();
            //     console.log("newTime:"+newTime)
            //     console.log("maxTime:"+maxTime)
            //
            //     if(newTime>oldTime){
            //         player.currentTime(oldTime);
            //         console.log("不能跳")
            //     }
            // });
            var hiddenProperty = 'hidden' in document ? 'hidden' :
                'webkitHidden' in document ? 'webkitHidden' :
                    'mozHidden' in document ? 'mozHidden' :
                        null;
            var visibilityChangeEvent = hiddenProperty.replace(/hidden/i, 'visibilitychange');
            var onVisibilityChange = function(){
                if (!document[hiddenProperty]) {
                    console.log('页面非激活');
                    player.pause();
                }else{
                    console.log('页面激活')

                }
            }
            document.addEventListener(visibilityChangeEvent, onVisibilityChange);




            player.on('timeupdate',function () {
                if (player.currentTime()>maxTime){
                    maxTime=player.currentTime();
                }
            })
        }

        layui.use(['element','layer','jquery','tree'], function() {
            var element = layui.element;
            var layer = layui.layer;
            var $ = layui.jquery;

            layui.tree({
                elem: '#sidemenubar' //传入元素选择器
                , nodes: <%=session.getAttribute("chaptermenuvideo")%>
                , autoRefresh: true
                , click: function (node) {
                    console.log(node.id);
                    $.ajax({
                        async:"false",
                        type: "post",
                        url: "/159000701OSS/findVideoBychpterid",
                        data: {"chapterid": node.id},
                        dataType: "json",
                        success: function (data) {

                            var file = data.data;
                            console.log(file.name);
                            $('#aaa').text(file.name);
                            $('#text').text(file.text);
                            $('#videoid').val(file.id);
                            $('#video_box video source').attr('src', file.url);
                            $('#video_box video').attr('src', file.url);
                            $("#video_box>video").load();
                            isFirst=true;
                        }



                    });
                }
            });
        });



    });
</script>
<script src="/159000701OSS/layui/layui.js"></script>
<script>
    // player=$("#example_video_1").get(0)
    // player.addEventListener('timeupdate', function () {
    //     var lastpos = localStorage.getItem("lastpos") || 0;
    //     if (player.currentTime - parseFloat(lastpos) > 1) {
    //         layer.msg('不能快进哦');
    //         player.currentTime=parseFloat(lastpos);
    //     } else{
    //         localStorage.setItem("lastpos", player.currentTime);
    //     }
    // });
</script>

</body>
</html>
