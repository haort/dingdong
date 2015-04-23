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
    <%@include file="../common/css.jsp" %>
    <%@include file="../common/js.jsp" %>
    <script src="<%=request.getContextPath()%>/assets/js/jquery.form.js"></script>
</head>
<body>
<!-- Header start-->
<header data-am-widget="header" class="am-header am-header-default">
    <h1 class="am-header-title">
        <a href="#title-link">吃货集结令</a>
    </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="../common/menu.jsp" %>
<!--menu end-->

<!--content start-->
<div class="am-panel am-panel-primary am-margin-sm">
    <div class="am-panel-hd">活动内容</div>
    <div class="am-panel-bd">
        <p>日期：5月1日－5月31日</p>

        <p>内容：太湖世家邀请您免费吃美食！给您心中美食投上一票就有机会获得免费试吃一次机会（双人份），活动结束后，针对冠军美食，我们随机抽取5名新运业主，送上美食大餐</p>

        <p>备注：每个账号可投票一次，针对获奖业主，我们提供双人美食套餐</p>
        <figure class="am-thumbnail">
            <img src="http://lhdx-dingdong.stor.sinaapp.com/hd1.jpg" alt=""/>
        </figure>
        <p>吃货们，赶紧行动吧！</p>
    </div>
</div>

<div class="am-panel am-panel-primary am-margin-sm">
    <div class="am-panel-hd">牛肉咖喱</div>
    <div class="am-panel-bd">
        <figure class="am-thumbnail">
            <img src="<%=request.getContextPath()%>/images/product_bnyddy.jpg" alt=""/>
        </figure>
        <p>店名：津津咖喱</p>

        <p>香浓可口，肥而不腻</p>
    </div>
    <footer class="am-panel-footer">
        <button type="button" id="uploadImage1" class="am-btn am-btn-warning am-btn-sm">
            <i class="am-icon-cloud-upload"></i>投票
        </button>
    </footer>
</div>

<div class="am-panel am-panel-primary am-margin-sm">
    <div class="am-panel-hd">红烧肉</div>
    <div class="am-panel-bd">
        <figure class="am-thumbnail">
            <img src="<%=request.getContextPath()%>/images/product_dwsj.jpg" alt=""/>
        </figure>
        <p>店名：哈哈</p>

        <p>香浓可口，肥而不腻</p>
    </div>
    <footer class="am-panel-footer">
        <button type="button" id="uploadImage2" class="am-btn am-btn-primary am-btn-sm">
            <i class="am-icon-cloud-upload"></i>投票
        </button>
    </footer>
</div>


<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="malert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">提交成功</div>
        <div class="am-modal-bd">
            我们会尽快安排打印！
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


<div class="am-modal am-modal-alert" tabindex="-1" id="joinedAlert">
    <div class="am-modal-dialog">
        <div class="am-modal-hd">友情提示</div>
        <div class="am-modal-bd">
            您已参加过活动,请查看我的照片！
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
            图片大于3M！
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
<%@include file="../common/hdnavbar.jsp" %>
<!-- Navbar end-->

<script>
    $(function () {
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/service/isJoined.do',
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.isJoined == true) {
                    $('#joinedAlert').modal();
                }
            },
            error: function () {
                return;
            }
        });

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
                var fileSize = custRoud(this.size / 1000 / 1000, 2);
                if (fileSize > 2) {
                    $('#fileSizeAlert').modal();
                    return false;
                }
                fileNames += '<span class="am-badge">' + this.name + ':' + fileSize + 'M</span> ';
            });
            $('#file-list').html(fileNames);
        });

        function showRequest() {
            var isSuccess = $("#hdForm").validate().form();
            return isSuccess;
        }

        function onSuccess(data, status) {
            if (data.isAddSucessed == true) {
                $('#loading').modal('close');
                $('#malert').modal();
                $('#hdForm')[0].reset();
                $('#file-list').html('');
            } else {
                $('#hdForm')[0].reset();
                $('#loading').modal('close');
                $('#joinedAlert').modal();
                $('#file-list').html('');
            }
        }

        var options = {
            beforeSubmit: showRequest,
            success: onSuccess
        };

        $('#hdForm').submit(function () {
            $(this).ajaxSubmit(options);
            $('#loading').modal();
            return false;
        });

    });

</script>
</body>
</html>
