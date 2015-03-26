<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>太湖世家物业</title>
		<!-- meta tags start -->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
		<!-- meta tags end -->
		<%@include file="/WEB-INF/views/common/css.jsp"%>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/effects.jquery-ui.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.nivo-slider.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.colorbox.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/custom.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.validate.messages_cn.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.validate.ex.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/contact.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/msgbox.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				WeixinJSBridge.invoke('closeWindow',{},function(res){});
			});
		</script>
	</head>

	<body>
		<!-- website wrapper starts -->
		<div class="websiteWrapper">
			<!-- header wrapper starts -->
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<!-- header wrapper ends -->

			<!-- footer wrapper starts -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			<!-- footer wrapper ends -->
		</div>
		<!-- website wrapper ends -->
	</body>
</html>

