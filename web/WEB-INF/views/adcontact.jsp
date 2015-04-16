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
        <a href="#title-link">处理反馈</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->

<!--content start-->
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
    <nav class="am-titlebar-nav">
        <a href="<%=request.getContextPath()%>/service/getAdMoreContact.do" class="">已处理反馈 &raquo;</a>
    </nav>
</div>

<div class="am-g am-g-fixed">
    <div class="am-u-sm-11 am-u-sm-centered">
        <ul class="am-comments-list" id="contacts">
        </ul>
    </div>
</div>
<!-- repContact start-->
<div class="am-modal-actions" id="repAlert">
    <div class="am-modal-actions-group">
        <ul class="am-list">
            <li class="am-modal-actions-header">处理反馈</li>
            <li class="am-modal-actions-danger">
                <a id="doing" href="javascript:void(0)" onclick="doContact(this)" class="am-btn am-disabled"><span class="am-icon-edit"></span>处理中</a>
            </li>
            <li class="am-modal-actions-danger">
                <a href="javascript:void(0)" onclick="doContact(this)" class="am-btn"><span class="am-icon-check-square-o"></span>已解决</a>
            </li>
        </ul>
    </div>
    <div class="am-modal-actions-group">
        <button class="am-btn am-btn-secondary am-btn-block" data-am-modal-close>取消</button>
    </div>
</div>

<!-- repContact end-->

<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="repOkAlert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">友情提醒</div>
        <div class="am-modal-bd">
            处理成功！
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>
<!--alert end-->

<!--content end-->


<!-- Navbar start-->
<%@include file="common/adnavbar.jsp" %>
<!-- Navbar end-->

<script>
    function initRepContact(id,flag) {
        $('#repAlert').val(id);
        if(flag =='处理中'){
            if(!$('#doing').hasClass('am-disabled')){
                $('#doing').addClass('am-disabled');
            }
        }else{
            if($('#doing').hasClass('am-disabled')){
                $('#doing').removeClass('am-disabled');
            }
        }
        $('#repAlert').modal();
    }

    function doContact(e) {
        var id = $('#repAlert').val();
        var flag = $(e).text();
        $.ajax({
            type: 'post',
            url: "<%=request.getContextPath()%>/service/updateContact2.do",
            cache: false,
            data: "id=" + id + "&flag=" + flag,
            success: function (data) {
                if (true == data.isUpdateSuccess) {
                    $('#repOkAlert').modal();
                    initContacts();
                    $('#repAlert').modal('close');
                }
            },
            error: function () {
                return;
            }
        });

        $('#repAlert').val("");
    }

    function initContacts(){
        $.ajax({
            type: 'post',
            url: "<%=request.getContextPath()%>/service/findContactsByXiaoqu2.do",
            cache: false,
            dataType: 'json',
            success: function (data) {
                var contact = "";
                jQuery.each(data.contacts, function (i, item) {
                    contact += '<li class="am-comment" id="contact' + item.id + '">';
                    contact += '<a href="tel:'+item.phone+'">';
                    contact += '<img src="<%=request.getContextPath()%>/images/commentAvatarBg.png" alt="" class="am-comment-avatar" width="48" height="48">';
                    contact += '</a>';
                    contact += '<div class="am-comment-main">';
                    contact += '<header class="am-comment-hd">';
                    contact += '<div class="am-comment-meta">';
                    contact += '<a href="tel:'+item.phone+'" class="am-comment-author">' + item.name + '</a>(' + item.createTime + ')';
                    contact += '</div>';
                    contact += '</header>';
                    contact += '<div class="am-comment-bd">';
                    contact += '<p>' + item.wenti + '</p>';
                    contact += ' </div>';
                    contact += ' <footer class="am-comment-footer">';
                    contact += '<div class="am-comment-actions" id="flag"'+item.id+'>';
                    if (item.flag == '未处理') {
                        contact += '<span class="am-badge am-radius">' + item.flag + '</span>';
                    } else if (item.flag == '处理中') {
                        contact += '<span class="am-badge am-radius am-badge-secondary">' + item.flag + '</span>';
                    }
                    contact += '<a href="javascript:void(0)" onclick="initRepContact(' + item.id+',\''+item.flag + '\')">';
                    contact += '<i class="am-icon-comment-o"></i>';
                    contact += '处理反馈';
                    contact += '</a>';
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
