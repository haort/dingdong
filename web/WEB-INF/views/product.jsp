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
		$("#pProduct").click(function(){
		  if($("#nowScore").html()>=${productScore}){
		 	 $("#pProduct").colorbox({inline:true, width:"80%"});
		  }else{
		  	 alert("您当前积分不够，每日签到即可获得积分！");
		  }
		});
		function getJf(){
			$.ajax({     
				type: 'post',     
				url: "<%=request.getContextPath()%>/service/getJf.do",
				cache: false,  
				data: "wxId=${wxId}",     
				success: function(data){ 
					$("#nowScore").html(data);
				}   
			}); 
		}
		getJf();
		$('#contactForm').validate( {
					submitHandler : function(form) {
						var formData = $("#contactForm").serialize();
						$.ajax( {
							type : "POST",
							url : "<%=request.getContextPath()%>/service/exchangeProduct.do",
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
					$("#pProduct").colorbox.close();
					getJf();
					$("#productNum").html($("#productNum").html()-1);
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
			<div class="pageWrapper portfolioTwoPageWrapper">
			<div class="sectionBreak"></div>
				<div class="singleProjectImageWrapper">
					<img src="<%=request.getContextPath()%>/images/${productPic}"
						class="singleProjectImage" alt="" />
				</div>
				<!-- page content wrapper starts -->
				<div class="pageContentWrapper singleProjectContentWrapper">
					<h3 class="pageTitle">
						${productName}，剩余<font color="red" id="productNum">${num}</font>个
					</h3>
					<p>
						${productDes}
					</p>
					<p>
						兑换需要
						<font color="red">${productScore}</font>积分,您当前积分为<font color="red" id="nowScore"></font>分
					</p>
					<div class="pageBreak"></div>
				</div>
				<div class="pageBreak"></div>
				<div class="singleProjectItemButtonsWrapper">
					<p>
						<a id="pProduct" href="#inline_content"
							class="buttonWrapper buttonOrange">兑换</a>
					</p>
					<p>
					</p>
				</div>
				
		<div style='display:none'>
			<div id='inline_content' style='padding:10px; background:#fff;'>
			<h4 class="contactTitle">
						请准确填写以便登记发放:
			</h4>
			<form method="post" class="contactForm" id="contactForm">
					<input type="hidden" name="wxId"id="wxId" value="${wxId}">
					<input type="hidden" name="productScore"id="productScore" value="${productScore}">
					<input type="hidden" name="productId"id="productId" value="${productId}">
						<fieldset>
							<div class="formFieldWrapper">
								<label for="contactNameField">
									姓名:
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
									地址:
								</label>
								<input type="text" name="addr" value=""
									class="contactField required" id="contactEmailField"
									data-placeholder="" />
							</div>
							<div class="formSubmitButtonErrorsWrapper">
								<input type="submit" class="buttonWrapper contactSubmitButton"
									id="submit" value="提交" data-form-id="contactForm" />
							</div>
						</fieldset>
					</form>
			</div>
		</div>
				
			</div>
			<!-- page wrapper ends -->

			<!-- footer wrapper starts -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			<!-- footer wrapper ends -->
		</div>
		<!-- website wrapper ends -->
	</body>
</html>

