<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8" %>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>叮咚微社区</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <%@include file="common/css.jsp" %>
    <%@include file="common/js.jsp" %>
</head>
<body>

<!-- Header start-->
<header data-am-widget="header" class="am-header am-header-default">
    <h1 class="am-header-title">
        <a href="#title-link">管理员</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<!--menu end-->


<!--content start-->
<div class="am-panel-hd am-cf" data-am-collapse="{target: '#hdPanel'}">活动情况<span class="am-icon-chevron-down am-fr" ></span></div>
<div class="am-panel am-panel-primary am-padding-xs" id="hdPanel">
    <div class="am-panel-bd">
        <div class="am-scrollable-horizontal">
            <table class="am-table am-table-striped am-table-hover am-table-compact am-text-nowrap">
                <thead>
                <tr>
                    <th>小区</th>
                    <th>用户</th>
                    <th>状态</th>
                    <th>时间</th>
                </tr>
                </thead>
                <tbody id="hdInfo">
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="am-panel-hd am-cf" data-am-collapse="{target: '#contactPanel'}">反馈情况<span class="am-icon-chevron-down am-fr" ></span></div>
<div class="am-panel am-panel-primary am-padding-xs" id="contactPanel">
    <div class="am-panel-bd">
        <div class="am-scrollable-horizontal">
            <table class="am-table am-table-striped am-table-hover am-table-compact am-text-nowrap">
                <thead>
                <tr>
                    <th>小区</th>
                    <th>合计</th>
                    <th>未处理</th>
                    <th>处理中</th>
                    <th>不太满意</th>
                </tr>
                </thead>
                <tbody id="contactsInfo">
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="am-panel-hd am-cf" data-am-collapse="{target: '#userPanel'}">关注用户(<span id="totalNum"></span>)<span class="am-icon-chevron-down am-fr" ></span></div>
<div class="am-panel am-panel-primary am-padding-xs" id="userPanel">
    <div class="am-panel-bd">
        <div class="am-scrollable-horizontal">
            <table class="am-table am-table-striped am-table-hover am-table-compact am-text-nowrap">
                <thead>
                <tr>
                    <th>小区</th>
                    <th>总数</th>
                    <th>实名用户</th>
                    <th>管理员</th>
                </tr>
                </thead>
                <tbody id="xiaoquUsers">
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="am-panel-hd am-cf" data-am-collapse="{target: '#productPanel'}">礼品登记<span class="am-icon-chevron-down am-fr" ></span></div>
<div class="am-panel am-panel-primary am-padding-xs" id="productPanel">
    <div class="am-panel-bd">
        <div class="am-scrollable-horizontal">
            <table class="am-table am-table-striped am-table-hover am-table-compact am-text-nowrap">
                <thead>
                <tr>
                    <th>小区</th>
                    <th>用户名</th>
                    <th>已兑礼品</th>
                    <th>兑换时间</th>
                </tr>
                </thead>
                <tbody id="proders">
                </tbody>
            </table>
        </div>
    </div>
</div>
<!--content end-->

<!-- Navbar start-->
<!-- Navbar end-->

<script>
    $(function () {
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/getPorderDetails.do',
            cache: false,
            success: function (data) {
                var proders='';
                jQuery.each(data, function(i,item){
                    proders+='<tr>';
                    proders+='<td>'+item.xiaoqu+'</td>';
                    proders+='<td class="am-text-center">'+item.name+'</td>';
                    proders+='<td class="am-text-center">'+item.productName+'</td>';
                    proders+='<td class="am-text-center">'+item.createTime+'</td>';
                    proders+='</tr>';

                });

                $('#proders').html(proders);
            },
            error: function () {
                return;
            }
        });

        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/getXiaoquUsers.do',
            cache: false,
            success: function (data) {
                var xiaoquUsers='';
                jQuery.each(data, function(i,item){
                    xiaoquUsers+='<tr>';
                    xiaoquUsers+='<td>'+item.xiaoqu+'</td>';
                    xiaoquUsers+='<td class="am-text-center">'+item.allUserNum+'</td>';
                    xiaoquUsers+='<td class="am-text-center">'+item.namedUserNum+'</td>';
                    xiaoquUsers+='<td class="am-text-center">'+item.adminNum+'</td>';
                    xiaoquUsers+='</tr>';

                });

                $('#xiaoquUsers').html(xiaoquUsers);
            },
            error: function () {
                return;
            }
        });

        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/getContactsInfo.do',
            cache: false,
            success: function (data) {
                var contactsInfo='';
                jQuery.each(data, function(i,item){
                    contactsInfo+='<tr>';
                    contactsInfo+='<td>'+item.xiaoqu+'</td>';
                    contactsInfo+='<td class="am-text-center">'+item.allContactsNum+'</td>';
                    contactsInfo+='<td class="am-text-center">'+item.undoNum+'</td>';
                    contactsInfo+='<td class="am-text-center">'+item.doingNum+'</td>';
                    contactsInfo+='<td class="am-text-center">'+item.rep4+'</td>';
                    contactsInfo+='</tr>';
                });

                $('#contactsInfo').html(contactsInfo);
            },
            error: function () {
                return;
            }
        });

        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/findHdInfo.do',
            cache: false,
            success: function (data) {
                var hdInfo='';
                jQuery.each(data, function(i,item){
                    hdInfo+='<tr>';
                    hdInfo+='<td>'+item.xiaoqu+'</td>';
                    hdInfo+='<td class="am-text-center">'+item.name+'</td>';
                    if(item.state =="hdUpdate"){
                        hdInfo+='<td class="am-text-center">照片已经提交</td>';
                    }else if(item.state =="hdPrinting"){
                        hdInfo+='<td class="am-text-center">正在排队打印</td>';
                    }else if(item.state =="hdSuccess"){
                        hdInfo+='<td class="am-text-center">请至物业领取</td>';
                    }
                    hdInfo+='<td class="am-text-center">'+item.createTime+'</td>';
                    hdInfo+='</tr>';

                });

                $('#hdInfo').html(hdInfo);
            },
            error: function () {
                return;
            }
        });

        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/service/getUserTotal.do',
            cache: false,
            success: function (data) {
                $('#totalNum').html(data);
            },
            error: function () {
                return;
            }
        });

    });
</script>

</body>
</html>
