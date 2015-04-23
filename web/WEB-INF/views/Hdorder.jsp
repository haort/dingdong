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
    <a href="#title-link">照片进度</a>
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
    <ul class="am-list" id="hdList">

    </ul>
  </div>
</div>
<!--list end-->

<!--content end-->

<!-- Navbar start-->
<%@include file="common/hdnavbar.jsp"%>
<!-- Navbar end-->

<script>
  $(function() {
    $.ajax({
      type: 'post',
      url: '<%=request.getContextPath()%>/service/findHdorders.do',
      cache: false,
      dataType: 'json',
      success: function(data){
        var hdList="";
        jQuery.each(data, function(i,item){
          hdList+='<li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-up">';
          hdList+='<div class="am-u-sm-12 am-list-thumb">';
          hdList+='<a href="#">';
          hdList+='<img src="http://lhdx-hd.stor.sinaapp.com/'+item.image+'"/>';
          hdList+='</a>';
          hdList+='</div>';
          hdList+='<div class="am-list-main">';
          hdList+='<h3 class="am-list-item-hd">';
          hdList+='<a href="#">我的萌照</a>';
          hdList+='</h3>';
          hdList+='<div class="am-list-item-text-3line">';
          if(item.state=="hdSuccess"){
            hdList+='<p><span class="am-badge am-radius am-badge-warning" id="hdUpdate">照片已经提交</span></p>';
            hdList+='<p><span class="am-badge am-radius am-badge-warning" id="hdPrinting">正在排队打印</span></p>';
            hdList+='<p><span class="am-badge am-radius am-badge-warning" id="hdSuccess">请至物业领取</span></p>';
          }else if(item.state=="hdPrinting"){
            hdList+='<p><span class="am-badge am-radius am-badge-warning" id="hdUpdate">照片已经提交</span></p>';
            hdList+='<p><span class="am-badge am-radius am-badge-warning" id="hdPrinting">正在排队打印</span></p>';
            hdList+='<p><span class="am-badge am-radius" id="hdSuccess">请至物业领取</span></p>';
          }else if(item.state=="hdUpdate"){
            hdList+='<p><span class="am-badge am-radius am-badge-warning" id="hdUpdate">照片已经提交</span></p>';
            hdList+='<p><span class="am-badge am-radius" id="hdPrinting">正在排队打印</span></p>';
            hdList+='<p><span class="am-badge am-radius" id="hdSuccess">请至物业领取</span></p>';
          }

          hdList+='</div>';
          hdList+='</div>';
          hdList+='</li>';
        });
        $('#hdList').html(hdList);
      },
      error: function(){
        return;
      }
    });
  });
</script>
</body>
</html>
