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
        <a href="#title-link">发布公告</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->

<!--content start-->
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
    <nav class="am-titlebar-nav">
        <a href="<%=request.getContextPath()%>/service/getAdMoreNotices.do" class="">历史公告 &raquo;</a>
    </nav>
</div>

<form class="am-form" id="ggForm">
    <fieldset>
        <div class="am-form-group">
            <label for="doc-title">公告主题</label>
            <input type="text" class="mRequired" id="doc-title" name = "title" placeholder="输入公告主题" data-validation-message="输入公告主题">
        </div>

        <div class="am-form-group">
            <label for="doc-description">公告内容</label>
            <input type="text" class="mRequired" id="doc-description" name="description" placeholder="请输入公告内容" data-validation-message="请输入公告内容">
        </div>

        <p><button type="submit" id="okBtn"class="am-btn am-btn-primary">发布</button></p>
    </fieldset>
</form>
<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="malert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">发布成功</div>
        <div class="am-modal-bd">
            发布公告成功！
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

    $(function () {
        $('#ggForm').validate( {
            submitHandler : function(form) {
                var formData = $("#ggForm").serialize();
                $.ajax( {
                    type : "POST",
                    url : "<%=request.getContextPath()%>/service/addNewNotice.do",
                    cache : false,
                    data : formData,
                    success : onSuccess
                });

            },
            errorPlacement:function(error,element){

            }
        });

        function onSuccess(data, status) {
            if(data.isAddSucessed ==true){
                $('#malert').modal();
                $('#ggForm')[0].reset();
            }
        }
    });

</script>
</body>
</html>
