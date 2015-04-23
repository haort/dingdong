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
        <a href="#title-link">历史公告</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp" %>
<!--menu end-->

<!--content start-->
<div class="am-container" id="notices">

</div>
<!--content end-->

<!-- Navbar start-->
<%@include file="common/adnavbar.jsp" %>
<!-- Navbar end-->


<script>

    $(function () {
        $.ajax({
            type: 'post',
            url: "/service/getNotices.do",
            cache: false,
            dataType: 'json',
            success: function (data) {
                var notices = "";
                jQuery.each(data, function (i, item) {
                    notices += '<hr data-am-widget="divider" style="" class="am-divider am-divider-default"/>';
                    notices += '<main class="am-panel-bd">';
                    notices += item.xiaoqu + '<p>' + item.description + '</p>';
                    if (item.image != null && item.image != "") {
                        notices += '<figure class="am-thumbnail">';
                        notices += '<img id="img"src="http://lhdx-notice.stor.sinaapp.com/' + item.image + '" alt=""/>';
                        notices += '</figure>';
                    }
                    notices += '</main>';
                    notices += '<footer class="am-panel-footer">发表于：<p>' + item.createTime + '</p></footer>';
                });

                $("#notices").html(notices);
            },
            error: function () {
                return;
            }
        });
    });

</script>
</body>
</html>
