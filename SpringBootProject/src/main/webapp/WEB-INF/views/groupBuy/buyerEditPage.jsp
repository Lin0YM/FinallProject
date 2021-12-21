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
<title>會員中心</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.1/css/jquery.dataTables.css">
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
		<jsp:include page="../header.jsp" />
	<div id="allpage">
		<aside class="aside">
<br><a href="<c:url value='/groupBuybuyer?name=${member3.name}' />">團購訂單查詢</a><br>
			<a href="<c:url value='/groupBuybuyerStart?buyer=${buyListName}'/>">發起團購</a><br>
			<a href="<c:url value='/groupBuybuyeratt?buyer=${buyListName}'/>">參與團購</a><br>

		</aside>
		<article class="article">
			<h2 class="h1">商品數量修改</h2>
			<div class="tablediv">

<%-- 				<form:form method='POST' modelAttribute="itemNum" --%>
<%-- 					action="itemNumUpadate"> --%>
<!-- 					<input type="hidden" name="noname" id='putOrDelete' value=""> -->
<!-- 					<fieldset class="fieldset-auto-width"> -->
<!-- 						<legend>buyerStartForm</legend> -->
<!-- 						<table> -->
<!-- 							<tr> -->
<!-- 								<td align='right'>itemNumber：<br>&nbsp; -->
<!-- 								</td> -->
<%-- 								<td><form:input path="itemNumber" size="25" /><br>&nbsp; --%>
<!-- 								</td> -->
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<td colspan='2' align='center'><input type='submit' -->
<!-- 									value='修改'>&nbsp;</td> -->
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 						<div style="display: none"> -->
<%-- 							<form:input path="groupId" size="30" /> --%>
<%-- 							<form:input path="buyerName" size="25" /> --%>
<%-- 							<form:input path="itemId" size="25" /> --%>
<!-- 						</div> -->
<!-- 					</fieldset> -->
<%-- 				</form:form> --%>


				<div class="container" style="width: 45%;">
					<form:form method='POST' modelAttribute="itemNum"
						action="groupBuyitemNumUpadate">
						<div class="row">
							<h4>團購修改</h4>
							<div class="input-group input-group-icon">
								商品數量:
								<form:input path="itemNumber" size="25" />
							</div>

							<input type='submit' value='修改'>
							<div style="display: none">
								<form:input path="groupId" size="30" />
								<form:input path="buyerName" size="25" />
								<form:input path="itemId" size="25" />
							</div>
						</div>

					</form:form>
				</div>

				<%-- 	<jsp:include page="../footer.jsp" /> --%>
				<script src="${pageContext.request.contextPath}/js/jquery-3.6.0.js"></script>
				<script type="text/javascript" charset="utf8"
					src="https://cdn.datatables.net/1.11.1/js/jquery.dataTables.js"></script>
				<script>
					$(function() {
						$('#table_id').DataTable();

					})
				</script>
</body>
</html>