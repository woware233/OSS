<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/11/1
  Time: 8:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css" media="all">
    <script type="text/javascript" src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
</head>
<body style="background: white">
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="addCourse">添加</button>
        <button class="layui-btn layui-btn-sm" lay-event="delCourse">删除</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="ChapterDetail">章节详细</a>

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
            , url: '/159000701OSS/CourseList' //数据接口

            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,  {field: 'courseid', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'coursename', title: '课程名', width: 120}
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
                case 'addCourse':

                    layer.open({
                        type: 2,
                        title: '添加课程',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['30%', '60%'],
                        content: ['/159000701OSS/moduls/course/add.jsp', 'no'] //iframe的url
                    });
                    break;
                case 'delCourse':
                    var ids = ""
                    var data = checkStatus.data
                    console.log(data.length);
                    for(var i=0;i<data.length;i++){
                        if(i>0)
                            ids = ids + ",";
                        ids = ids + data[i].courseid;
                        console.log(ids);
                    }

                    if(ids!='') {
                        {
                            layer.confirm('确定删除所选项吗？', function (index) {
                                $.ajax({
                                    url: '/159000701OSS/delCourse',
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
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            console.log(data.courseid)
            if (obj.event === 'ChapterDetail') {

                layer.open({
                    type: 2,
                    title: '章节详细',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '90%'],
                    content: ["/159000701OSS/findChapterListByCourseId?courseid="+data.courseid, 'no'] //iframe的url
                });

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
