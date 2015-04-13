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
  <script type="text/javascript"
          src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
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
<nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1" data-am-menu-offcanvas>
  <a href="javascript: void(0)" class="am-menu-toggle">
    <i class="am-icon-user"></i>
  </a>
  <div class="am-offcanvas">
    <div class="am-offcanvas-bar am-offcanvas-bar-flip">
      <ul class="am-menu-nav sm-block-grid-1">
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getReg2.do">更换小区</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--menu end-->

<!--content start-->
<form class="am-form" id="contactForm">
  <fieldset>
    <legend>问题反馈</legend>

    <div class="am-form-group">
      <label for="doc-name">您的姓名</label>
      <input type="text" class="mRequired" id="doc-name" name = "name" placeholder="输入姓名" data-validation-message="请输入姓名">
    </div>

    <div class="am-form-group">
      <label for="doc-phone">联系号码</label>
      <input type="text" class="mRequired" id="doc-phone" name="phone" placeholder="请输入联系号码" data-validation-message="请输入联系号码">
    </div>

    <div class="am-form-group">
      <label for="doc-addr">您的地址</label>
      <input type="text" class="mRequired" id="doc-addr" name="addr" placeholder="例如：1栋1单元101室" data-validation-message="请输入地址">
    </div>


    <div class="am-form-group">
      <label for="doc-wenti">问题说明</label>
      <textarea class="mRequired" rows="5" name="wenti" id="doc-wenti" placeholder="请输入问题说明" data-validation-message="请输入问题说明"></textarea>
    </div>

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
<!--alert end-->
<!--content end-->


<!-- Navbar start-->
<%@include file="common/navbar.jsp"%>
<!-- Navbar end-->

<script>

  jQuery.validator.addMethod('mRequired', function(value,element) {
    $(element).parent('.am-form-group').find('.am-alert').hide();
    if(value == null||value==""){
      var $group = $(element).parent();
      var $alert = $group.find('.am-alert');
      // 使用自定义的提示信息 或 插件内置的提示信息
      var msg = $(element).data('validationMessage')||'请填写相关信息';

      if (!$alert.length) {
        $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                appendTo($group);
      }

      $alert.html(msg).show();
      return false;
    }else{
      return true ;
    }
  }, "");

  $(function() {
    $('#contactForm').validate( {
      submitHandler : function(form) {
        var formData = $("#contactForm").serialize();
        $.ajax( {
          type : "POST",
          url : "<%=request.getContextPath()%>/service/addNewContact.do",
          cache : false,
          data : formData,
          success : onSuccess
        });

      },
      errorPlacement:function(error,element){

      }
    });

    function onSuccess(data, status) {
      $('#malert').modal();
      $('#contactForm')[0].reset();
    }


  });

</script>
</body>
</html>
