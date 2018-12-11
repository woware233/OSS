<%--
  Created by IntelliJ IDEA.
  User: 85019
  Date: 2018/11/8
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/159000701OSS/js/echarts.min.js"></script>
    <script src="/159000701OSS/js/jquery-1.9.1.min.js"></script>
</head>
<body style="background: white">
<div id="main_2" style="width: 900px;height:600px;float: left"></div>
<div id="main_3" style="width: 600px;height:600px;float: left"></div>
<script>
    var myArray=new Array();
    var myArray2=new Array();
    var str="";
        $.ajax({
        url:"/159000701OSS/TongJi1",
        type:"post",
        data:{},
        dataType:"json",
        success:function (data) {
            var tj=data.data;

            for(var i=0;i<tj.length;i++){
                //取json中的值
                console.log(tj[i].coursename);
                myArray[i]=tj[i].coursename;
            }
            for(var i=0;i<tj.length;i++){
                //取json中的值
                console.log(tj[i].score);
                myArray2[i]=tj[i].score;
            }
           ;
                //转换为json对象

            console.log("sz"+myArray)
            console.log("sz2"+myArray2)
            str=JSON.stringify(myArray2);
            alert(str)
            console.log("obj"+JSON.parse(str))
        }

    });

</script>
<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main_2'));
    var option = {
        title: {
            text: '各科目成绩统计图',
            x:'center'
        },
        tooltip: {},
        legend: {
            orient: 'vertical',
            left: 'right',
            data:['考试成绩']
        },

        xAxis: {
            data: ["学习课程1","学习课程2"]
        },
        yAxis: {},
        series: [{
            name: '考试成绩',
            type: 'bar',
            data: JSON.parse(JSON.stringify(myArray2))
        }]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
</script>
<script>
    var myChart = echarts.init(document.getElementById('main_3'));
    option = {
        title : {
            text: '分数段分布统计',
            subtext: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            left: 'right',
            data: ['60以下','60~80','80以上']
        },
        series : [
            {
                name: '访问来源',
                type: 'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[
                    {value:1, name:'60以下'},
                    {value:3, name:'60~80'}, ,
                    {value:2, name:'80以上'}
                ],
                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }
        ]
    };
    myChart.setOption(option);
</script>

</body>
</html>
