<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Navbar start-->
<div data-am-widget="navbar" class="am-navbar am-cf am-navbar-default "
     id="">
  <ul class="am-navbar-nav am-cf am-avg-sm-4">
    <li>
      <a href="<%=request.getContextPath()%>/service/getContact2.do" class="">
        <span class="am-icon-comment-o"></span>
        <span class="am-navbar-label">发布公告</span>
      </a>
    </li>
    <li>
      <a href="<%=request.getContextPath()%>/service/getCkcontact2.do" class="">
        <span class="am-icon-comments-o"></span>
        <span class="am-navbar-label">处理反馈</span>
      </a>
    </li>
    <li>
      <a href="<%=request.getContextPath()%>/service/getQd2.do" class="">
        <span class="am-icon-cart-arrow-down"></span>
        <span class="am-navbar-label">个人信息</span>
      </a>
    </li>
    <li>
      <a href="<%=request.getContextPath()%>/service/getNotice2.do" class="">
        <span class="am-icon-desktop"></span>
        <span class="am-navbar-label">礼品订单</span>
      </a>
    </li>
  </ul>
</div>
<!-- Navbar end-->

<!--offcanvas start-->

<!--offcanvas end-->