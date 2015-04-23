<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="utf-8"%>
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
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <%@include file="common/css.jsp"%>
  <%@include file="common/js.jsp"%>
  <script src="<%=request.getContextPath()%>/assets/js/jquery.form.js"></script>
</head>
<body>
<!-- Header start-->
<header data-am-widget="header" class="am-header am-header-default">
  <h1 class="am-header-title">
    <a href="#title-link">问题反馈</a>
  </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->

<!--content start-->
<div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
  <h2 class="am-titlebar-title ">问题反馈</h2>
  <nav class="am-titlebar-nav">
    <a href="<%=request.getContextPath()%>/service/getCkcontact2.do" class="">历史反馈 &raquo;</a>
  </nav>
</div>
<form class="am-form" id="contactForm" method="post" enctype="multipart/form-data"  action="<%=request.getContextPath()%>/service/addNewContact.do">
  <fieldset>
    <div class="am-form-group">
      <label for="doc-name">您的姓名</label>
      <input type="text" class="mRequired" id="doc-name" name = "name" placeholder="输入姓名" data-validation-message="请输入姓名">
    </div>

    <div class="am-form-group">
      <label for="doc-phone">联系号码</label>
      <input type="text" class="phoneRequired" id="doc-phone" name="phone" placeholder="请输入联系号码" data-validation-message="请输入联系号码">
    </div>

    <div class="am-form-group">
      <label for="doc-addr">您的地址</label>
      <input type="text" class="mRequired" id="doc-addr" name="addr" placeholder="例如：1栋1单元101室" data-validation-message="请输入地址">
    </div>


    <div class="am-form-group">
      <label for="doc-wenti">问题说明</label>
      <textarea class="mRequired" rows="5" name="wenti" id="doc-wenti" placeholder="请输入问题说明" data-validation-message="请输入问题说明"></textarea>
    </div>

    <div class="am-form-group am-form-file">
      <label for="uploadImage">可上传一张小于2M图片</label>
      <button type="button" id ="uploadImage"class="am-btn am-btn-default am-btn-sm">
        <i class="am-icon-cloud-upload"></i>选择图片
      </button>
      <input id="contactImage" name="contactImage" type="file">
    </div>
    <div id="file-list"></div>

    <p><button type="submit" id="okBtn"class="am-btn am-btn-primary">提交</button></p>
  </fieldset>
</form>
<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="malert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">反馈成功</div>
    <div class="am-modal-bd">
      我们将尽快处理！
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
<%@include file="common/navbar.jsp"%>
<!-- Navbar end-->

<script>
  $(function() {
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
      var isSuccess = $("#contactForm").validate().form();
      return isSuccess;
    }

    function onSuccess(data, status) {

      if (data.isAddSucessed == true) {
        $('#loading').modal('close');
        $('#malert').modal();
        $('#contactForm')[0].reset();
        $('#file-list').html('');
      }else{
        $('#loading').modal('close');
        alert('反馈失败');
        $('#contactForm')[0].reset();
        $('#file-list').html('');
      }
    }

    var options = {
      beforeSubmit: showRequest,
      success: onSuccess
    };

    $('#contactForm').submit(function () {
      $(this).ajaxSubmit(options);
      $('#loading').modal();
      return false;
    });

  });

</script>
</body>
</html>
