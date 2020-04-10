<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${basePath!}/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${basePath!}/css/index.css" media="all"/>
    <script src="${basePath!}/js/echarts.min.js" type="text/javascript"></script>
    <script src="${basePath!}/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${basePath!}/js/host.js" type="text/javascript"></script>
    <script src="${basePath!}/layui/layui.js" charset="utf-8"></script>
</head>
<body>


<div class="layui-fluid">
    <form class="layui-form" action="" lay-filter="example">
        <div class="layui-form">
            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">请选择门店</label>
                    <div class="layui-input-inline">
                        <select name="stores" id="stores" lay-filter="stores">
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>


<div class="layui-fluid">
    </form>
    <div class="layui-row layui-col-space15">
        <div class="layui-col-lg3">
            <div class="layui-card">
                <div class="layui-card-header">
                    下单量
                    <i class="layui-inline layui-icon layui-icon-flag"></i>
                    <span class="layui-badge layui-bg-blue layuiadmin-badge">天</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font">
                        <label style="font-size: 15px;"></label>
                        <a id="orderNumber" class="layuiadmin-big-font"></a>
                    </p>
                    <p>
                        单位：个
                        <span class="layuiadmin-span-color"><i
                                class="layui-inline layui-icon layui-icon-flag"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-lg3">
            <div class="layui-card">
                <div class="layui-card-header">
                    会员
                    <i class="layui-inline layui-icon layui-icon-user"></i>
                    <span class="layui-badge layui-bg-cyan layuiadmin-badge">天</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font">
                        <label style="font-size: 15px;">新会员：</label>
                        <a id="newVIP" class="layuiadmin-big-font"></a>&nbsp;&nbsp;&nbsp;
                        <label style="font-size: 15px;">散客：</label>
                        <a id="noVIP" class="layuiadmin-big-font"></a>
                    </p>
                    <p>
                        单位：个
                        <span class="layuiadmin-span-color"><i
                                class="layui-inline layui-icon layui-icon-user"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-lg3">
            <div class="layui-card">
                <div class="layui-card-header">
                    支付订单总收入
                    <i class="layui-inline layui-icon layui-icon-dollar"></i>
                    <span class="layui-badge layui-bg-green layuiadmin-badge">天</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">
                    <p class="layuiadmin-big-font">
                        <label style="font-size: 15px;">总收入：</label>
                        <a id="allPayPrice" class="layuiadmin-big-font"></a>&nbsp;
                        <label style="font-size: 15px;">现金收入：</label>
                        <a id="checkCashIncome" class="layuiadmin-big-font"></a>&nbsp;
                    <p>
                        <button type="button" class="layui-btn layui-btn-xs" id="cashDetail_rmb">
                            现金明细-纸币
                        </button>
                        <button type="button" class="layui-btn layui-btn-xs" id="cashDetail_pos">
                            现金明细-pos刷卡
                        </button>
                    </p>
                    </p>
                    <p>
                        单位：元
                        <span class="layuiadmin-span-color"><i
                                class="layui-inline layui-icon layui-icon-dollar"></i></span>
                    </p>
                </div>
            </div>
        </div>
        <div class="layui-col-lg3">
            <div class="layui-card">
                <div class="layui-card-header">
                    储值订单总收入
                    <i class="layui-inline layui-icon layui-icon-dollar"></i>
                    <span class="layui-badge layui-bg-orange layuiadmin-badge">天</span>
                </div>
                <div class="layui-card-body layuiadmin-card-list">

                    <p class="layuiadmin-big-font">
                        <label style="font-size: 15px;"></label>
                        <a id="recharge" class="layuiadmin-big-font"></a>
                    </p>
                    <p>
                        单位：元
                        <span class="layuiadmin-span-color"><i
                                class="layui-inline layui-icon layui-icon-dollar"></i></span>
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="weadmin-body">
        <div class="layui-card-body">
            <div class="layui-row">
                <div class="layui-col-lg8">
                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                    <div id="bar" style="width: 100%;height:400px;"></div>
                </div>
                <div class="layui-col-lg4">
                    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                    <div id="pie" style="width: 100%;height:400px;"></div>
                </div>
            </div>
         <div class="layui-row">
             <div class="layui-col-lg12">
                 <div class="layui-btn-group">
                     <button type="button" class="layui-btn" id="changeLadderAmount">切换为金额业绩统计方式</button>
                     <button type="button" class="layui-btn" id="changeLadderNumber">切换为个数业绩统计方式</button>
                 </div>
                 <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                 <div id="yeji" style="width: 100%;height:400px;"></div>
             </div>
         </div>
         <div class="layui-row">
             <div class="layui-col-lg12">
                 <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
                 <div id="gongzi" style="width: 100%;height:400px;"></div>
             </div>
         </div>
        </div>
    </div>

