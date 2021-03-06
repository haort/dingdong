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
    <script src="<%=request.getContextPath()%>/assets/js/jquery.form.js"></script>
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
<%@include file="common/menu.jsp" %>
<!--menu end-->

<!--content start-->
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
    <nav class="am-titlebar-nav">
        <a href="<%=request.getContextPath()%>/service/getAdMoreNotices.do" class="">历史公告 &raquo;</a>
    </nav>
</div>

<form class="am-form" id="ggForm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/service/addNewNotice.do">
    <fieldset>
        <div class="am-form-group">
            <label for="doc-title">公告主题</label>
            <input type="text" class="mRequired" id="doc-title" name="title" placeholder="输入公告主题"
                   data-validation-message="输入公告主题">
        </div>

        <div class="am-form-group">
            <label for="doc-description">公告内容</label>
            <input type="text" class="mRequired" id="doc-description" name="description" placeholder="请输入公告内容"
                   data-validation-message="请输入公告内容">
        </div>

        <div class="am-form-group am-form-file">
            <label for="uploadImage">可上传一张小于2M图片</label>
            <button type="button" id ="uploadImage"class="am-btn am-btn-default am-btn-sm">
                <i class="am-icon-cloud-upload"></i>选择图片
            </button>
            <input id="contactImage" name="contactImage" type="file">
        </div>
        <div id="file-list"></div>

        <p>
            <button type="submit" id="okBtn" class="am-btn am-btn-primary">发布</button>
        </p>
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
<div class="am-modal am-modal-alert" tabindex="-1" id="imageAlert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">友情提示</div>
        <div class="am-modal-bd">
            只能上传图片文件！
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<div class="am-modal am-modal-alert" tabindex="-1" id="fileSizeAlert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">友情提示</div>
        <div class="am-modal-bd">
            图片大于2M！
        </div>
        <div class="am-modal-footer">
            <span class="am-modal-btn">确定</span>
        </div>
    </div>
</div>

<!--alert end-->
<!--loading start-->
<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1" id="loading">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">正在提交...</div>
        <div class="am-modal-bd">
            <span class="am-icon-spinner am-icon-spin"></span>
        </div>
    </div>
</div>
<!--loading end-->
<!--content end-->


<!-- Navbar start-->
<%@include file="common/adnavbar.jsp" %>
<!-- Navbar end-->

<script>
    $(function () {
        $('#contactImage').on('change', function () {
            var fileNames = '';
            $.each(this.files, function () {
                var fileName = this.name;
                var extStart = fileName.lastIndexOf(".");
                var ext = fileName.substring(extStart, fileName.length).toUpperCase();
                if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
                    $('#imageAlert').modal();
                    return false;
                }
                var fileSize = custRoud(this.size/1000/1000,2);
                if(fileSize >2){
                    $('#fileSizeAlert').modal();
                    return false;
                }
                fileNames += '<span class="am-badge">' + this.name +':'+fileSize+ 'M</span> ';
            });
            $('#file-list').html(fileNames);
        });

        function showRequest() {
            var isSuccess = $("#ggForm").validate().form();
            return isSuccess;
        }

        function onSuccess(data, status) {
            if (data.isAddSucessed == true) {
                $('#loading').modal('close');
                $('#malert').modal();
                $('#ggForm')[0].reset();
                $('#file-list').html('');
            }else{
                $('#loading').modal('close');
                alert('失败！');
            }
        }

        var options = {
            beforeSubmit: showRequest,
            success: onSuccess
        };

        $('#ggForm').submit(function () {
            $(this).ajaxSubmit(options);
            $('#loading').modal();
            return false;
        });

    });

</script>
</body>
</html>
