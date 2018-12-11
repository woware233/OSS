<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/12
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>学习进度</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css" media="all">
    <script type="text/javascript" src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
</head>
<body style="background: white">
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="delCourse">查询</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="Userauditing">审核</a>
    <a class="layui-btn layui-btn-xs" lay-event="auditingDetail">详细</a>

</script>

<table  id="test" lay-filter="test" ></table>

<script src="/159000701OSS/layui/layui.js"></script>
<script>
    layui.use('table', function() {
        var table = layui.table;
        //第一个实例
        table.render({
            elem: '#test'
            ,toolbar: '#toolbarDemo'
            , height: 'full-20'
            , url: '/159000701OSS/StdStyList' //数据接口

            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,  {field: 'username', title: '用户名', width: 120, sort: true, fixed: 'left'}
                , {field: 'chaptername', title: '章节名', width: 120}
                ,{field: 'stydratio',title:'进度(%)', width:178}

            ]]
        });
    });
</script>

<script>
    layui.use('table', function() {
        var table = layui.table;


        table.on('toolbar(test)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    layer.alert(JSON.stringify(data));
                    break;
                case 'getCheckLength':
                    var data = checkStatus.data;
                    layer.msg('选中了：' + data.length + ' 个');
                    break;
                case 'isAll':
                    layer.msg(checkStatus.isAll ? '全选' : '未全选');
                    break;
                case '':



                    break;
                case '':



                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            console.log(data.courseid)
            if (obj.event === 'Userauditing') {



            } else if (obj.event === 'auditingDetail') {




            }
        });
    });
</script>


</body>
</html>
