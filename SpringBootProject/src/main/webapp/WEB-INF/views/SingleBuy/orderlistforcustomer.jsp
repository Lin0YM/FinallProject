<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
/* 	float: right; */
	margin: 0 auto;
}

#allpage {
	width: 82%;
	margin: 0 auto;
	/* 	position: static; */
}

.tablediv {
	width: 1000px;
	margin: 20px auto;
	background-color: white;
}

.itemtable {
	width: 1000px;
	margin: 0px auto;
	margin-bottom: 0;
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	border: gray 2px solid;
	padding: 15px;
	box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, 0.2);
}

td {
	border-bottom: gray 1px dashed;
}

.imgtd {
	width: 170;
}

td p {
	margin: 0;
	padding: 0;
	line-height: 20px;
	font-size: 17px;
	font-weight: normal;
}

.idtd {
	width: 70px;
}

.nametd {
	width: 130px;
}

.timetd {
	width: 130px;
}

.pricetd {
	width: 110px;
}

.qtytd {
	width: 200px;
}

.totalitempricetd {
	width: 150px;
	line-height: 40px;
}

.totalitempricetd a {
	font-size: 17px;
	font-weight: normal;
	color: black;
}

.h1 {
	text-align: center;
	margin: 30px 0;
}

.tr {
	height: 120px;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="allpage">
<!-- 		<aside class="aside"> -->
<!-- 			<br> <a href="">會員資料</a><br> -->
<%-- 			<a href="<c:url value='/singlebuy/orderlist' />">網購訂單查詢</a><br> --%>
<!-- 			<a href="">團購訂單查詢</a><br> -->
<!-- 			<a href="">許願池管理</a><br> -->
<!-- 		</aside> -->
		<article class="article">
			<h2 class="h1">訂單列表</h2>
			<div class="tablediv">
				<table class="itemtable">
					<tr>
						<td>訂單編號</td>
						<td>付款總額</td>
						<td>下訂時間</td>
						<td>配送方式</td>
						<td>地址</td>
						<td>狀態</td>
					</tr>
					<c:choose>
						<c:when test="${not empty orders}">
							<c:forEach items='${orders}' var='order'>
								<tr class="tr" id="item1">
									<td class="idtd">
										<p>${order.orderid}</p>
									</td>
									<td class="nametd">
										<p>${order.totalprice}</p>
									</td>
									<td class="timetd">
										<p>${order.orderTime}</p>
									</td>
									<td class="pricetd">
										<p>${order.deliverymethod}</p>
									</td>
									<td class="qtytd">
										<p>${order.address}</p>
									</td>
									<c:choose>
										<c:when test="${(order.cancelstatus).equals('配送中')}">
											<td class="totalitempricetd"><a
												href="<c:url value='/singlebuy/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：配送中</p> <a
												href="<c:url value='/singlebuy/cancelorder?orderid=${order.orderid}' />">取消訂單</a>
											</td>
										</c:when>
										<c:when test="${(order.cancelstatus).equals('等待取消')}">
											<td class="totalitempricetd"><a
												href="<c:url value='/singlebuy/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：等待取消</p></td>
										</c:when>
										<c:when test="${(order.cancelstatus).equals('取消完成')}">
											<td class="totalitempricetd"><a
												href="<c:url value='/singlebuy/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：訂單取消</p></td>
										</c:when>
										<c:otherwise>
											<td class="totalitempricetd"><a
												href="<c:url value='/singlebuy/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：訂單完成</p></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="6">
									<h2 class="h3">尚無訂單</h2>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<br> <br> <br> <br>
		</article>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
</html>