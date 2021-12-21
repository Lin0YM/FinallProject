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
<title>忘記密碼</title>
</head>
<style>
/*表格的內容調整*/
.wrapper {
	padding: 30px 50px;
	border: 1px solid #ddd;
	border-radius: 15px;
	margin: 10px auto;
	/*表格白色的寬度*/
	max-width: 400px
}

</style>
<body>
	<div class="wrapper bg-white mt-sm-5">
		<h4 class="pb-4 border-bottom">請輸入註冊時填寫的帳號與電子郵件</h4>
		<div class="py-2">
			<form:form modelAttribute="member" action="sendForgetPasswordVerify" method="POST">
				<div class="row py-2">
					<div class="col-md-12">
						<label for="username">帳號</label>
						<form:input path="username" class="bg-light form-control"
							id="username" />
						<form:errors path="username" cssClass="error" />
					</div>
					
				</div>
				
				<div class="row py-2">
					
					<div class="col-md-12">
						<label for="emailaddress">電子郵件</label>
						<form:input path="emailaddress" id="emailaddress"
							class="bg-light form-control"  />
						<form:errors path="emailaddress" cssClass="error" />
					</div>
				</div>
				<div class="py-3 pb-4 border-bottom">
					<input class="btn btn-primary mr-3" type="submit" value="送出"><input
						type="button" class="btn border button" value="取消"
						onclick="location.href='<c:url value='/member/loginPage' />'">&nbsp;&nbsp;&nbsp;
					<input class="btn border button" type="button" value="會員" onclick='quickInput2();'>
				</div>
			</form:form>
		</div>
	</div>
	<script type="text/javascript">
		//會員一鍵輸入
		function quickInput2() {
			document.getElementById('username').value = 'bob576632';
			document.getElementById('emailaddress').value = 'eeit13305@gmail.com';
		}
	</script>
</body>
</html>
