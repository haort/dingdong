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
			$('#mainSlider').nivoSlider({controlNav: false,prevText: '',nextText: '' });
			});
	</script>
	</head>

	<body>
		<!-- website wrapper starts -->
		<div class="websiteWrapper">
			<!-- header wrapper starts -->
			<%@include file="/WEB-INF/views/common/header.jsp"%>
			<!-- header wrapper ends -->
			<div class="sliderOuterWrapper">
				<div class="sliderWrapper">
					<div class="mainSlider" id="mainSlider">
						<a href=""><img
								src="<%=request.getContextPath()%>/images/zjgc.jpg" alt="" /> </a>
						<a href=""><img
								src="<%=request.getContextPath()%>/images/jngc.jpg" alt="" /> </a>
						<a href=""><img
								src="<%=request.getContextPath()%>/images/bhy.jpg" alt="" /> </a>
						<a href=""><img
								src="<%=request.getContextPath()%>/images/hjsac.jpg" alt="" />
						</a>
						<a href=""><img
								src="<%=request.getContextPath()%>/images/jyht.jpg" alt="" /> </a>
						<a href=""><img
								src="<%=request.getContextPath()%>/images/wbjy.jpg" alt="" /> </a>
						<a href=""><img
								src="<%=request.getContextPath()%>/images/zshf.jpg" alt="" /> </a>
					</div>
				</div>
			</div>
			<div class="pageBreak headerBreak"></div>
			<!-- page wrapper starts -->
			<div class="pageWrapper homePageWrapper">
				<!-- home search wrapper ends -->
				<div class="sectionBreak"></div>
				<!-- testimonials wrapper starts -->
				<div class="testimonialsWrapper">
					<!-- testimonial wrapper starts -->
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/zjgc.jpg" alt="" /> </a>
						<p class="testimonialText">
							紫晶广场位于六合区雄州镇专诸巷12号。由南京东泰房地产开发有限公司开发。小区绿化率60%以上，容积率为2.7。交通线路为汉六线和中六线。
							<span class="testimonialAuthor">- 紫晶广场</span>
						</p>
					</div>
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/jngc.jpg" alt="" /> </a>
						<p class="testimonialText">
							金宁广场是由南京太湖世家房地产有限公司开发、建设的综合性商贸中心，地处长江路以南、龙津路以西、板门口以东、滁河以北的4，8号地块。
							金宁广场位于六合区中心商业区，地块东侧龙津路为六合区的南北大道，城市中轴线，北侧长江路为六合最繁华的商业街，南侧的河滨大道为沿河景观大道，整个地块交通便利，人流密集，地理位置极佳，具有不可替代的唯一性。金宁广场以改善六合区中心环境，提升城市品位，提高商业中心当此为宗旨实施整体开发。以提供一站式为目的，建设集商业、精品住宅、休闲、娱乐、餐饮、酒店为一体的综合性商贸中心区域。
							<span class="testimonialAuthor">- 金宁广场</span>
						</p>
					</div>
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/bhy.jpg" alt="" /> </a>
						<p class="testimonialText">
							小区地址： 园林东路45号,物业类型： 普通住宅,开发商： 华润置地（北京）股份有限公司,物业费：多层：0.6元/平方米,别墅：0.9元/平米，总户数：
							668户。
							<span class="testimonialAuthor">- 百合园</span>
						</p>
					</div>
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/jyht.jpg" alt="" /> </a>
						<p class="testimonialText">
							"金域豪庭"位于南京市六合区园林东路99号，东至龙海—新加坡花园城，西至秀林水苑小区，南至园林东路，北至八百河。小区占地面积约36562平方米，总建筑面积约42270平方米，容积率为1.16，绿地率为30%，小区共20幢楼，其中18幢联排别墅，135户，约29500平方米，2幢小高层，120户，约12000平方米，商业房500平方米，会所270平方米。
							<span class="testimonialAuthor">- 金域豪庭</span>
						</p>
					</div>
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/zshf.jpg" alt="" /> </a>
						<p class="testimonialText">
							钻石华府位于南京市六合区雄州镇江北大道以西、龙池路以北。建设用地面积约；4375㎡，总建筑面积约:100848.28㎡,地上建筑面积:87494.72㎡,其中:住宅建筑面积:79506.72㎡,高层住宅建筑面积:49265.02㎡,小高层住宅建筑面积:14080.7㎡,多层住宅建筑面积:16161㎡。商铺建筑面积:7538.2㎡,社区物管用房配套建筑面积:450㎡。地下与半地下建筑面积:13353.36㎡,其中地下汽车库:7083.48㎡,半地下汽车库:969㎡,半地下自行车库:5300.88㎡,容积率为2.0,建筑密度:21.4%,住宅总户数:932户。建成后绿地率:35%,小区建成后将由专业的物业管理公司负责小区的物业管理工作,让您在安心居住的同时能享受到高品质的服务而倍感称心。
							<span class="testimonialAuthor">- 钻石华府</span>
						</p>
					</div>
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/wbjy.jpg" alt="" /> </a>
						<p class="testimonialText">
							文博家园位于南京市六合区南门中心，，雄州西路以北，龙池街以南，朝天街以西。六合实验小学、励志中学新校址、交通职业学校、教育培训中心学校环绕周边。建设用地面积约39411㎡，总建筑面积约:73027㎡,地上建筑面积:67347㎡,其中:多层住宅建筑面积:32163.6㎡,低密度住宅建筑面积:8372.18㎡,小高层住宅建筑面积:22104.22㎡，商铺建筑面积:3904㎡,社区物管用房配套建筑面积:200㎡。地上与地下车库建筑面积:6483㎡,其中地下汽车库:5680㎡,地上汽车库:803㎡,容积率为1.7,建筑密度:33%,住宅总户数:668户。建成后绿化率:30%,小区建成后将由专业的物业管理公司负责小区的物业管理工作,让您在安心居住的同时能享受到高品质的服务而倍感称心。
							<span class="testimonialAuthor">- 文博家园</span>
						</p>
					</div>
					<div class="testimonialWrapper">
						<a href="#" class="testimonialImageWrapper"><img
								class="testimonialImage" src="<%=request.getContextPath()%>/images/hjsac.jpg" alt="" /> </a>
						<p class="testimonialText">
							汇锦水岸城位于六合区南门，东临龙津路，西临朝天街，南临双客路，北靠河滨大道。整个地块在成熟商圈的核心辐射区域范围内，有着先天的地理与人文优势，既拥有繁华的商业设施、便捷的交通优势和完备的生活配套，又独享闹中取静的幽雅环境。苏果超市、菜场、银行、六合人民医院、实验小学、励志中学等如众星捧月，生活便利、学区优良。
							汇锦水岸城将建成六合区主城内集居住、商业、为一体的高档建筑群。项目总占地69706平方米，本案总建筑面积约232406.8平方米。整个项目共21幢楼，9幢多层、8幢高层、4幢独立商业。小区规划总户数1807户，其中隹宅1535户，公寓272户。面积从45平米－206平米都有小区规划共1269个停车位，其中地面停车213个，地下停车库1056个。
							<span class="testimonialAuthor">- 汇锦水岸城</span>
						</p>
					</div>
					<!-- testimonial wrapper ends -->
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

