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
          <a href="<%=request.getContextPath()%>/service/getReg2.do">更换小区</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!--menu end-->

<!--content start-->
<div class="am-g am-g-fixed">
  <div class="am-u-sm-11 am-u-sm-centered">
    <ul class="am-comments-list" id="contacts">
    </ul>
  </div>
</div>
<!-- repContact start-->
<div class="am-modal-actions" id="repAlert">
  <div class="am-modal-actions-group">
    <ul class="am-list">
      <li class="am-modal-actions-header">对本次服务评价</li>
      <li>
        <a href="javascript:void(0)" onclick="repContact(this)"><span class="am-icon-heart"></span>非常满意</a>
      </li>
      <li>
        <a href="javascript:void(0)" onclick="repContact(this)"><span class="am-icon-heart"></span>比较满意</a>
      </li>
      <li>
        <a href="javascript:void(0)" onclick="repContact(this)"><span class="am-icon-check"></span>服务一般</a>
      </li>
      <li>
        <a href="javascript:void(0)" onclick="repContact(this)"><span class="am-icon-heartbeat"></span>不太满意</a>
      </li>
    </ul>
  </div>
  <div class="am-modal-actions-group">
    <button class="am-btn am-btn-secondary am-btn-block" data-am-modal-close>取消</button>
  </div>
</div>

<!-- repContact end-->

<!--alert start-->
<div class="am-modal am-modal-alert" tabindex="-1" id="repOkAlert">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">友情提醒</div>
    <div class="am-modal-bd">
      评价成功！
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
  function initRepContact(id){
    $('#repAlert').val(id);
    $('#repAlert').modal();
  }

  function repContact(e){
    var id = $('#repAlert').val();
    var rep = $(e).text();
    $.ajax({
      type: 'post',
      url: "<%=request.getContextPath()%>/service/repContact2.do",
      cache: false,
      data: "id="+id+"&rep="+rep,
      success: function(data){
        if(true==data){
          $('#repOkAlert').modal();
          $('#contact'+id).remove();
          $('#repAlert').modal('close');
        }
      },
      error: function(){
        return;
      }
    });

    $('#repAlert').val("");
  }


  $(function() {

    $.ajax({
      type: 'post',
      url: "<%=request.getContextPath()%>/service/findContactsByOwner2.do",
      cache: false,
      dataType: 'json',
      success: function(data){
        var contact="";
        jQuery.each(data.contacts, function(i,item){
          contact +='<li class="am-comment" id="contact'+item.id+'">';
          contact +='<a href="#">';
          contact +='<img src="<%=request.getContextPath()%>/images/commentAvatarBg.png" alt="" class="am-comment-avatar" width="48" height="48">';
          contact +='</a>';
          contact +='<div class="am-comment-main">';
          contact +='<header class="am-comment-hd">';
          contact +='<div class="am-comment-meta">';
          contact +='<a href="#" class="am-comment-author">'+item.name+'</a>('+item.createTime+')';
          contact +='</div>';
          contact +='</header>';
          contact +='<div class="am-comment-bd">';
          contact +='<p>'+item.wenti+'</p>';
          contact +=' </div>';
          contact +=' <footer class="am-comment-footer">';
          contact +='<div class="am-comment-actions">';
          if(item.flag=='未处理'){
            contact +='<span class="am-badge am-radius">'+item.flag+'</span>';
          }else if(item.flag=='正在处理'){
            contact +='<span class="am-badge am-radius am-badge-secondary">'+item.flag+'</span>';
          }else if(item.flag=='已解决'){
            contact +='<span class="am-badge am-radius am-badge-success">'+item.flag+'</span>';
          }
          if(item.flag =='已解决'){
            contact +='<a href="javascript:void(0)" onclick="initRepContact('+item.id+')">';
            contact +='<i class="am-icon-comment-o"></i>';
            contact +='评价';
            contact +='</a>';
          }
          contact +='</footer>';
          contact +='</div>';
          contact +='</li>';
        });
        $("#contacts").html(contact);
      },
      error: function(){
        return;
      }
    });

  });

</script>
</body>
</html>
