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
    <a href="#title-link">查看反馈</a>
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
<div class="am-g am-g-fixed">
  <div class="am-u-sm-11 am-u-sm-centered">
    <ul class="am-comments-list">
      <li class="am-comment">
        <a href="#link-to-user-home">
          <img src="http://amui.qiniudn.com/bw-2014-06-19.jpg?imageView/1/w/96/h/96" alt="" class="am-comment-avatar" width="48" height="48">
        </a>
        <div class="am-comment-main">
          <header class="am-comment-hd">
            <div class="am-comment-meta">
              <a href="#link-to-user" class="am-comment-author">某人</a> 评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-12 15:30</time>
            </div>
          </header>
          <div class="am-comment-bd">
            <p>《永远的蝴蝶》一文，还吸收散文特长，多采用第一人称，淡化情节，体现一种思想寄托和艺术追求。</p>
          </div>
          <footer>
            <div class="am-comment-meta">
              正在处理
            </div>
          </footer>
        </div>
      </li>
      <li class="am-comment">
        <a href="#link-to-user-home">
          <img src="http://www.gravatar.com/avatar/1ecedeede84a44f371b9d8d656bb4265?d=mm&amp;s=96" alt="" class="am-comment-avatar" width="48" height="48">
        </a>
        <div class="am-comment-main">
          <header class="am-comment-hd">
            <div class="am-comment-meta">
              <a href="#link-to-user" class="am-comment-author">路人甲</a> 评论于 <time datetime="2013-07-27T04:54:29-07:00" title="2013年7月27日 下午7:54 格林尼治标准时间+0800">2014-7-13 0:03</time>
            </div>
          </header>
          <div class="am-comment-bd">
            <p>感觉仿佛是自身的遭遇一样，催人泪下</p>
          </div>
          <footer>
            <div class="am-comment-meta">
              已解决
            </div>

          </footer>
        </div>
      </li>
    </ul>
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
