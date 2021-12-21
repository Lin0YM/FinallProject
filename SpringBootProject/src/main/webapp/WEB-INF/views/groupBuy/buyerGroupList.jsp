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
			<h2 class="h1">建立團購</h2>
			<div class="tablediv">

				<div class="container" style="width: 45%;">
					<form:form method='POST' modelAttribute="groupList" action="groupBuybuyerGroupListStart">
						<div class="row">
							<h4>團購修改</h4>
							<div class="input-group input-group-icon">
								團購名稱:
								<form:input path="groupName" size="25" id="groupName"/>
							</div>
							<div class="input-group input-group-icon">
								廠商名稱:<br>
<%-- 								<form:input path="groupShopName" size="25" /> --%>
								
								  <form:select  path="groupShopName" id="groupShopName">
								    <form:option value="黑橋牌"> 黑橋牌</form:option>
								    <form:option value="禎祥食品"> 禎祥食品</form:option>
								    <form:option value="義美食品"> 義美食品</form:option>
								    <form:option value="卜蜂食品"> 卜蜂食品</form:option>
								    <form:option value="亞尼克"> 亞尼克</form:option>
								  </form:select>
								
								
							</div>
							<div class="input-group input-group-icon">
								送貨地址:
								<form:input path="groupArea" size="25" id="groupArea"/>
							</div>
							<div class="input-group input-group-icon">
								公開與否:<br>
<%-- 								<form:input path="publiconoot" size="25" /> --%>
								<form:select  path="publiconoot" id="publiconoot">
								    <form:option value="公開">公開</form:option>
								    <form:option value="不公開">不公開</form:option>
								</form:select>
							</div>

							<input type='submit' value='修改'>
							<a href="#" onClick="autoFill1(); return true;">一鍵輸入資料1</a><br>
							<a href="#" onClick="autoFill2(); return true;">一鍵輸入資料2</a><br>
							<div style="display:none">
								<form:input path="groupId" size="30" />
								<form:input path="promoter" size="25" />
								<form:input path="soldStatus" size="25" />
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
				<script type="text/javascript">
					function autoFill1() {
						document.getElementById('groupName').value = "超好吃";
						document.getElementById('groupShopName').value = "禎祥食品";	
						document.getElementById('groupArea').value = "台北市火車站";
						document.getElementById('publiconoot').value = "公開";	
					}
					function autoFill2() {
						document.getElementById('groupName').value = "大滿足";
						document.getElementById('groupShopName').value = "黑橋牌";	
						document.getElementById('groupArea').value = "台北地下街";
						document.getElementById('publiconoot').value = "公開";	
					}
					
			
				</script>
</body>
</html>