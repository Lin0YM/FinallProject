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
  <form:form method="POST" modelAttribute="forum" enctype="multipart/form-data" >
    	<h1 style="width:800px; margin: 0 auto;">討論區</h1>
		<hr>
		<h2 style="width:800px; margin: 0 auto;">發新主題</h2>


<div style="width:800px; margin: 0 auto;">
<select id="health" name="category" >
		<option value="寵物專區">寵物專區</option>
		<option value="保健醫用">保健醫用</option>
		<option value="日常百貨">日常百貨</option>
</select>
</div>
<form:input id="theme" path="theme" type="text" placeholder="主題主題名稱" style="width:800px; margin: 0 auto;" class="form-control mb-10 col-10" maxlength="50"/>

<div style="width:800px; margin: 0 auto;">

<form:textarea path="article" id="summernote" placeholder="文章內容"   maxlength="2000"/>
 
 <input type="submit" value="發表文章" class="btn btn-info col-2">
 </div>
 
 <hr>
 <div style="width:800px; margin: 0 auto;">
 <a href="<c:url value='/forum/'/>"> 返回文章列表</a>
 </div>
 
 
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
  
  <script>
	function quickInput() {
		document.getElementById('health').value = '保健醫用';
		document.getElementById('theme').value = 'Tetra Ex Power 60 德彩 外置過濾器480L/H';
		document.getElementById('article').value = '流水量：480公升/小時 適用水槽：38~75cm/約20~100L'; //複製貼上
	}
</script>
  
</form:form>


</body>
</html>