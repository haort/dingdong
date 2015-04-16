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
        <a href="#title-link">历史反馈</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->

<!--content start-->
<div class="am-g am-g-fixed">
    <div class="am-u-sm-11 am-u-sm-centered">
        <ul class="am-comments-list" id="contacts">
        </ul>
    </div>
</div>

<!--content end-->


<!-- Navbar start-->
<%@include file="common/adnavbar.jsp" %>
<!-- Navbar end-->

<script>
    function initContacts(){
        $.ajax({
            type: 'post',
            url: "<%=request.getContextPath()%>/service/findAdContacts.do",
            cache: false,
            dataType: 'json',
            success: function (data) {
                var contact = "";
                jQuery.each(data.contacts, function (i, item) {
                    contact += '<li class="am-comment" id="contact' + item.id + '">';
                    contact += '<a href="#">';
                    contact += '<img src="<%=request.getContextPath()%>/images/commentAvatarBg.png" alt="" class="am-comment-avatar" width="48" height="48">';
                    contact += '</a>';
                    contact += '<div class="am-comment-main">';
                    contact += '<header class="am-comment-hd">';
                    contact += '<div class="am-comment-meta">';
                    contact += '<a href="#" class="am-comment-author">' + item.name + '</a>(' + item.createTime + ')';
                    contact += '</div>';
                    contact += '</header>';
                    contact += '<div class="am-comment-bd">';
                    contact += '<p>' + item.wenti + '</p>';
                    contact += ' </div>';
                    contact += ' <footer class="am-comment-footer">';
                    contact += '<div class="am-comment-actions" id="flag"'+item.id+'>';
                    if (item.flag == '处理中') {
                        contact += '<span class="am-badge am-radius am-badge-secondary">' + item.flag + '</span>';
                    } else if (item.flag == '已解决') {
                        contact += '<span class="am-badge am-radius am-badge-success">' + item.flag + '</span>';
                    }
                    contact += '<span class="am-badge am-radius am-badge-warning">' + item.rep + '</span>';
                    contact += '</footer>';
                    contact += '</div>';
                    contact += '</li>';
                });
                $("#contacts").html(contact);
            },
            error: function () {
                return;
            }
        });
    }

    $(function () {
        initContacts();
    });

</script>
</body>
</html>
