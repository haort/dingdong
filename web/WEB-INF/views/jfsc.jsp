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
		
			$(document).ready(function() {
			$.ajax({     
		        type: 'post',     
		        url: "<%=request.getContextPath()%>/service/findProducts.do",
		        cache: false,       
		        dataType: 'json',     
		        success: function(data){ 
		        	var products="";   
		            jQuery.each(data, function(i,item){
		            products+="<div class='portfolioTwoItemWrapper'>";
						products+="<a href='<%=request.getContextPath()%>/service/getProduct.do?productId="+item.productId+"&wxId=${wxId}&nowScore="+$('#nowScore').html()+"'";
						products+="class='portfolioTwoItemImageWrapper'>";
						products+="<img src='<%=request.getContextPath()%>/images/"+item.productPic+"' alt='' />";
						products+="</a>";
						products+="<div class='portfolioTwoItemInfoWrapper'>";
						products+=	"<h4 class='portfolioTwoItemTitle'>";
						products+=		item.productName+"<font color='red'>("+item.productScore+")积分</font>";
						products+=	"</h4>";
						products+="</div>";
					products+="</div>";

		            });   
		           
		            $("#products").html(products);
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
			<div class="alertBox alertBoxInfo alertBoxTextBreak">
        	<p class="alertBoxContent">当前积分有<font color="red" id="nowScore"></font>分</p>
        	<a href="" class="alertBoxButton"></a>
        	</div>
			<!-- page wrapper starts -->
			<div class="pageWrapper portfolioTwoPageWrapper">



				<div class="sectionBreak"></div>
				<!-- portfolio wrapper starts -->
				<div class="portfolioTwoWrapper" id="products">
					<!-- portfolio item starts  -->
					<!-- portfolio item ends -->

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

