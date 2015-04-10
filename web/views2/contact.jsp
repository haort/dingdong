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
          <a href="<%=request.getContextPath()%>/views2/reg.jsp">更换小区</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--menu end-->

<!--content start-->
<form class="am-form">
  <fieldset>
    <legend>问题反馈</legend>

    <div class="am-form-group">
      <label for="doc-ipt-email-1">您的姓名</label>
      <input type="text" class="" id="doc-ipt-email-1" placeholder="输入姓名">
    </div>

    <div class="am-form-group">
      <label for="doc-ipt-pwd-1">联系号码</label>
      <input type="text" class="" id="doc-ipt-pwd-1" placeholder="联系号码">
    </div>

    <div class="am-form-group">
      <label for="doc-ipt-pwd-1">您的地址</label>
      <input type="text" class="" id="doc-ipt-addr" placeholder="例如：1栋1单元101室">
    </div>


    <div class="am-form-group">
      <label for="doc-ta-1">问题说明</label>
      <textarea class="" rows="5" id="doc-ta-1"></textarea>
    </div>

    <p><button type="submit" class="am-btn am-btn-primary">提交</button></p>
  </fieldset>
</form>

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
