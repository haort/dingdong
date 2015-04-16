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
        <a href="#title-link">我的信息</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->


<!--content start-->
<form class="am-form" id="userForm">
    <fieldset>
        <div class="am-form-group">
            <label for="doc-name">您的姓名</label>
            <input type="text" class="mRequired" id="doc-name" name="name" placeholder="输入姓名"
                   data-validation-message="请输入姓名">
        </div>

        <div class="am-form-group">
            <label for="doc-phone">联系号码</label>
            <input type="text" class="phoneRequired" id="doc-phone" name="phone" placeholder="联系号码"
                   data-validation-message="请输入联系号码">
        </div>

        <div class="am-form-group">
            <label for="doc-addr">您的地址</label>
            <input type="text" class="mRequired" id="doc-addr" name="addr" placeholder="例如：1栋1单元101室"
                   data-validation-message="请输入地址">
        </div>

        <p>
            <button type="submit" id="okBtn" class="am-btn am-btn-primary">更新信息</button>
            <a class="am-btn am-btn-default" href="<%=request.getContextPath()%>/service/getReg2.do">
                改变小区
            </a>
        </p>
    </fieldset>
</form>
<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="mAlert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">友情提醒</div>
        <div class="am-modal-bd">
            更新成功！
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>
<!--alert end-->
<!--content end-->

<!-- Navbar start-->
<%@include file="common/navbar.jsp" %>
<!-- Navbar end-->

<script>
    $(function () {
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/initUserInfo.do',
            cache: false,
            success: function (data) {
                var user = data.user;
                if (user != null) {
                    if (user.name != null && user.name != '') {
                        $('#doc-name').val(user.name);
                        $('#doc-name').attr('readonly', 'readonly');

                    }
                    if (user.phone != null && user.phone != '') {
                        $('#doc-phone').val(user.phone);
                        $('#doc-phone').attr('readonly', 'readonly');

                    }
                    if (user.addr != null && user.addr != '') {
                        $('#doc-addr').val(user.addr);
                        $('#doc-addr').attr('readonly', 'readonly');

                    }
                    if (user.name != null && user.name != '' && user.phone != null && user.phone != '' && user.addr != null && user.addr != '') {
                        $('#okBtn').attr('disabled', 'disabled');
                    }
                }
            },
            error: function () {
                return;
            }
        });

        $('#userForm').validate({
            submitHandler: function () {
                var formData = $('#userForm').serialize();
                $.ajax({
                    type: 'POST',
                    url: '<%=request.getContextPath()%>/service/updateUser.do',
                    cache: false,
                    data: formData,
                    success: onSuccess
                });

            },
            errorPlacement: function (error, element) {

            }
        });

        function onSuccess(data, status) {
            $('#mAlert').modal();
            $('#doc-name').attr('readonly', 'readonly');
            $('#doc-phone').attr('readonly', 'readonly');
            $('#doc-addr').attr('readonly', 'readonly');
            $('#okBtn').attr('disabled', 'disabled');
        }
    });
</script>
</body>
</html>
