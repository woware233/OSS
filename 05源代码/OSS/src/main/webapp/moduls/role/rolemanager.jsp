<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/31
  Time: 18:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>角色管理</title>
    <link rel="stylesheet" href="/159000701OSS/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="/159000701OSS/layui/css/checkbox.css" media="all">
    <script src="/159000701OSS/layui/layui.js"></script>
    <script type="text/javascript" src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
    <script src="/159000701OSS/layui/checkbox.js"></script>
</head>
<body style="background: white">
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
        <button class="layui-btn layui-btn-sm" lay-event="addAction">添加</button>
        <button class="layui-btn layui-btn-sm" lay-event="delUser">删除</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">详细</a>

</script>

<table  id="test" lay-filter="test" ></table>

<script>
    layui.use('table', function() {
        var table = layui.table;

        //第一个实例
        table.render({
            elem: '#test'
            ,toolbar: '#toolbarDemo'
            , height: 740
            , url: '/159000701OSS/roleList' //数据接口
            ,page: true
            ,limit: 10
            , cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,  {field: 'roleid', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'rolename', title: '角色名', width: 120}
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
                case 'addRole':

                    layer.open({
                        type: 2,
                        title: '添加角色',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['30%', '60%'],
                        content: ['/159000701OSS/addrole.do', 'no'] //iframe的url
                    });

                    break;
                case 'delAction':

                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(test)', function (obj) {
            var data = obj.data;
            console.log(obj.data.roleid)
            //console.log(obj)
            if (obj.event === 'shenhe') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del();
                    layer.close(index);
                    console.log(index);
                });
            } else if (obj.event === 'edit') {
                $.ajax({
                    url: "/159000701OSS/checkAction",
                    data: {roleid: obj.data.roleid},
                    dataType: 'json',
                    success: function (result) {
                        console.log(typeof result.data)

                        layui.use(['checkbox', 'layer','jquery'], function () {
                            var $ = layui.$
                                , layer = layui.layer
                                , checkbox = layui.checkbox
                                , content=JSON.parse(result.data);
                            layer.open({
                                type: 1,
                                title: '权限选择',
                                area: ['550px', '350px'],
                                content: '<div id="testbox"></div>',
                                success: function (layero, index) {
                                    $("#testbox").children("li").remove();
                                    checkbox({
                                        elem: "#testbox"
                                        , nodes:content
                                        , click: function (node) {
                                           if(node.on==true){
                                               console.log(data.roleid,node.id)
                                               $.ajax({
                                                   url:"/159000701OSS/addroleaction",
                                                   data:{roleid:data.roleid,actionid:node.id},
                                                   datatype:'json',
                                                   success: function (data) {
                                                       console.log(data);
                                                         if (data=="1"){
                                                             console.log("添加成功")
                                                         } else { console.log("添加失败")}
                                                   }
                                               })
                                           }else{
                                               console.log(data.roleid,node.id)
                                               $.ajax({
                                                   url:"/159000701OSS/delroleaction",
                                                   data:{roleid:data.roleid,actionid:node.id},
                                                   datatype:'json',
                                                   success: function (data) {
                                                       console.log(data);
                                                       if (data=="1"){
                                                           console.log("删除成功")
                                                       } else { console.log("删除失败")}
                                                   }
                                               })
                                           }
                                        }
                                        , del: function (node) {
                                            console.log("删除", node);
                                            return true;
                                        }
                                    });
                                }
                            });

                        });

                    }
                });


            }
        });
    });
</script>


</body>

</html>
