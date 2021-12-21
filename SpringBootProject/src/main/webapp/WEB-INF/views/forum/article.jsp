<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>討論區</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

</head>
<body>
	

	<div class="container">
		<h1>討論區</h1>
		<hr>
			<a href="<c:url value='/forum/showForumForUpdate?id=${ForumById.id}'/>"class="btn btn-primary">編輯</a>
			<a href="<c:url value='/forum/deleteForum?id=${ForumById.id}'/>"class="btn btn-danger">刪除</a>
		
			<h1 style=" width:1000px ; margin: 20px auto 20px auto">${ForumById.theme}</h1>			
	
			<div style="border:3px black solid; width:1000px ; margin:0 auto ;padding:20px 20px 20px 30px"> 
			
			<p>${ForumById.article}</p>
			
			</div>
			
<!-- 			<div style="border:3px black solid; width:1000px ; margin:0 auto ;padding:20px 20px 20px 30px">  -->
			
<%-- 			<p>${Reply.replyArticle}</p> --%>
			
<!-- 			</div> -->
			
			
<%-- 			<a href="<c:url value='/forum/addReply?id=${ForumById.id}'/>"class="btn btn-primary">回應文章</a> --%>
			
			<input type="hidden" value="${ForumById.count}">	
		<hr>
		<a href="<c:url value='/forum/'/>"> 返回主題列表</a>
	</div>
	

</body>
</html>