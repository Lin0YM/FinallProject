<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>購物車</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

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
	margin: 30px 0;
	color:rgb(126, 107, 107);
}

.h2 {
	text-align: right;
	line-height: 6px;
}
.h3{
    text-align: center;
    margin: 30px 0;
    color:rgb(126, 107, 107);
}
.itemtable1 {
	width: 850px;
	margin: 0px auto;
	margin-bottom: 0;
	text-align: center;
	font-size: 17px;
	font-weight: bolder;
	border: gray 1px solid;
	padding: 15px;
	box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, 0.2);
}

.itemtable1 span {
	line-height: 35px;
}

#submitbtn {
	float: right;
	margin-bottom: 10px;
	height: 28px;
	font-size: 17px;
	background-color: rgb(242, 238, 239);
	opacity: .7;
}
#submitbtn:hover{
	opacity: .85;
}
#deliverymethod {
	height: 20px;
	font-size: 17px;
}

#address {
	height: 20px;
	font-size: 17px;
}

#paymethod {
	height: 20px;
	font-size: 17px;
}

.paytd {
	text-align: left;
	padding-top: 35px;
	padding-left: 20px;
}
.trash{
	font-size: 40px;
    background-color: white;
	border:0;
	color:rgb(126, 107, 107);
	opacity: .5;
}
.trash:hover{
	opacity: .65;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />

	<h2 class="h1">購物車</h2>
	<div class="tablediv">
		<table class="itemtable">
			<tr>
				<td>商品明細</td>
				<td></td>
				<td>單價</td>
				<td>數量</td>
				<td>小計</td>
				<td></td>
			</tr>
			<c:choose>
				<c:when test="${not empty cart}">
					<c:forEach var='cartitem' items="${cart}">
						<tr class="tr" id="item1">
							<td>
							<img class="itemimg" src="<c:url value='/singlebuy/showitemimage?itemid=${cartitem.itemId}' />" alt="123">
							</td>
							<td class="nametd">
								<p>${cartitem.singleBuyItem.itemname}</p>
							</td>
							<td class="pricetd">
								<p>${cartitem.singleBuyItem.itemprice}</p>
							</td>
							<td class="qtytd">
								<p>${cartitem.quantity}</p>
							</td>
							<td class="totalitempricetd">
								<p>${cartitem.singleBuyItem.itemprice * cartitem.quantity}</p>
							</td>
							<td>
								<form action="<c:url value='/singlebuy/deletecartitem' />" method="POST">
									<input type="hidden" name="deleteitemid" value="${cartitem.itemId}"> 
									<button type="submit" class="trash">
							            <i class="fas fa-trash-alt"></i>
							        </button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
		                <td colspan="6">
		                    <h2 class="h3">購物車沒有商品</h2>
		                </td>
		            </tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	<div class="tablediv">
		<form action="<c:url value='/singlebuy/goorder' />" id="form123"  method="POST">
<!-- 		<form action="https://www.ezship.com.tw/emap/rv_request_web.jsp"  method="POST"> -->
			<table class="itemtable1">
				<tr>
					<td class="paytd">
						<span>收件人姓名：</span><input type="text" size="30" id="address" name="name" value="${member3.name}"><br>
						<span>收件人電話：</span><input type="text" size="30" id="address" name="phonenumber" value="${member3.phonenumber}"><br>  
						<span>支付方式：</span> 
						<select name="paymethod" id="paymethod">
								<option value="貨到付款">貨到付款</option>
								<option value="信用卡">信用卡</option>
								<option value="ATM轉帳">ATM轉帳</option>
						</select><br> 
						<span>配送方式：</span> 
						<select name="deliverymethod" id="deliverymethod">
								<option value="宅配到家">宅配到家</option>
								<option value="超商取貨">超商取貨</option>
						</select><br> 
						<span>地址：</span><input type="text" size="30" id="address" name="address" value="${member3.address}">
					</td>
					<td>
						<h4 class="h2">商品總額：${itemtotalprice}</h4>
						<h4 class="h2">運費：${deliveryfee}</h4>
						<h4 class="h2">總額：${totalprice}</h4> 
						
						<input type="hidden" name="rv_name" value="謝無忌">
					    <input type="hidden" name="rv_email" value="simulate_receiver@ezship.com.tw">
					    <input type="hidden" name="rv_mobil" value="0967123456">
					    <input type="hidden" name="order_id" value="155922">
					    <input type="hidden" name="su_id"  value="buyer@myweb.com.tw">
					    <input type="hidden" name="rv_amount" value="0">
					    <input type="hidden" name="webtemp" value="simulationpage">
					    <input type="hidden" name="rturl"  value="http://localhost:9090/springapp/singlebuy/chooseshop">

						<input type="hidden" name="itemtotalprice" value="${itemtotalprice}"> 
						<input type="hidden" name="deliveryfee" value="${deliveryfee}"> 
						<input type="hidden" name="totalprice" value="${totalprice}"> 
						<input type="submit" id="submitbtn" value="下訂" id="orderbtn">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<br>
	<br>
	<script>
		let theForm = document.getElementById('form123');
		let theSelect = document.getElementById('deliverymethod');
		let theBtn = document.getElementById('submitbtn');
		theSelect.addEventListener("change", change);
		
		function change(){
			
			let deliverymethod = document.getElementById('deliverymethod').value;
			
			if (deliverymethod == "超商取貨") {
				theForm.action="https://www.ezship.com.tw/emap/rv_request_web.jsp";
				theBtn.value="選取門市"
				console.log(123);
				
            } else {
            	theForm.action="<c:url value='/singlebuy/goorder' />";
            	theBtn.value="下訂"
            	console.log(456);
            }
			
			
		}
		
	</script>
	
	<jsp:include page="../footer.jsp" />
</body>
</html>