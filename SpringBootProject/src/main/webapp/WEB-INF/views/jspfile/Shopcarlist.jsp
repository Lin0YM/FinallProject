
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

<style>
body {
            font-size: 17px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgb(231, 221, 213);
            line-height: 1.5em;
        }
.carinfo{
	position: relative;

}
.send{
	position: absolute;
	bottom: 0px;
	left: 550px;

}
.return{
	position: absolute;
	bottom: 0px;
	left: 950px;

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
</style>
</head>

<body>
	<div class="head">
    <p class="p1">${member3.username}歡迎</p>
	<h1 style="text-align: center">二手商品交易專區-購物車清單</h1><hr>
	</div>

		<c:url var="goodsorderinsert" value="/goods/shopcartohistory" />
		<form:form method="GET" modelAttribute="goodsorderinsert" action="${goodsorderinsert}" >

			<div style=" height: 550px; position: relative; width: 1200px; left: 150px;">

				<div class="goodsinfo">
					
					
					<div class="carinfo">
						<table>
						<thead>
					        <tr>
					          <th>商品圖示</th>
					          <th>商品類別</th>
					          <th>商品名稱</th>
					          <th>商品單價</th>
					          <th>商品總量</th>
					          <th>會員名稱</th>
					          <th>刪除</th>
					        </tr>
					     <thead>
					     <tbody>
							 <c:forEach items='${ShoppingCartGoodsBean.shopCar}' var='good'>   
							<tr>
								<td><img height="50px" alt="" src="<c:url value='/goods/getPicture/${good.value.bean.id}' />" /></td>
								
								<td>${good.value.bean.goodsType}</td>
								
								<td>${good.value.bean.goodsName}</td>
								
								<td>${good.value.bean.goodsPrice}</td>
								
								<td>${good.value.allCount}</td>
								
								<td>${member3.username}</td>

								<td><a href="<spring:url  value='/goods/shopcar/delete?id=${good.value.bean.id}' />">刪除</a></td>
							</tr>
							</c:forEach>
						</tbody>
                        </table>
                    </div>
                    
            </div>
			</div>
						<div class="send">
						     <input type="submit" id="shopcartohistory" value="送出" onclick="ftest()" >
						</div>
</form:form>
						<div class="return">
						     <input type="submit" id="returngoodsinput" value="返回功能列表">
            			</div>
            

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <!-- jquery ui -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
           $(function(){

        	   document.getElementById("returngoodsinput").addEventListener("click",returngoodsinput);
        	   
               
        	   $( "#menu" ).menu();
        	   $(".carinfo").on("click","#del",function(){
                   $(this).closest("tr").remove();
        	   })

              	function returngoodsinput(){
              		location.href="<c:url value='/goods/home' />";
   		        }      

              	
        })
        </script>
</body>
</html>