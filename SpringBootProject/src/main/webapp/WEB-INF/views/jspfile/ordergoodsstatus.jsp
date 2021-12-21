<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品訂單狀態</title>
<script type="text/javascript">
	function orderconfirm(id)
	{
	    var content = document.getElementById("orderconfirmstatus");
	    document.getElementById(id).textContent=content.value;
		document.forms[0].action = "<c:url value='/goods/checkstatusconfirm/" + id + "' />";
	    
	}
	
	function ordercancel(id)
	{
	    var content = document.getElementById("ordercancelstatus");
	    document.getElementById(id).textContent=content.value;
	    document.forms[0].action = "<c:url value='/goods/checkstatuscancel/" + id + "' />";
	    
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
	left: 700px;
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
	<h1 style="text-align: center">二手商品交易專區-商品出售狀態</h1><hr>
	</div>
	<form method="GET" >
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
					          <th>商品確認出貨</th>
					          <th>商品取消出貨</th>
						        </tr>
						     </thead>
							<tbody>
							 <c:forEach items='${ordergoodslist}' var='good'>   
							<tr>
								<td>${good.orderlistid}</td>
								<td>${good.orderitemtype}</td>
								<td>${good.orderitemname}</td>
								<td>${good.orderitemtotalcount}</td>
								<td>${good.orderitemsingleprice}</td>
								<td>${good.orderitemsumprice}</td>
								<td>${good.orderitemfinishdate}</td>
								<input type="hidden" id="orderconfirmstatus" value="商品確認出貨">
								<input type="hidden" id="ordercancelstatus" value="商品取消出貨">
								<input type="hidden" name="" id="changestatus" value="">
								<td><p id="${good.orderlistid}">${good.goodstransationstatus}</p></td>
								<td><input type="submit"  id="com${good.orderlistid}" value="確認出貨" onclick="orderconfirm('${good.orderlistid}')"></td>
								<td><input type="submit"  id="can${good.orderlistid}" value="取消出貨" onclick="ordercancel('${good.orderlistid}')"></td>
							</tr>
							</c:forEach>
							</tbody>
                        </table>
                    </div>
         </form>
 
         <form method="get" action="<c:url value='/goods/homelist' />">
				<div class="btn1">
                    <input type="submit" value="返回功能列表"  name="returngoodsinput">
                </div>
         </form>

</body>
</html>