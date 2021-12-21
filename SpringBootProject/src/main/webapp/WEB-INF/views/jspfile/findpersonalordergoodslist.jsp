
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.management.Attribute"%>
<%@page import="java.io.Console"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>二手商品交易專區購物車資料</title>
<!-- menu1  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jquery ui -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
	
<script type="text/javascript">

	function scope(id){
		location.href="<c:url value='/goods/shopcartohistory/" +id+ "' />";
	}
	
	
	function returnpage(){
		location.href="<c:url value='/goods/homelist' />";
	}
	
	function greentest(){
		
		var goodsitme=$("#ItemName").val();
		var ordergoodnum=$("#ordergoodnum").val();
		var MerchantTradeNo=$("#MerchantTradeNo").val();
		var MerchantTradeDate=$("#MerchantTradeDate").val();
		var ordergoodprice=$("#ordergoodprice").val();
		var TotalAmount=$("#TotalAmount").val();
		var TradeDesc=$("#TradeDesc").val();
		var ReturnURL=$("#ReturnURL").val();

		var params={"ItemName":goodsitme,
				"CustomField1":ordergoodnum,
				"MerchantTradeNo":MerchantTradeNo,
				"MerchantTradeDate":MerchantTradeDate,
				"TotalAmount":TotalAmount,
				"TradeDesc":TradeDesc,
				"ReturnURL":ReturnURL};
	
		$.ajax({
			type:'post',
			url:'<c:url value="/greentestx/sends" />',
			contentType:'application/json; charset=utf-8',
			data:JSON.stringify(params),
			success:function(data){
				console.log(data);
				$(data).appendTo("#greentext");
					
					},
			error:function(e){
					console.log(e);
				}
				
			});
	}
	

</script>

<style>
body {
            font-size: 17px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgb(231, 221, 213);
            line-height: 1.5em;
        }

/* ================================================================= */
table {
  border-spacing: 1;
  border-collapse: collapse;
  background: white;
  border-radius: 6px;
  overflow: hidden;
  max-width: 1000px;
  width: 100%;
  margin: 0 auto;
  position: relative;
}
table * {
  position: relative;
}
table td, table th {
  padding-left: 8px;
}
table thead tr {
  height: 60px;
  background: #FFED86;
  font-size: 16px;
}
table tbody tr {
  height: 48px;
  border-bottom: 1px solid #E3F1D5;
}
table tbody tr:last-child {
  border: 0;
}
table td, table th {
  text-align: left;
}
table td.l, table th.l {
  text-align: right;
}
table td.c, table th.c {
  text-align: center;
}
table td.r, table th.r {
  text-align: center;
}

@media screen and (max-width: 35.5em) {
  table {
    display: block;
  }
  table > *, table tr, table td, table th {
    display: block;
  }
  table thead {
    display: none;
  }
  table tbody tr {
    height: auto;
    padding: 8px 0;
  }
  table tbody tr td {
    padding-left: 45%;
    margin-bottom: 12px;
  }
  table tbody tr td:last-child {
    margin-bottom: 0;
  }
  table tbody tr td:before {
    position: absolute;
    font-weight: 700;
    width: 40%;
    left: 10px;
    top: 0;
  }
  table tbody tr td:nth-child(1):before {
    content: "Code";
  }
  table tbody tr td:nth-child(2):before {
    content: "Stock";
  }
  table tbody tr td:nth-child(3):before {
    content: "Cap";
  }
  table tbody tr td:nth-child(4):before {
    content: "Inch";
  }
  table tbody tr td:nth-child(5):before {
    content: "Box Type";
  }
}

th .totalcount{
	text-align: center;
}

blockquote {
  color: white;
  text-align: center;
}

h1 {
            display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;

        }

.p1{ 
 	 display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;
 	 	position:absolute; 
 	 	top: 0; 
 	 	right: 0; 
 	 }
.btn1{
	position: absolute;
	left: 730px;
}
thead tr th{
	text-align: center;
}

