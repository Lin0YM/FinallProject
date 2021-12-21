<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<h2>文章編輯</h2>

		<form action="<c:url value='/forum/saveUpdate'/>" method="POST">
			<input type="hidden" name="count" value="${forum.count}" /> 
			<input type="hidden" name="date" value="${forum.date}" /> 
			<input type="hidden" name="id" value="${forum.id}" /> 
			
			<select name="category" value="${forum.category}">
				<option value="${forum.category}">${forum.category}</option>
				<option value="寵物專區">寵物專區</option>
				<option value="保健醫用">保健醫用</option>
				<option value="日常百貨">日常百貨</option>
			</select>
			 
			<input type="text" name="theme" value="${forum.theme}" class="form-control mb-10 col-10" maxlength="50">
			
				<textarea name="article" id="summernote" placeholder="文章內容" cols="50"
					rows="20" class="form-control mb-10 col-10" maxlength="2000">${forum.article}</textarea>
			
			<a href="<c:url value='/forum/deleteForum?id=${forum.id}'/>"
				class="btn btn-danger">刪除</a> <input type="submit" value="編輯完成"
				class="btn btn-info col-2">
		</form>

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