<#--查看业绩详情-->
    <form class="layui-form" id="showYejiDetail1" action="" lay-filter="example" method="post" hidden="true">
        <div id="yejiDetail1" style="width: 866px;height:400px;"></div>
    </form>

<#--查看业绩详情-->
    <form class="layui-form" id="showYejiDetail2" action="" lay-filter="example" method="post" hidden="true">
        <div id="yejiDetail2" style="width: 866px;height:400px;"></div>
    </form>

<#--现金明细-->
    <form class="layui-form" id="cashForm" action="" lay-filter="example" method="post" hidden="true">
        <table id="cashTable" lay-filter="cashTable"></table>
    </form>
</div>
<script type="text/javascript">
    layui.use('form', function () {
        var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功
        //加载所有门店
        /* loadStore();*/
        loadSubCompanyStore(form)
        showPage("${currentUser.storeId!}");
        form.on('select(stores)', function (data) {
            var storeId = data.value;
            if (storeId != 0) {
                showPage(storeId);
            } else {
                showPage("${currentUser.storeId!}");
            }
        })
    });

    // 基于准备好的dom，初始化echarts实例
    function showPage(storeId) {
        var data = {}, orderPrice = [], allPayPrice = 0, cashPayPrice = 0, orderNumber, newVIP, noVIP, recharge = 0,
                yejiData = {},
                gongzi = {};
        //获取柱形图数据-订单
        $.ajax({
            url: dataHost + "/manage/order/selectTodayOrderList",
            method: "POST",
            data: {"storeId": storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    data = res.result;
                }
            }
        });
        //获取饼图数据-订单收入
        $.ajax({
            url: orderHost + "/order/selectTodayReceipt",
            method: "POST",
            data: {"storeId": storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    orderPrice = res.result;
                }
            }
        });

        //获取饼图数据-订单收入-现金收入
        $.ajax({
            url: orderHost + "/order/selectTodayCashReceipt",
            method: "POST",
            data: {"storeId": storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    cashPayPrice = res.result.allCashPayPrice;
                }
            }
        });

        //获取总储值金额
        $.ajax({
            url: walletHost + "/manage/wallet/selectSumAmount",
            method: "POST",
            data: {"storeId": storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    recharge = res.result;
                }
            }
        });
        //获取显示的统计数据
        orderNumber = data.serviceOrder + data.productOrder + data.rechargeOrder+ data.customOrder+ data.appointmentOrder;
        newVIP = data.newVIP;
        noVIP = data.isNotVIP;
        // recharge = data.recharge;
        $("#allPayPrice").text(orderPrice.total);
        $("#checkCashIncome").text(cashPayPrice);
        $("#orderNumber").text(orderNumber);
        $("#newVIP").text(newVIP);
        $("#noVIP").text(noVIP);
        $("#recharge").text(recharge);

        //获取业绩柱状图数据
        $.ajax({
            url: dataHost + "/performance/selectLadderDetailedListColumnar",
            method: "POST",
            data: {storeId: storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    yejiData = res.result;
                }
            }
        });
        //获取工资柱状图数据
        $.ajax({
            url: dataHost + "/statistic/selectSalaryList",
            method: "POST",
            data: {storeId: storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    gongzi = res.result;
                }
            }
        });
        //订单柱形图
        getBar(data);

        //收入圆-收入
        getPie(orderPrice);

        //业绩柱状图-业绩
        getYeji(yejiData, 1);

        //获取工资的柱状图-工资
        getGongzi(gongzi)

    }

    function getBar(data) {
        var colorList = ['#C33531', '#EFE42A', '#64BD3D'];
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('bar'));

        // 指定图表的配置项和数据
        var option = {
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    selfButtons: {//自定义按钮 danielinbiti,这里增加，selfbuttons可以随便取名字
                        show: true,//是否显示
                        title: '自定义', //鼠标移动上去显示的文字
                        icon: 'test.png', //图标
                        option: {},
                        onclick: function (option1) {//点击事件,这里的option1是chart的option信息
                            alert('1');//这里可以加入自己的处理代码，切换不同的图形
                        }
                    },
                    saveAsImage: {show: true}
                }
            },
            title: {
                text: '当日订单统计',
                // x: 'center'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
            },
            legend: {
                data: ['数量']
            },
            xAxis: {
                type: 'category',
                boundaryGap: true,
                // data: ["服务订单","产品订单","充值订单","新会员","散客"]
                data: ["服务订单", "产品订单", "充值订单","定制订单","预约订单"]
            },
            yAxis: {
                type: 'value',
                scale: true,
                name: '数量',
                max: 20,
                min: 0,
                /* splitNumber:20,*/
                /* boundaryGap: [0, 1],*/
                minInterval: 1,
            },
            series: [{
                name: '数量',
                type: 'bar',
                color: function (params) {
                    var colorList = ['#C33531', '#4963ff', '#64BD3D'];
                    return colorList[params.dataIndex]
                },
                // data: [data.serviceOrder, data.productOrder, data.rechargeOrder, data.newVIP, data.isNotVIP]
                data: [data.serviceOrder, data.productOrder, data.rechargeOrder,data.customOrder,data.appointmentOrder]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }



    function getPie(orderPrice) {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('pie'));
        var optionCircle = {
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b}: {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                x: 'left',
                data:orderPrice.orderTypeNameList
            },
            series: [
                {
                    name:'访问来源',
                    type:'pie',
                    radius: ['50%', '70%'],
                    avoidLabelOverlap: false,
                    label: {
                        normal: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            show: true,
                            textStyle: {
                                fontSize: '30',
                                fontWeight: 'bold'
                            }
                        }
                    },
                    labelLine: {
                        normal: {
                            show: false
                        }
                    },
                    data:orderPrice.detailList
                }
            ]
        };


        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(optionCircle);


    }


    function getYejiDetail(beauticianName, data, str) {
        var colorList = ['#C33531', '#EFE42A', '#64BD3D'];
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById(str));

        // 指定图表的配置项和数据
        var option = {
            toolbox: {
                show: true,
                feature: {
                    mark: {show: true},
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['line', 'bar']},
                    restore: {show: true},
                    selfButtons: {//自定义按钮 danielinbiti,这里增加，selfbuttons可以随便取名字
                        show: true,//是否显示
                        title: '自定义', //鼠标移动上去显示的文字
                        icon: 'test.png', //图标
                        option: {},
                        onclick: function (option1) {//点击事件,这里的option1是chart的option信息
                            alert('1');//这里可以加入自己的处理代码，切换不同的图形
                        }
                    },
                    saveAsImage: {show: true}
                }
            },
            title: {
                text: beauticianName + '的业绩详情',
                // x: 'center'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
            },

            xAxis: {
                type: 'category',
                boundaryGap: true,
                // data: ["服务订单","产品订单","充值订单","新会员","散客"]
                data: ["商品业绩", "护理业绩", "充值业绩", "医美业绩"]
            },
            yAxis: {
                type: 'value',
                scale: true,
                name: '金额',
                max: 200,
                min: 0,
                /* splitNumber:20,*/
                /* boundaryGap: [0, 1],*/
                minInterval: 1,
            },
            series: [{
                name: '金额',
                type: 'bar',
                color: function (params) {
                    var colorList = ['#C33531', '#4963ff', '#64BD3D'];
                    return colorList[params.dataIndex]
                },
                data: [data.productLadderDetai, data.serviceLadderDetai, data.rechargeLadderDetai, data.cosmeticLadderDetai]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
     function getYeji(yejiData, type) {

         //请求员工数据
         // 基于准备好的dom，初始化echarts实例
         var myChart = echarts.init(document.getElementById('yeji'));
         console.log(type)
         if (type === 1) {
             myChart.off('click');
             var optionColumnar1 = {
                 toolbox: {
                     show: true,
                     feature: {
                         mark: {show: true},
                         dataView: {show: true, readOnly: false},
                         magicType: {show: true, type: ['line', 'bar']},
                         restore: {show: true},
                         saveAsImage: {show: true}
                     }
                 },
                 title: {
                     text: '当日员工业绩统计(点击查看业绩详情)'
                 },
                 tooltip: {
                     trigger: 'axis',
                     axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                         type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                     }
                 },
                 legend: {
                     data: ['支付业绩', '储值业绩']
                 },
                 grid: {
                     left: '3%',
                     right: '4%',
                     bottom: '3%',
                     containLabel: true
                 },
                 xAxis: {
                     type: 'value'
                 },
                 yAxis: {
                     type: 'category',
                     data: yejiData.allStorebeauticianList,
                     rawdate: yejiData.allStorebeauticianIdList
                 },
                 series: [
                     {
                         name: '支付业绩',
                         type: 'bar',
                         stack: '总量',
                         label: {
                             normal: {
                                 show: true,
                                 position: 'insideRight'
                             }
                         },
                         data: yejiData.amountListTodayPay
                     },
                     {
                         name: '储值业绩',
                         type: 'bar',
                         stack: '总量',
                         label: {
                             normal: {
                                 show: true,
                                 position: 'insideRight'
                             }
                         },
                         data: yejiData.amountListTodayRecharge
                     }
                 ]
             };
             myChart.setOption(optionColumnar1, true);
             myChart.on('click', function (params) {
                 var index = params.dataIndex;
                 var currentBeauticianId = optionColumnar1.yAxis.rawdate[index];
                 var beauticianName = params.name;
                 var a1 = layer.open({
                     type: 1,
                     title: '业绩详情',
                     content: $('#showYejiDetail1'),
                     area: ['866px', '539px'],
                     closeBtn: 1,
                     btn: ['关闭'],
                     btn2: function () {
                         layer.close(a1);
                     },
                     success: function (layero) {
                         //获取柱形图数据-订单
                         var data = null
                         $.ajax({
                             url: dataHost + "/performance/selectLadderDetaiColumnarByBeauId",
                             method: "POST",
                             data: {"beauticianId": currentBeauticianId, "isNumber": 0},
                             async: false,
                             success: function (res) {
                                 if (res.responseStatusType.message == "Success") {
                                     data = res.result;
                                 }
                             }
                         });
                         //订单柱形图-业绩详情
                         getYejiDetail(beauticianName, data, "yejiDetail1");
                     }
                 });
             });
         } else if (type === 2) {
             myChart.off('click');
             var optionColumnar2 = {
                 toolbox: {
                     show: true,
                     feature: {
                         mark: {show: true},
                         dataView: {show: true, readOnly: false},
                         magicType: {show: true, type: ['line', 'bar']},
                         restore: {show: true},
                         saveAsImage: {show: true}
                     }
                 },
                 title: {
                     text: '当日员工业绩统计(点击查看业绩详情)'
                 },
                 tooltip: {
                     trigger: 'axis',
                     axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                         type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                     }
                 },
                 legend: {
                     data: ['支付业绩-个数']
                 },
                 grid: {
                     left: '3%',
                     right: '4%',
                     bottom: '3%',
                     containLabel: true
                 },
                 xAxis: {
                     type: 'value'
                 },
                 yAxis: {
                     type: 'category',
                     data: yejiData.allStorebeauticianList,
                     rawdate: yejiData.allStorebeauticianIdList
                 },
                 series: [
                     {
                         name: '支付业绩-个数',
                         type: 'bar',
                         stack: '总量',
                         label: {
                             normal: {
                                 show: true,
                                 position: 'insideRight'
                             }
                         },
                         data: yejiData.allNumberList
                     },
                     {
                         name: '储值业绩',
                         type: 'bar',
                         stack: '总量',
                         label: {
                             normal: {
                                 show: true,
                                 position: 'insideRight'
                             }
                         },
                         data: yejiData.amountListTodayRecharge
                     }
                 ]
             };
             myChart.setOption(optionColumnar2, true);
             myChart.on('click', function (params) {
                 var index = params.dataIndex;
                 var currentBeauticianId = optionColumnar2.yAxis.rawdate[index];
                 var beauticianName = params.name;
                 var a2 = layer.open({
                     type: 1,
                     title: '业绩详情',
                     content: $('#showYejiDetail2'),
                     area: ['866px', '539px'],
                     closeBtn: 1,
                     btn: ['关闭'],
                     btn2: function () {
                         layer.close(a2);
                     },
                     success: function (layero) {
                         //获取柱形图数据-订单
                         var data = null
                         $.ajax({
                             url: dataHost + "/performance/selectLadderDetaiColumnarByBeauId",
                             method: "POST",
                             data: {"beauticianId": currentBeauticianId, "isNumber": 1},
                             async: false,
                             success: function (res) {
                                 if (res.responseStatusType.message == "Success") {
                                     data = res.result;
                                 }
                             }
                         });
                         //订单柱形图-业绩详情
                         getYejiDetail(beauticianName, data, "yejiDetail2");
                     }
                 });
             });
         }
     }

     function getGongzi(gongzi) {
         //请求员工数据
         // 基于准备好的dom，初始化echarts实例
         var myChart = echarts.init(document.getElementById('gongzi'));
         var option = {
             title: {
                 text: '员工工资表',
                 subtext: '数据为上月工资统计'
             },
             tooltip: {
                 trigger: 'axis',
                 axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                     type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                 }
             },
             legend: {
                 data: ['底薪', '提成', '总工资']
             },
             grid: {
                 left: '3%',
                 right: '4%',
                 bottom: '3%',
                 containLabel: true
             },
             xAxis: {
                 type: 'value'
             },
             yAxis: {
                 type: 'category',
                 data: gongzi.nameList
             },
             series: [
                 {
                     name: '底薪',
                     type: 'bar',
                     stack: '元',
                     label: {
                         normal: {
                             show: true,
                             position: 'insideRight'
                         }
                     },
                     data: gongzi.dixinList
                 },
                 {
                     name: '提成',
                     type: 'bar',
                     stack: '元',
                     label: {
                         normal: {
                             show: true,
                             position: 'insideRight'
                         }
                     },
                     data: gongzi.tichengList
                 },
                 {
                     name: '总工资',
                     type: 'bar',
                     stack: '总量',
                     label: {
                         normal: {
                             show: true,
                             position: 'insideRight'
                         }
                     },
                     data: gongzi.totalList
                 }
             ]
         };

         // 使用刚指定的配置项和数据显示图表。
         myChart.setOption(option);

     }


    //初始化子公司分组列表
    function loadSubCompanyStore(form) {
        var url = storeHost + "/manage/store/selectSubCompanyAndStoreNoPage";
        var data = {companyId: "${currentUser.companyId!}", companyType: "${currentUser.companyType!}"};
        $.post(url, data, function (result) {
            if (result.responseStatusType.message == "Success") {
                var list = result.result;    //返回的数据
                var server = document.getElementById("stores"); //server为select定义的id
                server.innerHTML = "<option value='0' selected='selected'>直接选择或搜索选择</option>";
                for (var p in list) {
                    var optgroup = document.createElement("optgroup");  // 创建添加optgroup属性
                    optgroup.setAttribute("label", list[p].subsidiaryName); // 给optgroup的label添加值
                    var storeVOList = list[p].storeVOList;
                    for (var n in storeVOList) {
                        var option = document.createElement("option");  // 创建添加option属性
                        option.setAttribute("value", storeVOList[n].storeId); // 给option的value添加值
                        option.innerText = storeVOList[n].name;     // 打印option对应的纯文本
                        optgroup.appendChild(option)
                    }
                    server.appendChild(optgroup);           //给select添加option子标签
                }
                form.render();
            } else {

            }
        })
    }

    //切换业绩统计方式单击事件-金额
    $("#changeLadderAmount").click(function () {
        var storeId = $("select[name='stores'] option:selected").val() == 0 ? "${currentUser.storeId!}" : $("select[name='stores'] option:selected").val();
        $.ajax({
            url: dataHost + "/performance/selectLadderDetailedListColumnar",
            method: "POST",
            data: {storeId: storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    getYeji(res.result, 1);
                    console.log(res.result)
                }
            }
        });


    });

    //切换业绩统计方式单击事件-个数
    $("#changeLadderNumber").click(function () {
        var storeId = $("select[name='stores'] option:selected").val() == 0 ? "${currentUser.storeId!}" : $("select[name='stores'] option:selected").val();
        $.ajax({
            url: dataHost + "/performance/selectLadderDetailedListColumnarForNumber",
            method: "POST",
            data: {storeId: storeId},
            async: false,
            success: function (res) {
                if (res.responseStatusType.message == "Success") {
                    getYeji(res.result, 2);
                    console.log(res.result)
                }
            }
        });
    });

    //现金明细-人民币
    $("#cashDetail_rmb").click(function () {
        var storeId = $("select[name='stores'] option:selected").val() == 0 ? "${currentUser.storeId!}" : $("select[name='stores'] option:selected").val();
        //页面弹框
        var a = layer.open({
            type: 1,
            title: '现金明细',
            content: $('#cashForm'),
            area: ['585px', '228px'],
            scrollbar: true,
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a);
            },
            success: function (layero) {
                layui.use('table', function () {
                    var table = layui.table;
                    table.render({
                        elem: '#cashTable'
                        , url: orderHost + "/order/selectOrderByCash"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "cashTableReload"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , where: {
                            storeId: storeId,
                            cash: 3
                        }
                        , cols: [[
                            {field: 'orderNum', title: '订单号'}
                            , {field: 'orderTypeName', title: '订单类型'}
                            , {field: 'amount', title: '现金金额'}
                            , {field: 'createTime', title: '创建时间'}
                        ]]
                    });
                });
            }

        });
    });

    //现金明细-pos刷卡
    $("#cashDetail_pos").click(function () {
        var storeId = $("select[name='stores'] option:selected").val() == 0 ? "${currentUser.storeId!}" : $("select[name='stores'] option:selected").val();
        //页面弹框
        var a = layer.open({
            type: 1,
            title: '现金明细',
            content: $('#cashForm'),
            area: ['585px', '228px'],
            scrollbar: true,
            closeBtn: 1,
            btn: ['关闭'],
            btn2: function () {
                layer.close(a);
            },
            success: function (layero) {
                layui.use('table', function () {
                    var table = layui.table;
                    table.render({
                        elem: '#cashTable'
                        , url: orderHost + "/order/selectOrderByCash"
                        , cellMinWidth: 60 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                        , page: true          //显示分页默认不显示
                        , method: 'post'
                        , id: "cashTableReload"
                        , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                            return {
                                "code": 0, //解析接口状态
                                "msg": "", //解析提示文本
                                "count": res.result == null ? 0 : res.result.total, //解析数据长度
                                "data": res.result == null ? 0 : res.result.list //解析数据列表
                            };
                        }
                        , where: {
                            storeId: storeId,
                            cash: 4
                        }
                        , cols: [[
                            {field: 'orderNum', title: '订单号'}
                            , {field: 'orderTypeName', title: '订单类型'}
                            , {field: 'amount', title: '现金金额'}
                            , {field: 'createTime', title: '创建时间'}
                        ]]
                    });
                });
            }

        });
    });
</script>
</body>
</html>