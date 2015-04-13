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
  <style>
    .get {
      background: #0f9ae0;
      color: #fff;
      text-align: center;
      padding: 50px 0;
    }

    .get-title {
      font-size: 120%;
      border: 5px solid #fff;
      padding: 10px;
      display: inline-block;
    }
  </style>
</head>
<body>

<!-- Header start-->
<header data-am-widget="header" class="am-header am-header-default">
  <h1 class="am-header-title">
    <a href="#title-link">积分签到</a>
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
<div data-am-widget="slider" class="am-slider am-slider-c2 am-slider-manual">
  <ul class="am-slides" id="products">
  </ul>
</div>
<!-- qd start-->
<div class="get">
  <div class="am-g">
    <div class="am-u-lg-12">
      <h1 class="get-title">当前积分<span id="nowScore"></span>分</h1>
      <p>
        <a href="#" class="am-btn am-btn-default get-btn" id="qdBtn">
          <i class="am-icon-calendar"></i>
          请签到
        </a>
      </p>
      <p>
        <a href="<%=request.getContextPath()%>/service/getJfsc2.do" class="am-btn am-btn-sm am-btn-default"><i class="am-icon-shopping-cart"></i>前往积分商场-></a>
      </p>
    </div>
  </div>
</div>
<!--qd end-->
<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">友情提醒</div>
    <div class="am-modal-bd">
      您今天已签到！
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
    $.ajax({
      type: 'post',
      url: '<%=request.getContextPath()%>/service/findProducts.do',
      cache: false,
      dataType: 'json',
      success: function(data){
        var products="";
        jQuery.each(data, function(i,item){
          products+='<li>';
          products+='<img src="<%=request.getContextPath()%>/images/'+item.productPic+'"/>';
          products+='<div class="am-slider-desc">'+item.productName+'</div>';
          products+='</li>';
        });
        $('#products').html(products);
        $('.am-slider-manual').flexslider({

        });
      },
      error: function(){
        return;
      }
    });

    $.ajax({
      type: 'post',
      url: '<%=request.getContextPath()%>/service/initQd.do',
      cache: false,
      success: function(data){
        $('#nowScore').html(data.jf);
        if(true ==data.qd){
          $('#qdBtn').removeClass('am-btn-default').addClass('am-btn-warning');
          $('#qdBtn').html('<i class="am-icon-check-square-o"></i>已签到');
        }
      },
      error: function(){
        return;
      }
    });

    $('#qdBtn').click(function(e){
      if($(this).hasClass('am-btn-warning')){
        $('#my-alert').modal();
      }else{
        var n=Math.round(Math.random()*1)+1;
        $.ajax({
          type: 'post',
          url: "<%=request.getContextPath()%>/service/addJf.do",
          cache: false,
          data: "jf="+n,
          success: function(data){
            if(true==data.qd){
              var $i=$('<b>').text('+'+n);
              var x=e.pageX,y=e.pageY;
              $i.css({top:y-20,left:x,position:'absolute',color:'#E94F06'});
              $('body').append($i);
              $i.animate({top:y-180,opacity:0,"font-size":'1.4em'},1500,function(){
                $i.remove();
              });
              e.stopPropagation();
              $('#nowScore').html(parseInt($('#nowScore').text())+n);
              $('#qdBtn').removeClass('am-btn-secondary').addClass('am-btn-warning');
              $('#qdBtn').html('<i class="am-icon-check-square-o"></i>已签到');
            }
          },
          error: function(){
            return;
          }
        });

      }
    });
  });
</script>
</body>
</html>
