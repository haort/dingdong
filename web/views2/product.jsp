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
<nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1" data-am-menu-offcanvas>
  <a href="javascript: void(0)" class="am-menu-toggle">
    <i class="am-icon-user"></i>
  </a>
  <div class="am-offcanvas">
    <div class="am-offcanvas-bar am-offcanvas-bar-flip">
      <ul class="am-menu-nav sm-block-grid-1">
        <li class="">
          <a href="/views2/reg.jsp">更换小区</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--menu end-->
<div class="am-g am-margin-top-sm">
  <div class="am-u-sm-12">
    <div class="am-thumbnail">
      <img src="/images/product_bnyddy.jpg" alt=""/>
      <div class="am-thumbnail-caption">
        <h3>移动电源</h3>
        <p>博能895(13000MA)金属移动电源</p>
        <p>
          <button class="am-btn am-btn-default">立即兑换</button>
        </p>
      </div>
    </div>
  </div>
</div>
<!--content end-->

<!-- Navbar start-->
<%@include file="common/navbar.jsp"%>
<!-- Navbar end-->

<script>
  $(function() {
  });
</script>
</body>
</html>
