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
</head>
<body>

<!-- Header start-->
<header data-am-widget="header" class="am-header am-header-default">
  <h1 class="am-header-title">
    <a href="#title-link">积分商场</a>
  </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->
<div class="am-g am-margin-top-sm">
  <div class="am-u-sm-12">
    <div class="am-thumbnail">
      <figure class="am-thumbnail">
      <img src="<%=request.getContextPath()%>/images/${productPic}" alt=""/>
      </figure>
      <div class="am-thumbnail-caption">
        <h3>${productName}</h3>
        <p>${productDes}</p>
        <p>
          <button class="am-btn am-btn-default" id="exchangeBtn">立即兑换</button>
        </p>
      </div>
    </div>
  </div>
</div>

<!-- pop start-->
<div class="am-popup" id="my-popup">
  <div class="am-popup-inner">
    <div class="am-popup-hd">
      <h4 class="am-popup-title">礼品发放登记</h4>
      <span data-am-modal-close
            class="am-close">&times;</span>
    </div>
    <div class="am-popup-bd">
      <form class="am-form" id="contactForm">
        <fieldset>
          <input type="hidden" name="productId"id="productId" value="${productId}">
          <div class="am-form-group">
            <label for="doc-name">您的姓名</label>
            <input type="text" class="mRequired" id="doc-name" name = "name" placeholder="输入姓名" data-validation-message="请输入姓名">
          </div>

          <div class="am-form-group">
            <label for="doc-phone">联系号码</label>
            <input type="text" class="phoneRequired" id="doc-phone" name="phone" placeholder="联系号码" data-validation-message="请输入联系号码">
          </div>

          <div class="am-form-group">
            <label for="doc-addr">您的地址</label>
            <input type="text" class="mRequired" id="doc-addr" name="addr" placeholder="例如：1栋1单元101室" data-validation-message="请输入地址">
          </div>

          <p><button type="submit" id="okBtn"class="am-btn am-btn-primary">提交</button></p>
        </fieldset>
      </form>
    </div>
  </div>
</div>
<!-- pop end-->

<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="malert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">兑换成功</div>
    <div class="am-modal-bd">
      我们将尽快发货！
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>
<!--alert end-->


<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="nojfAlert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">友情提醒</div>
    <div class="am-modal-bd">
      您当前积分不足以兑换此产品！
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
  $(function() {
    $('#exchangeBtn').click(function(){
      $.ajax({
        type: 'post',
        url: "<%=request.getContextPath()%>/service/isExchanged.do",
        cache: false,
        data: "productId="+${productId},
        success: function(data){
          if(true==data.isExchanged){
            $('#my-popup').modal();
          }else{
            $('#nojfAlert').modal();
          }
        },
        error: function(){
          return;
        }
      });
    });

    $('#contactForm').validate( {
      submitHandler : function() {
        var formData = $("#contactForm").serialize();
        $.ajax( {
          type : "POST",
          url : "<%=request.getContextPath()%>/service/exchangeProduct2.do",
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
      $('#my-popup').modal('close');
    }

  });
</script>
</body>
</html>
