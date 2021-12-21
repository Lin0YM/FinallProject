<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 用C:語法需添加 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>討論區</title>



<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>
<script src="<c:url value='/js/scripts.js' />"></script>
<script src="<c:url value='/js/datatables-simple-demo.js' />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
	crossorigin="anonymous"></script>
<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />

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
</style>

</head>
<body>
<jsp:include page="../header.jsp"/>

	<!-- 	<div class="container my-2"> -->

	<!-- 		<h1>討論區</h1> -->
	<%-- 		<a href="<c:url value='/forum/showNewForumForm'/>" --%>
	<!-- 			class="btn btn-primary btn-sm mb-3">發新文章</a> -->
	<%-- <%-- 					 <c:url>標記格式的URL轉換為字符串，並將其存儲到一個變量。 --%>
	<!-- 		<!-- 			 value對應到controller的@getMapping，呼叫其方法-->

	<!-- 		<table border="1" class="table table-striped table-responsive-md"> -->
	<!-- 			<thead> -->
	<!-- 				<tr> -->
	<!-- 					<th width="100px" >分類</th> -->
	<!-- 					<th width="200px" >標題</th> -->
	<!-- 					<th width="100px" height="5px">回應/觀看次數</th> -->
	<!-- 					<th width="100px" height="5px">建立時間</th> -->
	<!-- 				</tr> -->
	<!-- 			</thead> -->
	<!-- 			<tbody> -->
	<%-- 				<c:forEach items='${listForum}' var='id'> var為lsit其中橫向單一筆資料 --%>
	<%-- <%-- 					var 用來設定屬性名稱，而 value 用來設定屬性值 --%>
	<!-- 					<tr> -->
	<%-- 						<td width="100px" height="5px">${id.category}</td> --%>
	<%-- 						<td width="200px" ><a href="<c:url value='/forum/showFormArticle?id=${id.id}'/>" target="_self">${id.theme}</a></td> --%>
	<%-- <%-- 						<td><a href="<c:url value='/forum/showForumForUpdate?id=${id.id}'/>" class="btn btn-primary">編輯</a>  --%>
	<%-- <%-- 						    <a href="<c:url value='/forum/deleteForum?id=${id.id}'/>" class="btn btn-danger">刪除</a> --%>
	<%-- <%-- 						    <a href="<c:url value='/forum/showFormArticle?id=${id.id}'/>" class="btn btn-danger">文章</a></td> --%>
	<!-- 						<td width="100px" height="5px">回應/觀看次數</td> -->
	<!-- 						<td width="100px" height="5px">建立時間</td> -->
	<!-- 					</tr> -->
	<%-- 				</c:forEach> --%>
	<!-- 			</tbody> -->
	<!-- 		</table> -->
	<!-- 	</div> -->



	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h2 class="h1" align="center">討論區</h2>
				<main>
					<div class="container-fluid px-4">
						<div class="card mb-4">
							<div class="card-header">
								<i class="fas fa-table me-1">文章列表</i> 
							</div>
							<div class="card-body">
								<table id="datatablesSimple">
									<thead>
										<div>
											<a href="<c:url value='forum/saveForum'/>"
												class="btn btn-primary btn-sm mb-3">發新文章</a>
										</div>
										<tr >
											<!-- <th>商品圖示</th> -->
											<th style="text-align:center">類別</th>
											<th style="text-align:center">標題</th>
											<th style="text-align:center">觀看次數</th>
											<th style="text-align:center">發文時間</th>
											<th style="text-align:center">修改時間</th>
											<!--<th>商品總價</th> -->
											<!--<th>商品簡介</th> -->
											<!--<th>修改</th> -->
											<!--<th>刪除</td> -->
										</tr>
									</thead>
									<tbody>
										<c:forEach items='${listForum}' var='id'>
											<tr>
												<%-- <td><img height="50px" alt="" src="<c:url value='/goods/getPicture/${good.id}' />" /></td> --%>
												<td style="text-align:center">${id.category}</td>
												<td><a
													href="<c:url value='/forum/showFormArticle?id=${id.id}'/>"
													target="_self">${id.theme}</a></td>
												<td style="text-align:center">${id.count}</td>
												<td style="text-align:center">${id.date}</td>
												<td style="text-align:center">${id.lastdate}</td>
												<%-- <td>${good.sumPrice}</td> --%>
												<%-- <td>${good.goodsInt}</td> --%>
												<%-- <td><a href="<spring:url value='/goods/update?id=${good.id}' />">修改</a></td> --%>
												<%-- <td><a href="<spring:url value='/goods/delete?id=${good.id}' />">刪除</a></td> --%>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</main>
			</div>
		</main>
	</div>

	<jsp:include page="../footer.jsp"/>
</body>
</html>