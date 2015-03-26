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
			function doContact(id,flag){
			$.ajax({     
		        type: 'post',     
		        url: "<%=request.getContextPath()%>/service/updateContact.do",
		        cache: false,  
		        data: "wxId=${wxId}"+"&id="+id+"&flag="+flag,     
		        success: function(data){ 
		        	if("true"==data){
				        $.msgbox.show({
						        message: '更新成功！',
						        icon: 'ok',
						        timeOut: 1000
						});
						if(flag!="正在处理"){
		        			$("#contact"+id).remove();
		        		}else if(flag=="正在处理"){
		        			$("#flag"+id).remove();
		        		}
		        	}else{
		        		 $.msgbox.show({
						        message: '更新失败！',
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
		        url: "<%=request.getContextPath()%>/service/findContacts.do?wxId=${wxId}",
		        cache: false,       
		        dataType: 'json',     
		        success: function(data){ 
		        	var contact="";   
		            jQuery.each(data, function(i,item){
		            	contact += "<div class='commentWrapper' id='contact"+item.id+"'> <a href='' class='commentAvatar'><img src='<%=request.getContextPath()%>/images/commentAvatarBg.png' alt=''/></a><p class='commentInfoWrapper'>";
		            	contact+="<a href='tel:"+item.phone+"' class=''>"+item.name+"("+item.phone+")"+"</a></p>";
		            	contact+="<div class='clear'></div><div class='comment'><p>"+item.wenti+"</p><p> 于"+ item.createTime+"发布</p>"+"<p style='color:green'>用户地址:"+ item.addr+"</p>";
		            	contact+="<div>";
		            	contact+="<p>";
		            	if(item.flag!="正在处理"){
		            	contact+="<a href='javascript:void(0)' onclick='doContact("+item.id+",\"正在处理\")' class='buttonWrapper buttonGreen' id=flag"+item.id+">正在处理&nbsp&nbsp&nbsp&nbsp&nbsp</a> ";
		            	}
		            	contact+="<a href='javascript:void(0)' onclick='doContact("+item.id+",\"已解决\")' class='buttonWrapper buttonGreen'>已解决&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</a> ";
		            	contact+="<a href='javascript:void(0)' onclick='doContact("+item.id+",\"提交上级部门\")' class='buttonWrapper buttonPink'>提交上级部门</a>";
		            	contact+="</p></div><div class='clear'></div></div>";
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

