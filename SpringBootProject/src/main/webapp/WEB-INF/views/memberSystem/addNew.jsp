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
<title>會員註冊</title>
</head>
<style>

</style>
<body>
	<div class="wrapper bg-white mt-sm-5">
		<h4 class="pb-4 border-bottom">會員註冊</h4>
		<div class="py-2">
			<form:form modelAttribute="member" action="Register" method="POST">
				<div class="row py-2">
					<div class="col-md-6">
						<label for="username">帳號</label>
						<form:input path="username" class="bg-light form-control"
							id="username" />
						<form:errors path="username" cssClass="error" />
					</div>
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="password">密碼</label>
						<form:input type="password" path="password"
							class="bg-light form-control" id="password" />
						<form:errors path="password" cssClass="error" />
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-6">
						<label for="name">名字</label>
						<form:input path="name" class="bg-light form-control" id="name" />
						<form:errors path="name" cssClass="error" />
					</div>
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="password">密碼確認</label>
						<form:input type="password" path="password1"
							class="bg-light form-control" id="password1" />
						<form:errors path="password1" cssClass="error" />
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-6">
						<label for="phonenumber">電話號碼</label>
						<form:input path="phonenumber" id="phonenumber"
							class="bg-light form-control" />
						<form:errors path="phonenumber" cssClass="error" />
					</div>
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="emailaddress">電子郵件</label>
						<form:input path="emailaddress" id="emailaddress"
							class="bg-light form-control"  />
						<form:errors path="emailaddress" cssClass="error" />
					</div>
				</div>
				<div class="row py-2">
					<div class="col-md-12">
						<label for="address">地址</label>
						<form:input path="address" id="address"
							class="bg-light form-control" />
						<form:errors path="address" cssClass="error" />
					</div>

				</div>
				<div class="row py-2">
					<div class="col-md-6">
						<label for="sex">性別</label>
						<form:select path="sex" name="sex" id="sex" class="bg-light">
							<option value="" selected>請選擇</option>
							<option value="男">男</option>
							<option value="女">女</option>
						</form:select>
						<form:errors path="sex" cssClass="error" />
					</div>
					<div class="col-md-6 pt-md-0 pt-3" id="lang">
						<label for="status">身份</label>
						<div class="arrow">
							<form:select path="status" name="status" id="status"
								class="bg-light">
								<option value="" selected>請選擇</option>
								<option value="管理員">管理員</option>
								<option value="會員">會員</option>
								<option value="廠商">廠商</option>
							</form:select>
							<form:errors path="status" cssClass="error" />
						</div>
					</div>
				</div>
				<div class="py-3 pb-4 border-bottom">
					<input class="btn btn-primary mr-3" type="submit" value="送出"><input
						type="button" class="btn border button" value="取消"
						onclick="location.href='<c:url value='/member/adminList' />'">&nbsp;&nbsp;&nbsp;
					<input class="btn border button" type="button" value="會員" onclick='quickInput2();'>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
		//會員一鍵輸入
		function quickInput2() {
			document.getElementById('username').value = 'amy315568';
			document.getElementById('password').value = 'kelly23566';
			document.getElementById('password1').value = 'kelly23566';
			document.getElementById('name').value = '黃瑜婷';
			document.getElementById('phonenumber').value = '0975665597';
			document.getElementById('emailaddress').value = 'kelly15663@gmail.com';
			document.getElementById('address').value = '桃園市中壢區前孝路大光街17巷53號';
			document.getElementById('女').value = '女';
			document.getElementById('會員').value = '會員';
		}
	</script>
</body>
</html>
