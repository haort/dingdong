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
		        url: "<%=request.getContextPath()%>/service/findDc.do",
		        cache: false,  
		        data: "wxId=${wxId}",     
		        success: function(data){ 
		        	if("true"==data){
				       alert('您已参加满意度调查，再次感谢您的参与！');
				      WeixinJSBridge.invoke('closeWindow',{},function(res){});
		        	}else{
		        		$("#dcDiv").show();
		        	}
		        },     
		        error: function(){     
		            return;     
		        }     
		    }); 
				$('#dcForm').validate( {
					submitHandler : function(form) {
						var formData = $("#dcForm").serialize();
						$.ajax( {
							type : "POST",
							url : "<%=request.getContextPath()%>/service/addDc.do",
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
					$('#dcForm')[0].reset();
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
				<div id="dcDiv" class="pageContentWrapper" style="display: none">
					<h3 class="pageTitle">
						南京太湖世家物业管理有限公司业主（住户）满意度调查表
					</h3>
					<p>
						尊敬的业主（住户）：
					</p>

					<p>
						您好！感谢您平时对我们工作的大力支持！为进一步完善我们的工作内容，提高我们的管理水平，为您提供更加优质的服务，我们诚挚邀请您参与本次满意度调查并提出宝贵意见，我们将认真参考您反馈的问题并努力完善！
					</p>

					<p>
						请您抽出一点宝贵的时间，填写以下表格,并提交，我们将送上精美小礼品一份
					</p>

					<div class="textBreakBoth"></div>
					<!-- contact form wrapper starts -->
					<div class="contactFormWrapper">
						<form method="post" class="contactForm" id="dcForm">
						<input type="hidden" name="wxId"id="wxId" value="${wxId}">
							<fieldset>
								<div>
									<h4 class="blockTitle">
										1、环境卫生：
									</h4>
									<p>
										<input type="radio" name="q1" value="非常满意" id="q1"
											data-placeholder="" class="required" />
										非常满意
										<input type="radio" name="q1" value="比较满意" id="q1"
											data-placeholder="" class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q1" value="服务一般" id="q1"
											data-placeholder="" class="required" />
										服务一般
										<input type="radio" name="q1" value="不太满意" id="q1"
											data-placeholder="" class="required" />
										不太满意
									</P>
								</div>
								<div class="textBreakBoth"></div>
								<div>
									<h4 class="blockTitle">
										2、绿化管理：
									</h4>
									<p>
										<input type="radio" name="q2" value="非常满意" id="q2"
											data-placeholder="" class="required" />
										非常满意
										<input type="radio" name="q2" value="比较满意" id="q2"
											data-placeholder="" class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q2" value="服务一般" id="q2"
											data-placeholder="" class="required" />
										服务一般
										<input type="radio" name="q2" value="不太满意" id="q2"
											data-placeholder="" class="required" />
										不太满意
									</P>
								</div>
								<div class="textBreakBoth"></div>
								<div>
									<h4 class="blockTitle">
										3、服务态度：
									</h4>
									<p>
										<input type="radio" name="q3" value="非常满意" id="q3"
											data-placeholder="" class="required" />
										非常满意
										<input type="radio" name="q3" value="比较满意" id="q3"
											data-placeholder="" class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q3" value="服务一般" id="q3"
											data-placeholder="" class="required" />
										服务一般
										<input type="radio" name="q3" value="不太满意" id="q3"
											data-placeholder="" class="required" />
										不太满意
									</P>
								</div>
								<div class="textBreakBoth"></div>
								<div>
									<h4 class="blockTitle">
										4、投诉处理：
									</h4>
									<p>
										<input type="radio" name="q4" value="非常满意" id="q4"
											data-placeholder="" class="required" />
										非常满意
										<input type="radio" name="q4" value="比较满意" id="q4"
											data-placeholder="" class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q4" value="服务一般" id="q4"
											data-placeholder="" class="required" />
										服务一般
										<input type="radio" name="q4" value="不太满意" id="q4"
											data-placeholder="" class="required" />
										不太满意
									</P>
								</div>
								<div class="textBreakBoth"></div>
								<div>
									<h4 class="blockTitle">
										5、安保防范：
									</h4>
									<p>
										<input type="radio" name="q5" value="非常满意" id="q5"
											data-placeholder="" class="required" />
										非常满意
										<input type="radio" name="q5" value="比较满意" id="q5"
											data-placeholder="" class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q5" value="服务一般" id="q5"
											data-placeholder="" class="required" />
										服务一般
										<input type="radio" name="q5" value="不太满意" id="q5"
											data-placeholder="" class="required" />
										不太满意
									</P>
								</div>
								<div class="textBreakBoth"></div>
								<div>
									<h4 class="blockTitle">
										6、车辆管理：
									</h4>
									<p>
										<input type="radio" name="q6" value="非常满意" id="q6"
											data-placeholder="" class="required" />
										非常满意
										<input type="radio" name="q6" value="比较满意" id="q6"
											data-placeholder="" class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q6" value="服务一般" id="q6"
											data-placeholder="" class="required" />
										服务一般
										<input type="radio" name="q6" value="不太满意" id="q6"
											data-placeholder="" class="required" />
										不太满意
									</P>

								</div>
								<div class="textBreakBoth"></div>
								<div>
									<h4 class="blockTitle">
										7、有偿服务：
									</h4>
									<p>
										<input type="radio" name="q7" value="非常满意" id="q7"
											class="required" />
										非常满意
										<input type="radio" name="q7" value="比较满意" id="q7"
											class="required" />
										比较满意
									</P>
									<p>
										<input type="radio" name="q7" value="服务一般" id="q7"
											class="required" />
										服务一般
										<input type="radio" name="q7" value="不太满意" id="q7"
											class="required" />
										不太满意
									</P>
								</div>
								<div class="textBreakBoth"></div>
								<div class="formTextareaWrapper">
									<h4 class="blockTitle">
										8、其他建议:
									</h4>
									<textarea name="otherq" class="contactTextarea" id="otherq"
										data-placeholder=""></textarea>
								</div>
								<input type="submit" class="buttonWrapper contactSubmitButton" id="submit" value="提交" data-form-id="contactForm"/>
							</fieldset>
						</form>
						<!-- contact form ends -->
					</div>
					<!-- contact form wrapper ends -->
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

