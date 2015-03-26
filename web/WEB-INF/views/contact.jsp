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
				$('#contactForm').validate( {
					submitHandler : function(form) {
						var formData = $("#contactForm").serialize();
						$.ajax( {
							type : "POST",
							url : "<%=request.getContextPath()%>/service/addContact.do",
							cache : false,
							data : formData,
							success : onSuccess
						});
		
					}
				});
		
				function onSuccess(data, status) {
				 $.msgbox.show({
				        message: '提交成功！',
				        icon: 'ok',
				        timeOut: 1000
				    });
					$('#contactForm')[0].reset();
					 WeixinJSBridge.invoke('closeWindow',{},function(res){});
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
				<!-- contact form wrapper starts -->
				<div class="contactFormWrapper">
					<h4 class="contactTitle">
						问题反馈（需要注册）:
					</h4>
					<!-- contact form starts -->
					<form method="post" class="contactForm" id="contactForm">
					<input type="hidden" name="wxId"id="wxId" value="${wxId}">
						<fieldset>
							<div class="formFieldWrapper">
								<label for="contactNameField">
									用户姓名:
								</label>
								<input type="text" name="name" value=""
									class="contactField required" id="contactNameField"
									data-placeholder="" />
							</div>
							<div class="formFieldWrapper">
								<label for="contactEmailField">
									联系号码:
								</label>
								<input type="text" name="phone" value=""
									class="contactField required" id="contactEmailField"
									data-placeholder="" />
							</div>
							<div class="formFieldWrapper">
								<label for="contactEmailField">
									用户地址:
								</label>
								<input type="text" name="addr" value=""
									class="contactField required" id="contactEmailField"
									data-placeholder="" />
							</div>
							<div class="formTextareaWrapper">
								<label for="contactMessageTextarea">
									问题说明:
								</label>
								<textarea name="wenti" class="contactTextarea required"
									id="contactMessageTextarea" data-placeholder=""></textarea>
							</div>
							<div class="formSubmitButtonErrorsWrapper">
								<input type="submit" class="buttonWrapper contactSubmitButton"
									id="submit" value="提交" data-form-id="contactForm" />
							</div>
							<input type="hidden" name="formIsReady" value="true"
								id="formIsReady" />
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

