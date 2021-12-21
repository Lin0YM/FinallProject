<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%--用C:語法需添加 --%>
<!DOCTYPE html>
<html lang="en">
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
  <form:form method="POST" modelAttribute="reply" enctype="multipart/form-data" >
    	<h1 style="width:800px; margin: 0 auto;">討論區</h1>
		<hr>
		<h2 style="width:800px; margin: 0 auto;">回應文章</h2>
<div style="width:800px; margin: 0 auto;">

<form:textarea path="replyArticle" id="summernote" placeholder="回應內容"   maxlength="200"/>
 
 <input type="submit" value="回應文章" class="btn btn-info col-2">
 </div>
 
 <hr>
 <div style="width:800px; margin: 0 auto;">
 <a href="<c:url value='/forum/'/>"> 返回文章列表</a>
 </div>
 
 			<input type="hidden" value="${ForumById.id}">	
<div style="width:800px; margin: 0 auto;">
			<input type="button" value="神奇小幫手" onclick='quickInput();'>
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
  
</form:form>


</body>
</html>