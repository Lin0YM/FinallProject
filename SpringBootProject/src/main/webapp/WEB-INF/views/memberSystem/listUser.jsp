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
<title>方便購會員資料</title>
</head>
<style>

</style>
<body>
<jsp:include page="../header.jsp"/>
	<div class="wrapper bg-white mt-sm-5">
		<h4 class="pb-4 border-bottom">會員編號 ${member3.id}</h4>
		
		<div class="py-2">
			<form:form modelAttribute="member" action="UpdateUser" method="POST">
				<div class="row py-2">
					<div class="col-md-6">
						<label for="username">帳號</label>
						<input class="form-control" type="text" value="${member3.username}" aria-label="Disabled input example" disabled readonly>
					</div>
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="password">密碼</label>
						<input class="form-control" type="password" value="${member3.password}" aria-label="Disabled input example" disabled readonly>
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-6">
						<label for="name">名字</label>
						<input class="form-control" type="text" value="${member3.name}" aria-label="Disabled input example" disabled readonly>
					</div>
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="password">密碼確認</label>
						<input class="form-control" type="password" value="${member3.password}" aria-label="Disabled input example" disabled readonly>
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-6">
						<label for="phonenumber">電話號碼</label>
						<input class="form-control" type="text" value="${member3.phonenumber}" aria-label="Disabled input example" disabled readonly>
					</div>
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="emailaddress">電子郵件</label>
						<input class="form-control" type="text" value="${member3.emailaddress}" aria-label="Disabled input example" disabled readonly>
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="address">地址</label>
						<input class="form-control" type="text" value="${member3.address}" aria-label="Disabled input example" disabled readonly>
					</div>

				</div>
				<div class="row py-2">
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="sex">性別</label>
						
							<input class="form-control" type="text" value="${member3.sex}" aria-label="Disabled input example" disabled readonly>
						


					</div>

					<div class="col-md-6 pt-md-0 pt-3" id="lang">
						<label for="status">身份</label>
						<div class="arrow">
							<input class="form-control" type="text" value="${member3.status}" aria-label="Disabled input example" disabled readonly>
						</div>
					</div>
				</div>
				<div class="py-3 pb-4 border-bottom">
					<input
						type="button" class="btn btn-primary mr-3" value="修改"
						onclick="location.href='editUser/${member3.id}'">
				</div>
			</form:form>
		</div>
	</div>
	
</body>
</html>
