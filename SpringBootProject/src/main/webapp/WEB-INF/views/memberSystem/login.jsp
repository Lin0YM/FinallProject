<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>登入</title>
<link href="${pageContext.request.contextPath}/css/styles.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style>
/* 欄位報錯字體 */
span.error {
	color: red;
	display: inline-block;
	font-size: 15pt;
}
/* 背景顏色 */
body {
	font-size: 17px;
            font-family: Arial, Helvetica, sans-serif;
			background-color: rgb(242, 238, 239); 
            line-height: 1.5em;
            min-height: 100vh;
			display: flex;
			flex-direction: column;
}
</style>
</head>
<body>
<!-- 	<h1>方便購</h1> -->
<!-- 	<nav> -->
<!-- 		<ul class="menu"> -->
<%-- 			<li><a href="<c:url value='/' />">首頁</a></li> --%>
<%-- 			<li><a href="<c:url value='/shop' />">所有商品</a></li> --%>
<!-- 			<li><a href="">團購去</a></li> -->
<!-- 			<li><a href="">討論區</a></li> -->
<!-- 			<li><a href="">許願池</a></li> -->
<!-- 			<li><a href="">二手拍賣</a></li> -->
<!-- 		</ul> -->
<!-- 	</nav> -->
    <jsp:include page="../header.jsp"/>
    <br>
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">登入</h3>
								</div>
								<div class="card-body">
									<form:form modelAttribute="member" action="login" method="POST">
										<div class="form-floating mb-3">
											<form:input path="username" class="form-control"
												id="username" placeholder="Username" />
											<label for="inputEmail">帳號</label><br>
											<form:errors path="username" cssClass="error" />
										</div>
										<div class="form-floating mb-3">
											<form:input path="password" class="form-control"
												id="password" type="password" placeholder="Password" />
											<label for="inputPassword">密碼</label><br>
											<form:errors path="password" cssClass="error" />
										</div>
										<div class="form-check mb-3">
											<form:checkbox path="rememberMe" class="form-check-input"
												id="inputRememberPassword" value="" />
											<label class="form-check-label" for="inputRememberPassword">記住密碼</label>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<a class="small"
												href="<c:url value='/member/forgetPassword'/>">忘記密碼?</a> <input class="btn btn-primary" type="submit"
												value="登入">
										</div>
									</form:form>
								</div>
								<div class="card-footer text-center py-3">
									<div class="small">
										<a href="<c:url value='/member/addNew2' />">還沒註冊? 來註冊吧!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<div align="center">
			<input type="button" value="管理員" onclick='quickInput1();'> <input
				type="button" value="會員" onclick='quickInput2();'> <input
				type="button" value="廠商" onclick='quickInput3();'><input
				type="button" value="會員2" onclick='quickInput4();'>
		</div>
		<div id="layoutAuthentication_footer">
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
<!-- 						<div class="text-muted">Copyright &copy; Your Website 2021</div> -->
<!-- 						<div> -->
<!-- 							<a href="#">Privacy Policy</a> &middot; <a href="#">Terms -->
<!-- 								&amp; Conditions</a> -->
<!-- 						</div> -->

					</div>
				</div>
			</footer>
		</div>
	</div>
<jsp:include page="../footer.jsp"/>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script>
		//管理員一鍵輸入
		function quickInput1() {
			document.getElementById('username').value = 'andy26356';
			document.getElementById('password').value = 'w1234567';
		}
		//會員一鍵輸入
		function quickInput2() {
			document.getElementById('username').value = 'bob576632';
			document.getElementById('password').value = 'eddit23668';
		}
		//廠商一鍵輸入
		function quickInput3() {
			document.getElementById('username').value = 'amy16232';
			document.getElementById('password').value = 'c1234567';
		}
		function quickInput4() {
			document.getElementById('username').value = 'jeff2559756';
			document.getElementById('password').value = 'j12345678';
		}
	</script>
</body>
</html>
