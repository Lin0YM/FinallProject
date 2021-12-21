<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--   工具欄功能 -->
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<!--  ========= -->
</head>
<body>
	

	<div class="container">
		<h1>討論區</h1>
		<hr>
			<a href="<c:url value='/adminforum/adminUpdate?id=${ForumById.id}'/>"class="btn btn-primary">編輯</a>
			<a href="<c:url value='/forum/deleteForum?id=${ForumById.id}'/>"class="btn btn-danger">刪除</a>
		
			<h1 style=" width:1000px ; margin: 20px auto 20px auto">${ForumById.theme}</h1>			
	
			<div style="border:3px black solid; width:1000px ; margin:0 auto ;padding:20px 20px 20px 30px"> 
			
			<p>${ForumById.article}</p>
			
			</div>
			
<!-- 			<div style="border:3px black solid; width:1000px ; margin:0 auto ;padding:20px 20px 20px 30px">  -->
			
<%-- 			<p>${Reply.replyArticle}</p> --%>
			
<!-- 			</div> -->
			
			
			<a href="<c:url value='/forum/addReply?id=${ForumById.id}'/>"class="btn btn-primary">回應文章</a>
			
			<input type="hidden" value="${ForumById.count}">	
		<hr>
		<a href="<c:url value='/forum/'/>"> 返回主題列表</a>
	</div>
		  <script>
    $(document).ready(function() {
    	$('#summernote').summernote({
    		  height: 500,                 // set editor height
    		  minHeight: null,             // set minimum height of editor
    		  maxHeight: null,             // set maximum height of editor
    		  focus: true                  // set focus to editable area after initializing summernote
    		});
    });
  </script>

</body>
</html>