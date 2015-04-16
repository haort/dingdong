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
        <a href="#title-link">最新公告</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->

<!--content start-->
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
    <h2 class="am-titlebar-title ">最新公告</h2>
    <nav class="am-titlebar-nav">
        <a href="<%=request.getContextPath()%>/service/getMoreNotices2.do" class="">历史公告 &raquo;</a>
    </nav>
</div>

<section class="am-panel am-panel-default" id="notice">
</section>
<!--content end-->


<!-- Navbar start-->
<%@include file="common/navbar.jsp" %>
<!-- Navbar end-->

<script>

    $(function () {
        $(document).ready(function () {
            $.ajax({
                type: 'post',
                url: "<%=request.getContextPath()%>/service/findNotice.do",
                cache: false,
                dataType: 'json',
                success: function (data) {
                    var notice = '<main class="am-panel-bd">';
                    notice += data.xiaoqu + '<p>' + data.description + '</p>';
                    notice += '</main>';
                    notice += '<footer class="am-panel-footer">发表于：<p>' + data.createTime + '</p></footer>';

                    $("#notice").html(notice);
                },
                error: function () {
                    return;
                }
            });

        });
    });

</script>
</body>
</html>