tbody tr td{
	text-align: center;
}

</style>
</head>

<body>
	<div class="head">
    <p class="p1">${member3.username}歡迎</p>
	<h1 style="text-align: center">二手商品交易專區-商品下訂狀態</h1><hr>
	</div>
	<div id="greentext"></div>


				<div class="goodsinfo">
					
					
					<div class="carinfo">
						<table>
						<thead>
					        <tr>
					          <th>商品編號</th>
					          <th>商品類別</th>
					          <th>商品名稱</th>
					          <th>商品數量</th>
					          <th>商品單價</th>
					          <th>商品總價</th>
					          <th>下單時間</th>
					          <th>下單狀態</th>
					          <th>付款確認</th>
					          <th>評論</th>
					        </tr>
					     </thead>
					     <tbody>
							 <c:forEach items='${ordergoodslist}' var='good'>   
							<tr>
								<td>${good.orderlistid}</td>
								<input type="hidden" id="MerchantTradeNo" name="MerchantTradeNo" value="${good.orderlistid}">
								<td>${good.orderitemtype}</td>
								<input type="hidden" id="TradeDesc" name="TradeDesc" value="${good.orderitemtype}">
								<td>${good.orderitemname}</td>
								<input type="hidden" id="ItemName" name="ItemName" value="${good.orderitemname}">
								<td>${good.orderitemtotalcount}</td>
								<input type="hidden" id="ordergoodnum" name="ordergoodnum" value="${good.orderitemtotalcount}">
								<td>${good.orderitemsingleprice}</td>
								<input type="hidden" id="ordergoodprice" name="ordergoodprice" value="${good.orderitemsingleprice}">
								<td>${good.orderitemsumprice}</td>
								<input type="hidden" id="TotalAmount" name="TotalAmount" value="${good.orderitemsumprice}">
								<td>${good.orderitemfinishdate}</td>
								<input type="hidden" id="MerchantTradeDate" name="MerchantTradeDate" value="2012/03/21 15:40:18">
								<td>${good.goodstransationstatus}</td>
								
								<input type="hidden" id="ReturnURL" name="ReturnURL" value="http://localhost:9090/springapp/goods/ordergoodslist">
								<c:choose>
								<c:when test="${good.goodstransationstatus eq '確認出貨'}">
								<td><input type="button" value="付款" name="${good.orderlistid}" onclick="greentest()"></td>
								</c:when>
								<c:when test="${good.goodstransationstatus eq '已付款'}">
								<td></td>
								</c:when>
								<c:when test="${good.goodstransationstatus eq '取消出貨'}">
								<td></td>
								</c:when>
								<c:when test="${good.goodstransationstatus eq '請等候賣家....'}">
								<td></td>
								</c:when>
								<c:otherwise>
							        <td></td>
							    </c:otherwise>
								</c:choose>	

								<c:choose>
								<c:when test="${good.goodstransationstatus eq '確認出貨'}">
								<td></td>
								</c:when>
								<c:when test="${good.goodstransationstatus eq '取消出貨'}">
								<td></td>
								</c:when>
								<c:when test="${good.goodstransationstatus eq '已付款'}">
								<td><input type="button" value="賣家評論"  name="${good.orderlistid}" onclick="scope('${good.orderlistid}')"></td>
								</c:when>
								<c:when test="${good.goodstransationstatus eq '請等候賣家....'}">
								<td></td>
								</c:when>
								<c:otherwise>
							        <td></td>
							    </c:otherwise>
								</c:choose>	
							</tr>
							</c:forEach>
							</tbody>
                        </table>
                    </div>
            </div>

	

		<div class="btn1">
             <input type="button" value="返回功能列表"  name="returngoodsinput" onclick="returnpage()">
        </div>
       
        
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <!-- jquery ui -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script >
           
        
        $(document).ready(function(){

        	

        });
</script>
</body>
</html>