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
        <a href="#title-link">个人中心</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->


<!--content start-->
<ul class="am-avg-sm-1 am-margin-sm am-padding-sm am-text-center admin-content-list">
    <li><a href="<%=request.getContextPath()%>/service/getQd2.do" class="am-text-success"><span class="am-icon-btn am-icon-trophy"></span><br/>我的积分(<span id="jf">2300</span>)</a></li>
    <li><a href="<%=request.getContextPath()%>/service/getPorderView.do" class="am-text-warning"><span class="am-icon-btn am-icon-cart-plus"></span><br/>已兑礼品(<span id="lp">308</span>)</a></li>
    <li><a href="<%=request.getContextPath()%>/service/getCkcontact2.do" class="am-text-danger"><span class="am-icon-btn am-icon-comments"></span><br/>我的反馈(<span id="fk">80082</span>)</a></li>
</ul>


<!--content end-->

<!-- Navbar start-->
<%@include file="common/navbar.jsp" %>
<!-- Navbar end-->

<script>
    $(function () {
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/initUserView.do',
            cache: false,
            success: function (info) {
                $('#jf').text(info.jf);
                $('#lp').text(info.lp);
                $('#fk').text(info.fk);

            },
            error: function () {
                return;
            }
        });
    });
</script>
<style>
    .admin-content-list {
        border: 1px solid #e9ecf1;
        margin-top: 20px;
    }

    .admin-content-list li {
        border: 1px solid #e9ecf1;
        border-width: 1px 0px;
        padding: 20px;
    }
    .admin-content-list li:first-child {
        border-top: none;
    }

    .admin-content-list li:last-child {
        border-bottom: none;
    }
</style>
</body>
</html>
