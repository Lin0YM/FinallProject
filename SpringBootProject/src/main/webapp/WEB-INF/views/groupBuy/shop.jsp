<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>shop</title> -->
<!-- </head> -->
<!-- <body> -->
<!-- 	shop -->
<!-- 	<div> -->
<%-- 		<a href="<c:url value='/shopMain' />">回廠商管理頁面</a> --%>
<!-- 	</div> -->
<!-- 	<div> -->
<%-- 		<a href="<c:url value='/logOut' />">登出</a><br> --%>
<!-- 	</div> -->

<!-- 	<div> -->
<!-- 		<table> -->
<!-- 			<tr> -->
<!-- 				<th> -->
<!-- 					<p>shop</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>groupId</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>groupName</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>groupShopName</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>groupArea</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>promoter</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>publicOrNot</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p>soldStatus</p> -->
<!-- 				</th> -->
<!-- 				<th> -->
<!-- 					<p></p> -->
<!-- 				</th> -->

<!-- 			</tr> -->
<%-- 			<c:forEach items='${adminFindAll}' var='afa'> --%>
<!-- 				<tr> -->
<!-- 					<td><img -->
<%-- 						src='${pageContext.request.contextPath}/images/${afa.groupShopName}.jpg' --%>
<!-- 						width="100"></td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.groupId}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.groupName}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.groupShopName}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.groupArea}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.promoter}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.publiconoot}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 						<p>${afa.soldStatus}</p> --%>
<!-- 					</td> -->
<!-- 					<td> -->
<%-- 												<a href="<c:url value='/adminUpdate/${afa.groupId}'/>">修改</a> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${afa.soldStatus == 'undone'}"> --%>
<%-- 								<a href="<c:url value='/shopUpdate?groupId=${afa.groupId}'/>">修改</a> --%>
<!-- 								<a -->
<%-- 									href="<c:url value='/shopCancel?groupId=${afa.groupId}&groupShopName=${afa.groupShopName}'/>">取消</a> --%>
<%-- 							</c:when> --%>
<%-- 						</c:choose> 						<a href="<c:url value='/adminSee?groupId=${afa.groupId}'/>">觀看細節</a> --%>
<!-- 					</td> -->
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>
<!-- 		</table> -->
<!-- 	</div> -->
<!-- </body> -->
<!-- </html> -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>廠商界面</title>

<style>
body {
	font-size: 17px;
	font-family: Arial, Helvetica, sans-serif;
	background-color: rgb(242, 238, 239);
	line-height: 1.5em;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.aside {
	/* margin: 20px auto; */
	width: 11%;
	float: left;
	text-align: center;
	box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.2);
	margin-left: 100px;
	margin-top: 85px;
	text-align: center;
	background-color: white;
	border-radius: 5px;
}

.aside a {
	text-decoration: none;
	line-height: 45px;
	font-size: 18px;
	color: rgb(126, 107, 107);
	list-style-type: none;
	font-weight: bolder;
	display: block;
}

.aside a:hover {
	background-color: rgb(126, 107, 107);
	color: rgb(231, 221, 213);
	border-radius: 5px;
}

.article {
	width: 78%;
	margin: 0 auto;
}

#allpage {
	width: 82%;
	margin: 0 auto;
}

.tablediv {
	width: 1000px;
	margin: 20px auto;
	background-color: white;
}

.h1 {
	text-align: center;
	margin: 30px 0;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.css">
</head>
<body>
		<jsp:include page="../header.jsp" />
	<div id="allpage">
<!-- 		<aside class="aside"> -->
<%-- 			<br> <a href="<c:url value='/' />">回首頁</a><br> <a --%>
<%-- 				href="<c:url value='/groupBuybuyerMain' />">回管理頁面</a><br> <a --%>
<%-- 				href="<c:url value='/groupBuyshop?name=${member3.name}' />">團購管理</a><br> --%>
<%-- 			<a href="<c:url value='/logout' />">登出</a><br> --%>

<!-- 		</aside> -->
		<article class="article">
			<h2 class="h1">${member3.name}管理頁面</h2>
			<div class="tablediv">
				<table id="table_id" class="display">
					<thead>
						<tr>
							<th>
								<p>廠商</p>
							</th>
							<th>
								<p>編號</p>
							</th>
							<th>
								團購名稱
							</th>
							<th>
								<p>廠商名稱</p>
							</th>
							<th>
								<p>送貨地址</p>
							</th>
							<th>
								<p>發起人</p>
							</th>
							<th>
								<p>公開與否</p>
							</th>
							<th>
								<p>訂單狀態</p>
							</th>
							<th>
								<p></p>
							</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items='${adminFindAll}' var='afa'>
							<tr>
								<td><img
									src='<c:url value='/showshopimagebyname?shopname=${afa.groupShopName}' />'
									width="100"></td>
								<td>
									<p>${afa.groupId}</p>
								</td>
								<td>
									<p>${afa.groupName}</p>
								</td>
								<td>
									<p>${afa.groupShopName}</p>
								</td>
								<td>
									<p>${afa.groupArea}</p>
								</td>
								<td>
									<p>${afa.promoter}</p>
								</td>
								<td>
									<p>${afa.publiconoot}</p>
								</td>
								<td>
									<p>${afa.soldStatus}</p>
								</td>
								<td>
									<%-- 						<a href="<c:url value='/adminUpdate/${afa.groupId}'/>">修改</a> --%>
									<c:choose>
										<c:when test="${afa.soldStatus == 'undone'}">
											<a href="<c:url value='/groupBuyshopUpdate?groupId=${afa.groupId}'/>">修改</a>
											<a
												href="<c:url value='/groupBuyshopCancel?groupId=${afa.groupId}&groupShopName=${afa.groupShopName}'/>">取消</a>
										</c:when>
									</c:choose> <%-- 						<a href="<c:url value='/adminSee?groupId=${afa.groupId}'/>">觀看細節</a> --%>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<br> <br> <br> <br>
		</article>
	</div>
	<%-- 	<jsp:include page="../footer.jsp" /> --%>
	<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.js"></script>
	<script>
		$(function() {
			$('#table_id').DataTable();

		})
	</script>
</body>
</html>