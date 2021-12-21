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
<title>刪除會員</title>
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
<jsp:include page="../header.jsp"/>
	<div class="wrapper bg-white mt-sm-5">
		<h4 class="pb-4 border-bottom">刪除會員</h4>
		
		<div class="py-2">
			<form action="<c:url value='/member/Delete' />" method="post">
				<div class="row py-2">
					<div class="col-md-6">
						<label for="id">編號</label>
						<input class="form-control" type="text" value="${member.id}" aria-label="Disabled input example" disabled readonly>
						<input type="hidden" name="id" value="${member.id}">
					</div>
					<div class="col-md-6">
						<label for="name">名字</label>
						<input class="form-control" type="text" value="${member.name}" aria-label="Disabled input example" disabled readonly>
					</div>
				</div>
				<div class="py-3 pb-4 border-bottom">
					<input class="btn btn-primary mr-3" type="submit" value="確認刪除"><input
						type="button" class="btn border button" value="取消"
						onclick="location.href='<c:url value='/member/adminList' />'">&nbsp;&nbsp;&nbsp;
				</div>
			</form>
		</div>
	</div>
</body>
</html>
