
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
        div.home {
            position: absolute;
            background-color: darkturquoise;
            display:inline-block;
        }

        .header {
            position: relative;
            border: 1px solid black;
            height: 80px;
            background: linear-gradient(to right, gray, white)
        }
        
        .headerTittle {
            position: absolute;
            font-size: 30px;
            top: 20px;
            left: 60px;
            /* background-color: royalblue; */
            font-family: 標楷體;
        }

.rightTable {
	border: 1px solid black;
	background-color: cornflowerblue;
}

.member {
	position: absolute;
	right: 0;
}

.returnTop {
	position: fixed;
	right: 0;
	bottom: 0;
}

div.table {
	border: 1px solid black;
	text-align: center;
	width: 800px;
}

table {
	display: inline-block;
}

tr th {
	border: 1px solid black;
}


.btn1 {
	position:relative;
	bottom: 0px;
	left: 650px;
}

.btn1 input {
	margin: 0 30px;
	
}

.buyinfo {
	position: absolute;
	width: 200px;

	background-color: palegreen;
	top: 100px;
}

.people {
	border: 1px solid black;
}


#menu li {
	background-color: cadetblue;
}
#del{
    margin-right: 30px;
}

div.find{
        position: absolute;
        top: 30%;
        left: 45%;
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

/* ===================================================== */

#hover-img .card:hover img {
  transform: scale(1.2);
  transition: 0.3s ease-in-out;
}

.row{
	margin:0px 35px; 
    display: inline-block; 

}
.link{
	position: relative;
	left:80px;
	display: inline-block; 
	margin: 0px 20px;
}
li{
	list-style: none;
}
.goodstable{
	position: relative;
	left: 200px;
	width: 1200px;
}



</style>
</head>

<body>
<div class="head">
    <p class="p1">${member3.username}歡迎</p>
	<h1 style="text-align: center">二手商品交易專區-會員發布商品清單</h1><hr>
	</div>
            
<div class="goodstable">
<section id="hover-img">
  <div class="container py-5">
<c:forEach items='${goodsbymember}' var='good'>
    <div class="row">
      <div class="col-xs-12 col-md-6 col-lg-4 mb-4 mb-lg-0">
        <div class="card overflow-hidden">
          <img style="width: 300px;height: 300px" src="<c:url value='/goods/getPicture/${good.id}' />" class="img-fluid" alt="Loading">
          
          <ul class="list-group list-group-flush">
            <li class="list-group-item text-muted">
              <span class="float-right"><i class="fa fa-calendar mr-1" aria-hidden="true"></i>商品名稱:${good.goodsName}</span><br>
              <span class="float-right"><i class="fa fa-calendar mr-1" aria-hidden="true"></i>商品數量:${good.goodsNum}</span><br>
              <span class="float-right"><i class="fa fa-calendar mr-1" aria-hidden="true"></i>商品單價:${good.goodsPrice}</span><br>
              <span class="float-right"><i class="fa fa-calendar mr-1" aria-hidden="true"></i>商品簡介:${good.goodsInt}</span><br>
            <i class="fa fa-user mr-1" aria-hidden="true"></i>${good.uploadMember}
            </li>
          </ul>
          <div class="card-body">
            <h5 class="card-title mt-3">
            <div class="link">
            <a href="<spring:url value='/goods/update?id=${good.id}' />">修改</a>
            </div><div class="link">
            <a href="<spring:url value='/goods/delete?id=${good.id}' />">刪除</a>
            </div>
            </h5>
          </div>
        </div>
      </div>
    </div>
</c:forEach>
  </div>
</section>
</div>
  <div class="btn1">
     <input type="submit" value="返回功能列表" id="returngoodsinput" name="returngoodsinput">
  </div>
 
     
	
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <!-- jquery ui -->
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
           $(function(){
        	   document.getElementById("returngoodsinput").addEventListener("click",returngoodsinput)
        	   
        	   $( "#menu" ).menu();
        	   $(".carinfo").on("click","#del",function(){
                   $(this).closest("tr").remove()
        	})
        	function returngoodsinput(){
             		location.href="<c:url value='/goods/home' />";
  		        } 
        	
        })
        
        </script>
</body>
</html>