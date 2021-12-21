<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<title>許願池</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<c:url value='/wishpool/css/main.css' />" />
</head>
<script type="text/javascript">
function jump(id){
	window.location.href = "/springapp/view/" + id
};
</script>
<style>
.tupian{
	height: 320px; /*can be anything*/
    width: 320px; /*can be anything*/
    display: block; 
    position: relative;
    margin:0 auto
 } 
/* .col-4:hover .tupian1{  */
/* 	background-color: #FFBD9D  */
/* }  */
</style>
<body class="homepage is-preload">
    <div id="page-wrapper">
			<!-- Header -->
				<section id="header">
					<div class="container">
					<!-- Logo -->
							<h1 id="logo"><a href="wishindex">Make a Wish</a></h1>
						<!-- Nav -->
							<nav id="nav" style="position: absolute;">
								<ul>
									<li><a class="icon solid fa-home" href="<c:url value='/' />"><span>回首頁</span></a></li>
<%-- 									<li><a class="icon solid fa-cog" href="<c:url value='/wishindex' />"><span>Left Sidebar</span></a></li> --%>
									<li><a class="icon solid fa-retweet" href="<c:url value='/allsearchByMemberCRUD' />"><span>查看許願</span></a></li>
								</ul>
							</nav>			
					</div>
				</section>

			<!-- Features -->
				<section id="features">
					<div class="container">
						<div class="row aln-center">
						<!-- Nav -->
<!-- 							<nav id="nav" style="top: 0"> -->
							<div class="col-12">
								<h2  style="text-align:center;margin:0 0"><label>分類搜尋</label></h2>
								<ul class="actions">
									<li><a href="<c:url value="/searchbysort/live" />">生活、居家</a></li>
									<li><a href="<c:url value="/searchbysort/sport" />">運動、健身</a></li>
									<li><a href="<c:url value="/searchbysort/food" />">名產、食品</a></li>
									<li><a href="<c:url value="/searchbysort/careproducts" />">保養、彩妝</a></li>
									<li><a href="<c:url value="/searchbysort/accessories" />">飾品、配件</a></li>
									<li><a href="<c:url value="/searchbysort/books" />">書籍、文創</a></li>
									<li><a href="<c:url value="/searchbysort/game" />">遊戲、電玩</a></li>
								</ul>
							</div>	
<!-- 							</nav> -->
							<c:forEach var='pool' items="${wishpool}">							
								<div class="col-4 col-6-medium col-12-small" >
									<!-- Feature -->
<%-- 										<section onclick="jump('${pool.wishpoolId}');"> --%>
										<section class="tupian1">
											<div class="tupian">
											<a href="<c:url value="/view/${pool.wishpoolId}" />" class="image featured"><img src="<c:url value='/getPicture/${pool.wishpoolId}' />" /></a>
											</div>
											<header>
												<h3>${pool.title}</h3>
											</header>
											<p>${pool.content}</p><br>
										</section>
								</div>							
							</c:forEach>						
						</div>
					</div>
				</section>
		</div>
		<!-- Scripts -->
			<script src="/wishpool/js/jquery.min.js"></script>
			<script src="/wishpool/js/jquery.dropotron.min.js"></script>
			<script src="/wishpool/js/browser.min.js"></script>
			<script src="/wishpool/js/breakpoints.min.js"></script>
			<script src="/wishpool/js/util.js"></script>
			<script src="/wishpool/js/main.js"></script>
</body>
</html>