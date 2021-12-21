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
			<br> <a href="">會員資料</a><br>
			<a href="<c:url value='/singlebuy/orderlist' />">網購訂單查詢</a><br>
			<a href="">團購訂單查詢</a><br>
			<a href="">討論區管理</a><br>
			<a href="">許願池管理</a><br>
			<a href="">二手拍賣管理</a><br>
		</aside>
		<article class="article">
			<h2 class="h1">訂單列表</h2>//每個頁面的標題
			<div class="tablediv">

			//把內容放在這
			//把內容放在這
			//把內容放在這
			//把內容放在這
			//把內容放在這
			//把內容放在這
			


			</div>
			<br> <br> <br> <br>
		</article>
	</div>
<%-- 	<jsp:include page="../footer.jsp" /> --%>
</body>
</html>