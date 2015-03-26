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
		 function repContact(id,rep){
			$.ajax({     
		        type: 'post',     
		        url: "<%=request.getContextPath()%>/service/repContact.do",
		        cache: false,  
		        data: "wxId=${wxId}"+"&id="+id+"&rep="+rep,     
		        success: function(data){ 
		        	if("true"==data){
				        $.msgbox.show({
						        message: '评价成功！',
						        icon: 'ok',
						        timeOut: 1000
						});
		        		$("#contact"+id).remove();
		        	}else{
		        		 $.msgbox.show({
						        message: '评价失败！',
						        icon: 'ok',
						        timeOut: 1000
						});
		        	}
		        },     
		        error: function(){     
		            return;     
		        }     
		    }); 
			}
			$(document).ready(function() {
			$.ajax({     
		        type: 'post',     
		        url: "<%=request.getContextPath()%>/service/findAdContactsByOwner.do?wxId=${wxId}",
		        cache: false,       
		        dataType: 'json',     
		        success: function(data){ 
		        	var contact="";   
		            jQuery.each(data.contacts, function(i,item){
		            	contact += "<div class='commentWrapper' id='contact"+item.id+"'> <a href='' class='commentAvatar'><img src='<%=request.getContextPath() %>/images/commentAvatarBg.png' alt=''/></a><p class='commentInfoWrapper'>";
		            	contact+="<a href='tel:"+item.phone+"' class=''>"+item.name+"("+item.phone+")"+"</a></p>";
		            	contact+="<div class='clear'></div><div class='comment'><p>"+item.wenti+"</p><p> 于"+ item.createTime+"发布</p>";
		            	contact+="<span style='color:Red;font-weight:bold'>"+item.flag+"</span>";
						if (data.auth!=null&&data.auth=='admin1'){
				          contact+="<p>";
				           contact+="<span style='color:green;font-weight:bold'>用户反馈："+item.rep+"</span>";
				          contact+="</p>";
			          }
			          contact+="</div>";
		            });   
		            $("#contacts").html(contact);
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
			<div class="pageWrapper">
				<div class="sectionBreak"></div>
				<!-- comments section wrapper starts -->
				<div class="commentsSectionWrapper">
					<!-- comments wrapper starts -->
					<div class="commentsWrapper" id="contacts">
					</div>
					<!-- coments wrapper ends -->
				</div>
				<!-- comments section wrapper ends -->
			</div>
			<!-- page wrapper ends -->

			<!-- footer wrapper starts -->
			<%@include file="/WEB-INF/views/common/footer.jsp"%>
			<!-- footer wrapper ends -->
		</div>
		<!-- website wrapper ends -->
	</body>
</html>

