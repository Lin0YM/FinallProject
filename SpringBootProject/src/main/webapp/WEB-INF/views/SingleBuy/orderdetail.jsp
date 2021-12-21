<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>訂單資料</title>

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

.tablediv {
	width: 850px;
	margin: 20px auto;
	background-color: white;
}

.itemtable {
	width: 850px;
	margin: 0px auto;
	margin-bottom: 0;
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	border: gray 1px solid;
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

.itemimg {
	margin-top: 15px;
	height: 150px;
	width: 150px;
	object-fit: cover;
}

.nametd {
	width: 300px;
}

.pricetd {
	width: 100px;
}

.qtytd {
	width: 70px;
}

.totalitempricetd {
	width: 120px;
}

.h1 {
	text-align: center;
	margin-top: 30px ;
	color:rgb(126, 107, 107);
}

.h2 {
	text-align: right;
	line-height: 6px;
	font-size: 17px;
}

.h3 {
	text-align: center;
	margin: 30px 0;
}

.goback{
	color: rgb(126, 107, 107);
	font-size: 17px;
	font-weight:bolder;
	text-align: center;
}
.paytd {
	text-align: left;
	padding: 10px 0;
	padding-left: 20px;
}
.paytd span{
	font-size: 17px;
	font-weight:normal;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<h2 class="h1">訂單資料</h2>
	<div class="tablediv">
		<table class="itemtable">
			<tr>
				<td>商品明細</td>
				<td></td>
				<td>單價</td>
				<td>數量</td>
				<td>小計</td>
			</tr>
			<c:forEach var='item' items="${orderitems}">
				<tr class="tr" id="item1">
					<td>
					<img class="itemimg" src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />" alt="123">
					</td>
					<td class="nametd">
						<p>${item.itemname}</p>
					</td>
					<td class="pricetd">
						<p>${item.itemprice}</p>
					</td>
					<td class="qtytd">
						<p>${item.quantity}</p>
					</td>
					<td class="totalitempricetd">
						<p>${item.itemprice * item.quantity}</p>
					</td>
				</tr>
			</c:forEach>
				<tr>
					<td class="paytd" colspan="3"  style="vertical-align:middle;">
						<span>收件人姓名${order.name}：</span><br>
						<span>收件人電話：${order.phonenumber}</span><br>  
						<span>支付方式：${order.paymentmethod}</span><br>
						<span>配送方式：${order.deliverymethod}</span><br> 
						<span>地址：${order.address}</span>
					</td>
					<td colspan="2" class="itemtable1" style="vertical-align:middle;">
						<br><br><h4 class="h2">商品總額：${order.itemtotalprice}</h4>
						<h4 class="h2">運費：${order.deliveryfee}</h4>
						<h4 class="h2">總額：${order.totalprice}</h4> 
					</td>
				</tr>
		</table>
	</div>
	<div class="tablediv">
			<table class="itemtable1">
				
			</table>
	</div>
	<div  class="goback">
		<a href="<c:url value='/singlebuy/orderlist' />">回前頁</a>
	</div>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
</html>