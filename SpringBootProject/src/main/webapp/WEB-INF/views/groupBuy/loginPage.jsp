<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="<c:url value='/css/form.css' />" rel="stylesheet" />
<title>會員中心</title>

<style>
body {
	font-size: 17px;
	font-family: Arial, Helvetica, sans-serif;
	background-color: rgb(242, 238, 239);
	line-height: 1.5em;
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

.aside {
	/* margin: 20px auto; */
	width: 11%;
	float: left;
	text-align: center;
	box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.2);
	margin-left: 100px;
	margin-top: 85px;
	text-align: center;
	background-color: white;
	border-radius: 5px;
}

.aside a {
	text-decoration: none;
	line-height: 45px;
	font-size: 18px;
	color: rgb(126, 107, 107);
	list-style-type: none;
	font-weight: bolder;
	display: block;
}

.aside a:hover {
	background-color: rgb(126, 107, 107);
	color: rgb(231, 221, 213);
	border-radius: 5px;
}

.article {
	width: 78%;
	float: right;
}

#allpage {
	width: 82%;
	margin: 0 auto;
}

.tablediv {
	width: 1000px;
	margin: 20px auto;
	background-color: white;
}

.h1 {
	text-align: center;
	margin: 30px 0;
}
</style>
</head>
<body>
	<%-- 	<jsp:include page="../header.jsp" /> --%>
	<div id="allpage">
		<aside class="aside">
			<br> <a href="<c:url value='/' />">首頁</a><br>

		</aside>
		<article class="article">
			<h2 class="h1">登入頁面</h2>
			<div class="tablediv">


				<div class="container">
					<form:form method='POST' modelAttribute="loginInfor"
						action="groupBuyloginsubmit">
						<div class="row">
							<h4>Account</h4>
<!-- 							<div class="input-group input-group-icon"> -->
<%-- 								<form:input path="userName" size="25" placeholder="userName" --%>
<%-- 									id="userName" /> --%>
<!-- 								<div class="input-icon"> -->
<!-- 									<i class="fa fa-user"></i> -->
<!-- 								</div> -->
<!-- 							</div> -->
							<div class="input-group input-group-icon">
								<form:input path="emailaddress" size="25"
									placeholder="EmailAdress" id="emailaddress" />
								<%-- 								<form:input path="name" size="25" /> --%>
								<div class="input-icon">
									<i class="fa fa-envelope"></i>
								</div>
							</div>
							<div class="input-group input-group-icon">
								<form:input path="password" size="25" placeholder="password"
									id="password" />
								<div class="input-icon">
									<i class="fa fa-key"></i>
								</div>
							</div>
						</div>
						<input type='submit' value='登入'>
						<a href="#" onClick="autoFill1(); return true;">一鍵輸入用戶:林小明</a><br>
						<a href="#" onClick="autoFill2(); return true;">一鍵輸入用戶:林大明</a><br>
						<a href="#" onClick="autoFill3(); return true;">一鍵輸入廠商:禎祥食品</a><br>
						<a href="#" onClick="autoFill4(); return true;">一鍵輸入管理員</a><br>
						<div style="display: none">
							<form:input path="userName" size="25" placeholder="userName"
									id="userName" />
							<form:input path="id" size="30" />
							<form:input path="phonenumber" size="25" />
							<form:input path="name" size="25" />
							<form:input path="address" size="25" />
							<form:input path="status" size="25" />
						</div>
					</form:form>
				</div>






			</div>
			<br> <br> <br> <br>
		</article>
	</div>
	<%-- 	<jsp:include page="../footer.jsp" /> --%>

	<script type="text/javascript">
		function autoFill1() {
// 			document.getElementById('userName').value = "a12345";
			document.getElementById('emailaddress').value = "a12345@test.com";
			document.getElementById('password').value = "123456";	
		}
		function autoFill2() {
// 			document.getElementById('userName').value = "g12345";
			document.getElementById('emailaddress').value = "andy@gmail.com";
			document.getElementById('password').value = "123456";	
		}
		function autoFill3() {
// 			document.getElementById('userName').value = "d12345";
			document.getElementById('emailaddress').value = "aaa@test.com";
			document.getElementById('password').value = "123456";	
		}
		function autoFill4() {
			document.getElementById('userName').value = "c12345";
			document.getElementById('emailaddress').value = "Jack@gmail.com";
			document.getElementById('password').value = "123456";	
		}
		

	</script>
</body>
</html>