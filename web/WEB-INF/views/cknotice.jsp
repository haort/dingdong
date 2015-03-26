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
		        url: "/service/findNotices.do?wxId=${wxId}",
		        cache: false,       
		        dataType: 'json',     
		        success: function(data){ 
		        	var notices="";   
		            jQuery.each(data, function(i,item){
		            
		            	notices+="<div class='pageContentWrapper' id='contact"+item.id+"'><h4 class='pageTitle'>"+item.xiaoqu+"物业管理处发布公告</h4>";
		            	notices+="<p>"+item.description+"</p><p> 于"+ item.createTime+"发布</p>";
		            	notices+="</div><div class='textBreak'></div>";
		            });   
		           
		            $("#notices").html(notices);
		        },     
		        error: function(){     
		            return;     
		        }     
		    }); 
		
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
			<div id = "notices"></div>
			
		  	</div>
			<!-- page wrapper ends -->

			<!-- footer wrapper starts -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			<!-- footer wrapper ends -->
		</div>
		<!-- website wrapper ends -->
	</body>
</html>

