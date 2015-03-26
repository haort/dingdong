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

	</head>

	<body>
		<!-- website wrapper starts -->
		<div class="websiteWrapper">
			<!-- header wrapper starts -->
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<!-- header wrapper ends -->

			<!-- page wrapper starts -->
			<div class="pageWrapper portfolioOnePageWrapper">

				<!-- portfolio wrapper starts -->

				<div class="portfolioOneWrapper">

					<!-- portfolio item starts  -->

						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								1、便捷服务
							</h4>

							<p>
								便捷服务有两项功能：“天气查询”，“快递查询”，点解相关菜单进入
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/bj1.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/bj2.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/bj3.PNG" alt="" />
						</a>
					</div>

					<div class="portfolioOneItemWrapper">

						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								2、我的物业
							</h4>

							<p>
								我的物业有三项功能：“最新公告”，“历史公告”和“物业简介”，点解相关菜单进入
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/wy1.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								最新公告
							</h4>

							<p>
								显示最新物业公告
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/wy2.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								历史公告
							</h4>

							<p>
								显示历史公告
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/wy3.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/wy4.PNG" alt="" />
						</a>
						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								物业简介
							</h4>

							<p>
								显示物业小区简介
							</p>

						</div>
					</div>

					<div class="portfolioOneItemWrapper">

						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								3、问题反馈
							</h4>

							<p>
								我的物业有两项功能：“问题反馈”和“查看反馈”，点解相关菜单进入
							</p>

						</div>
						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								问题反馈
							</h4>

							<p>
								点击问题反馈，弹出反馈页面，点击进入，填写详细信息并提交
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/wt1.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/wt2.PNG" alt="" />
						</a>
					</div>

					<div class="portfolioOneItemWrapper">

						<div class="portfolioOneItemInfoWrapper">

							<h4 class="portfolioOneItemTitle">
								4、查看反馈
							</h4>

							<p>
								点击“查看反馈”，弹出相关页面，点解相关菜单进入
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/fk1.PNG" alt="" />
						</a>
						<div class="portfolioOneItemInfoWrapper">

							<p>
								物业将及时联系您处理问题，问题未解决时，可以看到状态为“正在处理中”
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/fk2.PNG" alt="" />
						</a>
						<div class="textBreak"></div>
						<div class="portfolioOneItemInfoWrapper">

							<p>
								问题处理完，请点击相关评价
							</p>

						</div>
						<a href="#" class="portfolioOneItemImageWrapper"><img
								src="<%=request.getContextPath()%>/images/fk3.PNG" alt="" />
						</a>
					</div>

				</div>
				<!-- portfolio wrapper ends -->

			</div>
			<!-- page wrapper ends -->

			<!-- footer wrapper starts -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			<!-- footer wrapper ends -->
		</div>
		<!-- website wrapper ends -->
	</body>
</html>

