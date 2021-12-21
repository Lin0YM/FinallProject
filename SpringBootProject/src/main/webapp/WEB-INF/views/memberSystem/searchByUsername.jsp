<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}\css\member\styles.css">	
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>帳號查詢</title>
</head>
<style>

</style>
<body>
	<div class="wrapper bg-white mt-sm-5">
		<h4 class="pb-4 border-bottom">帳號查詢</h4>
		<div class="py-2">
			<form:form modelAttribute="member" action="RetrieveByUsernameIdMang" method="POST">
				<div class="row py-2">
					<div class="col-md-6">
						<label for="username">帳號</label>
						<form:input path="username" class="bg-light form-control"
							id="id" />
						<form:errors path="username" cssClass="error" />
					</div>
				</div>
				<div class="py-3 pb-4 border-bottom">
					<input class="btn btn-primary mr-3" type="submit" value="送出"><input
						type="button" class="btn border button" value="取消"
						onclick="location.href='<c:url value='/member/adminList' />'">&nbsp;&nbsp;&nbsp;
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>
