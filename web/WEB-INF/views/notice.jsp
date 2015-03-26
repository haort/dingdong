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
		<%@include file="/WEB-INF/views/common/js.jsp"%>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#noticeForm').validate( {
					submitHandler : function(form) {
						var formData = $("#noticeForm").serialize();
						$.ajax( {
							type : "POST",
							url : "<%=request.getContextPath()%>/service/addNotice.do",
							cache : false,
							data : formData,
							dataType: 'json',
							success : onSuccess
						});
		
					}
				});
		
				function onSuccess(data, status) {
				if(data){
					 $.msgbox.show({
					        message: '发布成功！',
					        icon: 'ok',
					        timeOut: 1000
					 });
					  WeixinJSBridge.invoke('closeWindow',{},function(res){
		              });
				}else{
					$.msgbox.show({
					        message: '发布失败，请用管理员账号登陆！',
					        icon: 'ok',
					        timeOut: 1000
					 });
				}
				$('#noticeForm')[0].reset();
				}
		
			});
		</script>
	</head>

	<body>
		<!-- website wrapper starts -->
		<div class="websiteWrapper">
			<!-- header wrapper starts -->
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<!-- header wrapper ends -->

			<!-- page wrapper starts -->
			<div class="pageWrapper contactPageWrapper">
			<div class="sectionBreak"></div>
				<div class="contactFormWrapper">

					<h4 class="contactTitle">
						发布物业公告:
					</h4>

					<!-- contact form starts -->

					<form method="post" class="contactForm" id="noticeForm">
						<input type="hidden" name="wxId" value="${wxId}" />
						<fieldset>
							<div class="formFieldWrapper">
								<label for="contactNameField">
									公告主题:
								</label>
								<input type="text" name="title" value=""
									class="contactField required" id="contactNameField"
									data-placeholder="" />
							</div>
							<div class="formTextareaWrapper">
								<label for="contactMessageTextarea">
									描述:
								</label>
								<textarea name="description" class="contactTextarea required"
									id="contactMessageTextarea" data-placeholder=""></textarea>
							</div>
							<div class="formSubmitButtonErrorsWrapper">
								<input type="submit" class="buttonWrapper contactSubmitButton"
									id="submit" value="提交" data-form-id="noticeForm" />
							</div>
						</fieldset>
					</form>
					<!-- contact form ends -->

				</div>

				<!-- contact form wrapper ends -->



			</div>
			<!-- page wrapper ends -->

			<!-- footer wrapper starts -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			<!-- footer wrapper ends -->
		</div>
		<!-- website wrapper ends -->
	</body>
</html>

