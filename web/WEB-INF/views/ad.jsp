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
			<div class="pageWrapper portfolioTwoPageWrapper">
			<div class="sectionBreak"></div>
				    <!-- portfolio wrapper starts -->

    <div class="portfolioTwoWrapper"> 
      <!-- portfolio item starts  -->

      <div class="portfolioTwoItemWrapper"> <a href="<%=request.getContextPath()%>/service/getFbNotice.do?wxId=${wxId}" class="portfolioTwoItemImageWrapper"><img src="<%=request.getContextPath()%>/images/fbgg.png" alt=""/></a>

        <div class="portfolioTwoItemInfoWrapper">

          <h4 class="portfolioTwoItemTitle">发布小区公告</h4>

        </div>

      </div>

      <!-- portfolio item ends --> 

      <!-- portfolio item starts  -->

      <div class="portfolioTwoItemWrapper"> <a href="<%=request.getContextPath()%>/service/getNotice.do?wxId=${wxId}" class="portfolioTwoItemImageWrapper"><img src="<%=request.getContextPath()%>/images/gg.png" alt=""/></a>

        <div class="portfolioTwoItemInfoWrapper">

          <h4 class="portfolioTwoItemTitle">查看历史公告</h4>

        </div>

      </div>

      <!-- portfolio item ends --> 

      <!-- portfolio item starts  -->

      <div class="portfolioTwoItemWrapper"> <a href="<%=request.getContextPath()%>/service/getDocontact.do?wxId=${wxId}" class="portfolioTwoItemImageWrapper"><img src="<%=request.getContextPath()%>/images/clfk.png" alt=""/></a>

        <div class="portfolioTwoItemInfoWrapper">

          <h4 class="portfolioTwoItemTitle">处理问题反馈</h4>

        </div>

      </div>

      <!-- portfolio item ends --> 

      <!-- portfolio item starts  -->

      <div class="portfolioTwoItemWrapper"> <a href="<%=request.getContextPath()%>/service/getAdCkcontact.do?wxId=${wxId}" class="portfolioTwoItemImageWrapper"><img src="<%=request.getContextPath()%>/images/ckfk.png" alt=""/></a>

        <div class="portfolioTwoItemInfoWrapper">

          <h4 class="portfolioTwoItemTitle">查看已处理反馈</h4>

        </div>

      </div>

      <!-- portfolio item ends --> 


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

