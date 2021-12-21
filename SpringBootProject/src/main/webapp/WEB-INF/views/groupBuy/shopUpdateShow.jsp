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
<title>廠商界面</title>
<link href="<c:url value='/css/form.css' />" rel="stylesheet" />
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
			<br><a href="<c:url value='/' />">回首頁</a><br>
			<a href="<c:url value='/groupBuybuyerMain' />">回管理頁面</a><br>
			<a href="<c:url value='/groupBuyshop?name=${member3.name}' />">團購管理</a><br>
			<a href="<c:url value='/logout' />">登出</a><br>

		</aside>
		<article class="article">
			<h2 class="h1">${member3.name}管理頁面</h2>管理頁面
			<div class="tablediv">
				<div class="container" style="width:45%;">
						<form:form method='POST' modelAttribute="adminUpdateShow"
							action="groupBuyUpdateSave">
							<div class="row">
								<h4>團購修改</h4>
								<div class="input-group input-group-icon">
									團購名稱:
									<form:input path="groupName" size="25" />
								</div>
								<div class="input-group input-group-icon">
									送貨地址:
									<form:input path="groupArea" size="25" />
								</div>
								<div class="input-group input-group-icon">
									公開與否:<br>
<%-- 									<form:input path="publiconoot" size="10" /> --%>
									<form:select  path="publiconoot" id="publiconoot">
									    <form:option value="公開">公開</form:option>
									    <form:option value="不公開">不公開</form:option>
									</form:select>
								</div>
								<div class="input-group input-group-icon">
									訂單狀態:<br>
<%-- 									<form:input path="soldStatus" size="10" /> --%>
									<form:select  path="soldStatus" id="publiconoot">
									    <form:option value="done">done</form:option>
									    <form:option value="undone">undone</form:option>
									    <form:option value="cancel">cancel</form:option>
									</form:select>
								</div>
								<input type='submit' value='修改'>
								<div style="display: none">
									<form:input path="groupId" size="30" />
									<form:input path="groupShopName" size="25" />
									<form:input path="promoter" size="30" />
								</div>
							</div>

						</form:form>
					</div>
			</div>
			<br> <br> <br> <br>
		</article>
	</div>
<%-- 	<jsp:include page="../footer.jsp" /> --%>
</body>
</html>