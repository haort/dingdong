<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav data-am-widget="menu" class="am-menu  am-menu-offcanvas1" data-am-menu-offcanvas>
  <a href="javascript: void(0)" class="am-menu-toggle">
    <i class="am-header-icon am-icon-bars"></i>
  </a>
  <div class="am-offcanvas" id="mainOffcanvas">
    <div class="am-offcanvas-bar am-offcanvas-bar-flip">
      <ul class="am-menu-nav sm-block-grid-1">
        <li class="am-nav-header">我的信息</li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getUserView.do">个人中心</a>
        </li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getUpdateUserView.do">更新信息</a>
        </li>
        <li class="am-nav-header">积分相关</li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getQd2.do">积分签到</a>
        </li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getJfsc2.do">积分商城</a>
        </li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getPorderView.do">已兑礼品</a>
        </li>
        <li class="am-nav-header">我的物业</li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getNotice2.do">最新公告</a>
        </li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getMoreNotices2.do">历史公告</a>
        </li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getContact2.do">问题反馈</a>
        </li>
        <li class="">
          <a href="<%=request.getContextPath()%>/service/getCkcontact2.do">历史反馈</a>
        </li>
      </ul>
    </div>
  </div>
</nav>