<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/10/29
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
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
        <button class="layui-btn layui-btn-sm" lay-event="addUser"><i class="layui-icon layui-icon-add-1" style="font-size: 30px; color: #ffffff;"></i>添加</button>
        <button class="layui-btn layui-btn-sm" lay-event="delUser"><i class="layui-icon layui-icon-delete" style="font-size: 30px; color: #ffffff;"></i>删除</button>
    </div>
</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="shenhe">详细</a>
    <a class="layui-btn layui-btn-xs" lay-event="shenhe2">审核</a>

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
            , url: '/159000701OSS/finduserlist' //数据接口

            , cols: [[ //表头
                  {type: 'checkbox', fixed: 'left'}
                ,  {field: 'userid', title: 'ID', width: 80, sort: true, fixed: 'left'}
                , {field: 'username', title: '用户名', width: 120}
                , {field: 'password', title: '密码', width: 80, sort: true}
                , {field: 'state', title: '状态', width: 80}
                ,{fixed: 'right',title:'操作', width:178, align:'center', toolbar: '#barDemo'}

            ]], done: function (res, curr, count) {    //res 接口返回的信息
                $("[data-field = 'state']").children().each(function () {

                    if ($(this).text() == 0) {
                        $(this).text("未通过");
                    }if ($(this).text() == 1) {
                        $(this).text("审核中");
                    }if ($(this).text()==2) {
                        $(this).text("已通过");
                    }

                });
            }


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
                case 'addUser':
                    layer.open({
                        type: 2,
                        title: '添加用户',
                        shadeClose: true,
                        shade: 0.8,
                        area: ['30%', '60%'],
                        content: ['/159000701OSS/moduls/user/add.jsp', 'no'] //iframe的url
                    });
                    break;
                case 'delUser':
                            var ids = ""
                            var data = checkStatus.data
                             console.log(data.length);
                        for(var i=0;i<data.length;i++){
                          if(i>0)
                          ids = ids + ",";
                          ids = ids + data[i].userid;
                            console.log(ids);
                                                       }

                    if(ids!='') {
                        {
                            layer.confirm('确定删除所选项吗？', function (index) {
                                $.ajax({
                                    url: '/159000701OSS/delUser',
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
            //console.log(obj)
            if (obj.event === 'shenhe') {
               var userid=data.userid;
                layer.open({
                    type: 2,
                    title: '查看用户',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['50%', '60%'],
                    content: ['/159000701OSS/moduls/user/userdetail.jsp?userid='+userid, 'no'] //iframe的url
                });
            } else if (obj.event === 'shenhe2') {
                console.log(data.userid)
                $.ajax({
                  url:"/159000701OSS/shenheUser",
                  type:"post",
                  data:{"userid":data.userid},
                  dataType:"json",
                  success:function (data) {
if (data==1){
    alert("通过")
} else{
    alert("失败")
}
                  }
              })
            }
        });
    });
</script>


</body>
</html>
