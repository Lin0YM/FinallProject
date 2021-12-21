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
<title>修改會員資料</title>
</head>
<style>

</style>
<body>
	<div class="wrapper bg-white mt-sm-5">
		<h4 >修改會員資料</h4>
		<h6 class="pb-4 border-bottom">編號 ${member.id}</h6>
		<div class="py-2">
			<form:form modelAttribute="member" action="Update" method="POST">
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
							class="bg-light form-control" />
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
					<div class="col-md-6 pt-md-0 pt-3">
						<label for="sex">性別</label>
						<div class="col-md-6">
							<form:radiobutton path="sex" value="男" id="男" />
							<label for="男">男</label>&nbsp;
							<form:radiobutton path="sex" value="女" id="女" />&nbsp;<label for="女">女</label>
							<br>&nbsp;
							<form:errors path="status" cssClass="error" />

						</div>
					</div>
					<div class="col-md-6 pt-md-0 pt-3" id="lang">
						<label for="status">身份</label>
						<div class="arrow">
							<form:radiobutton path="status" value="管理員" id="管理員" />
							<label for="管理員">管理員</label>&nbsp;
							<form:radiobutton path="status" value="會員" id="會員" />&nbsp;<label for="會員">會員</label>
							<form:radiobutton path="status" value="廠商" id="廠商" />&nbsp;<label for="廠商">廠商</label>
							<br>&nbsp;
							<form:errors path="status" cssClass="error" />
						</div>
					</div>
				</div>
				<div class="py-3 pb-4 border-bottom">
					<input class="btn btn-primary mr-3" type="submit" value="儲存"><input
						type="button" class="btn border button" value="取消"
						onclick="location.href='<c:url value='/member/adminList' />'">&nbsp;&nbsp;&nbsp;
					<input class="btn border button" type="button" value="會員"
						onclick='quickInput2();'>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
		//會員一鍵輸入
		function quickInput2() {
// 			document.getElementById('username').value = 'bob576632';
// 			document.getElementById('password').value = 'eddit23668';
// 			document.getElementById('password1').value = 'eddit23668';
// 			document.getElementById('name').value = '陳彥霆';
			document.getElementById('phonenumber').value = '0975262658';
			document.getElementById('emailaddress').value = 'eeit13305@gmail.com';
			document.getElementById('address').value = '新北市土城區大隆路合光街386巷5號';
			document.getElementById('男').value = '男';
			document.getElementById('會員').value = '會員';
		}
	</script>
</body>
</html>
