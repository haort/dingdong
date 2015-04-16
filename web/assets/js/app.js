(function($) {
  'use strict';

  $(function() {
    var $fullText = $('.admin-fullText');
    $('#admin-fullscreen').on('click', function() {
      $.AMUI.fullscreen.toggle();
    });

    $(document).on($.AMUI.fullscreen.raw.fullscreenchange, function() {
      $.AMUI.fullscreen.isFullscreen ? $fullText.text('关闭全屏') : $fullText.text('开启全屏');
    });

    jQuery.validator.addMethod('mRequired', function(value,element) {
      $(element).parent('.am-form-group').find('.am-alert').hide();
      if(value == null||value==""){
        var $group = $(element).parent();
        var $alert = $group.find('.am-alert');
        // 使用自定义的提示信息 或 插件内置的提示信息
        var msg = $(element).data('validationMessage')||'请填写相关信息';

        if (!$alert.length) {
          $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
              appendTo($group);
        }

        $alert.html(msg).show();
        return false;
      }else{
        return true ;
      }
    }, "");

    jQuery.validator.addMethod('phoneRequird', function(value,element) {
      $(element).parent('.am-form-group').find('.am-alert').hide();
      if(value == null||value==""){
        var $group = $(element).parent();
        var $alert = $group.find('.am-alert');
        // 使用自定义的提示信息 或 插件内置的提示信息
        var msg = $(element).data('validationMessage')||'请填写相关信息';

        if (!$alert.length) {
          $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
              appendTo($group);
        }

        $alert.html(msg).show();
        return false;
      }else if(value.length != 11){
        var $group = $(element).parent();
        var $alert = $group.find('.am-alert');
        // 使用自定义的提示信息 或 插件内置的提示信息
        var msg = '请填写11位手机号码';

        if (!$alert.length) {
          $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
              appendTo($group);
        }

        $alert.html(msg).show();
        return false;
      }else {
        return true;
      }
    }, "");

  });
})(jQuery);
