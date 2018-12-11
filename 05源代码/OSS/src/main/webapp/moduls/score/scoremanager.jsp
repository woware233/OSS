<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/13
  Time: 8:21
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/1
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>成绩管理</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css" media="all">
    <script type="text/javascript" src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
</head>
<body style="background: white">
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="addScore">添加</button>
        <button class="layui-btn layui-btn-sm" lay-event="delScore">删除</button>
        <button class="layui-btn layui-btn-sm" lay-event="upload">导入</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="shenhe">详细</a>

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
            , height: 740
            ,page: true
            ,limit: 10
            , url: '/159000701OSS/findScorelist' //数据接口

            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,  {field: 'scoreid', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'studentcode', title: '学生用户名', width: 120}
                , {field: 'studentname', title: '学生名', width: 120}
                , {field: 'batchname', title: '批次名', width: 120}
                , {field: 'coursename', title: '课程名', width: 120}
                , {field: 'score', title: '分数', width: 120}
                ,{fixed: 'right',title:'操作', width:178, align:'center', toolbar: '#barDemo'}

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
                case 'addScore':

                    layer.open({
                        type: 2,
                        title: '添加成绩',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['30%', '60%'],
                        content: ['/159000701OSS/moduls/score/add.jsp', 'no']
                    });
                    break;
                case 'delScore':
                    var ids = ""
                    var data = checkStatus.data
                    console.log(data.length);
                    for(var i=0;i<data.length;i++){
                        if(i>0)
                            ids = ids + ",";
                        ids = ids + data[i].scoreid;
                        console.log(ids);
                    }

                    if(ids!='') {
                        {
                            layer.confirm('确定删除所选项吗？', function (index) {
                                $.ajax({
                                    url: '/159000701OSS/delScore',
                                    type: 'post',
                                    dataType: 'json',
                                    data: {'ids': ids},
                                    success: function (r) {
                                        if (r.success && r.success>0) {
                                            layer.msg('删除成功');

                                        } else {
                                            layer.msg('删除失败');
                                        }
                                    },
                                    'error': function () {
                                        layer.msg('系统错误');
                                    }
                                })
                            })
                        }

                    }
                    break;

                case 'upload':
                    layer.open({
                        type: 2,
                        title: '导入',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['30%', '60%'],
                        content: ['/159000701OSS/moduls/score/upload.jsp', 'no']
                    });

                break;
            };

        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            //console.log(obj)
            if (obj.event === 'shenhe') {
               layer.msg("loading...")
            } else if (obj.event === 'edit') {
                layer.prompt({
                    formType: 2
                    , value: data.email
                }, function (value, index) {
                    obj.update({
                        email: value
                    });
                    layer.close(index);
                });
            }
        });
    });
</script>


</body>
</html>
