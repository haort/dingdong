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
			$.ajax({     
		        type: 'post',     
		        url: "<%=request.getContextPath()%>/service/ifReg.do",
		        cache: false,  
		        data: "wxId=${wxId}",     
		        success: function(data){ 
		        	if("true"==data){
				       alert('您已绑定小区，无需重复绑定！');
				      WeixinJSBridge.invoke('closeWindow',{},function(res){});
		        	}else{
		        		$("#page").show();
		        	}
		        },     
		        error: function(){     
		            return;     
		        }     
		    }); 
				$('#regForm').validate( {
					submitHandler : function(form) {
						var formData = $("#regForm").serialize();
						$.ajax( {
							type : "POST",
							url : "<%=request.getContextPath()%>/service/addUser.do",
							cache : false,
							data : formData,
							success : onSuccess
						});
		
					}
				});
		
				function onSuccess(data, status) {
					 $.msgbox.show({
				        message: '绑定成功！',
				        icon: 'ok',
				        timeOut: 1000
				    });
					$('#regForm')[0].reset();
					 WeixinJSBridge.invoke('closeWindow',{},function(res){
		              });
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
			<div class="pageWrapper contactPageWrapper" id="page" style="display: none">
				<!-- contact form wrapper starts -->
				<div class="contactFormWrapper">
					<!-- contact form starts -->

					<form method="post" class="contactForm" id="regForm">
					<input type="hidden" name="wxId" value="${wxId}" />
						<fieldset>
							<div class="formFieldWrapper">
								<label for="contactEmailField">
									绑定小区（请点击选择）:
								</label>
								<SELECT NAME="xiaoqu">
									<OPTION VALUE="百合园">
										百合园
									</OPTION>
									<OPTION VALUE="金域豪庭">
										金域豪庭
									</OPTION>
									<OPTION VALUE="金宁广场 ">
										金宁广场
									</OPTION>
									<OPTION VALUE="紫晶广场 ">
										紫晶广场
									</OPTION>
									<OPTION VALUE="钻石华府">
										钻石华府
									</OPTION>
									<OPTION VALUE="文博家园">
										文博家园
									</OPTION>
									<OPTION VALUE="汇锦水岸城">
										汇锦水岸城
									</OPTION>
									<OPTION VALUE="莉湖花园">
										莉湖花园
									</OPTION>
									<OPTION VALUE="桥西苑">
										桥西苑
									</OPTION>
									<OPTION VALUE="丽岛新苑">
										丽岛新苑
									</OPTION>
									<OPTION VALUE="骏景园">
										骏景园
									</OPTION>
									<OPTION VALUE="雨庭花园">
										雨庭花园
									</OPTION>
									<OPTION VALUE="璟湖广场">
										璟湖广场
									</OPTION>
								</SELECT>
							</div>
							<div class="formSubmitButtonErrorsWrapper">
								<input type="submit" class="buttonWrapper contactSubmitButton"
									id="submit" value="绑定" data-form-id="regForm" />

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

