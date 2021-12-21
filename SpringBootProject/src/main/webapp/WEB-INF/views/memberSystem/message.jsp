<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\css\member\styles.css">
<title>方便購</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>

</style>
</head>
<body>
	<div class="py-2">
		<div align="center" class="py-3 pb-4 border-bottom">
			<h2>${message}</h2><br>
			<input type="button" class="btn btn-primary mr-3" value="回首頁"
				onclick="location.href='<c:url value='/member/logoutmessage' />'">

		</div>
	</div>


</body>
</html>