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
<!-- Header -->
<header data-am-widget="header" class="am-header am-header-default">
  <h1 class="am-header-title">绑定小区</h1>
</header>

<!--List-->
<div id="widget-list">
  <ul class="am-list m-widget-list">


    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">百合园</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">金域豪庭</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">金宁广场</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">紫晶广场</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">钻石华府</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">文博家园</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">汇锦水岸城</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">莉湖花园</span>
      </a>
    </li>
    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">桥西苑</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">丽岛新苑</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">骏景园</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">雨庭花园</span>
      </a>
    </li>

    <li>
      <a href="#" class="am-margin-left-sm">
        <i class="am-icon-building"></i>
        <span class="widget-name">璟湖广场</span>
      </a>
    </li>
  </ul>
</div>

<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">确认</div>
    <div class="am-modal-bd">
      是否绑定所选小区?
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>

<script>


  function onSuccess(data, status) {
    alert('绑定成功！');
    WeixinJSBridge.invoke('closeWindow',{},function(res){
    });
  }


  $(function() {
    $('ul li').
            on('click', function() {
              $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                  var xiaoqu = $(this.relatedTarget).find('.widget-name').html();
                  $.ajax( {
                    type : 'POST',
                    url : '<%=request.getContextPath()%>/service/addUser2.do',
                    cache : false,
                    data: 'xiaoqu='+xiaoqu,
                    success : onSuccess
                  });

                },
                onCancel: function() {
                }
              });
            });


  });

</script>
</body>
</html>
