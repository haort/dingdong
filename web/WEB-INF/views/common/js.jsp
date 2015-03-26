<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/effects.jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.nivo-slider.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.colorbox.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/custom.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.validate.messages_cn.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery.validate.ex.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/contact.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/msgbox.js"></script>

<!-- JavaScript files start -->
<script type="text/javascript">

	$(document).ready(
			function() {
				document.addEventListener('WeixinJSBridgeReady',
						function onBridgeReady() {
							WeixinJSBridge.call('hideOptionMenu');
						});

			})
</script>
<!-- JavaScript files end -->