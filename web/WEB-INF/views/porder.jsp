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
    <a href="#title-link">已兑礼品</a>
  </h1>
</header>
<!--Header end-->

<!-- Menu start-->
<%@include file="common/menu.jsp"%>
<!--menu end-->

<!--content start-->
<!-- List -->
<div data-am-widget="list_news" class="am-list-news am-list-news-default">
  <div class="am-list-news-bd">
    <ul class="am-list" id="productList">

    </ul>
  </div>
</div>
<!--list end-->

<!--content end-->

<!-- Navbar start-->
<%@include file="common/navbar.jsp"%>
<!-- Navbar end-->

<script>
  $(function() {
    $.ajax({
      type: 'post',
      url: '<%=request.getContextPath()%>/service/findPorders.do',
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
          products+='<a href="#">'+item.productName+'</a>';
          products+='</h3>';
          products+='<div class="am-list-item-text">';
          products+='兑换时间：'+item.createTime;
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
