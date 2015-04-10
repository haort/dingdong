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

<!--content start-->
<!-- List -->
<div data-am-widget="list_news" class="am-list-news am-list-news-default">
  <div class="am-list-news-bd">
    <ul class="am-list" id="productList">

    </ul>
  </div>
</div>
<!--content end-->

<!-- Navbar start-->
<%@include file="common/navbar.jsp"%>
<!-- Navbar end-->

<script>
  $(function() {
    $.ajax({
      type: 'post',
      url: '<%=request.getContextPath()%>/service/findProducts.do',
      cache: false,
      dataType: 'json',
      success: function(data){
        var products="";
        jQuery.each(data, function(i,item){
          products+='<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">';
          products+='<div class="am-u-sm-4 am-list-thumb">';
          products+='<a href="#">';
          products+='<img src="<%=request.getContextPath()%>/images/'+item.productPic+'"/>';
          products+='</a>';
          products+='</div>';
          products+='<div class="am-u-sm-8 am-list-main">';
          products+='<h3 class="am-list-item-hd">';
          products+='<a href="/views2/product.jsp">'+item.productName+'</a>';
          products+='</h3>';
          products+='<div class="am-list-item-text">';
          products+='需要积分：'+item.productScore+'，剩余数量：'+item.num;
          products+='</div>';
          products+='</div>';
          products+='</li>';
        });
        $('#productList').html(products);
      },
      error: function(){
        return;
      }
    });
  });
</script>
</body>
</html>
