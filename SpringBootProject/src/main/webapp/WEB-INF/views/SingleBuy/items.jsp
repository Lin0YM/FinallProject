<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>網購商品</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
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
	margin-top: 100px;
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
	/* 	position: static; */
}

.itemimg {
	height: 220px;
	width: 220px;
	object-fit: cover;
	border: gray 1px solid;
	border-radius: 5px;
}

.itemtable {
	width: 800px;
	margin: 20px auto;
	margin-bottom: 0;
	text-align: left;
}

td {
	border-bottom: gray 1px dashed;
	padding: 15px 25px;
}

.search {
	width: 800px;
	margin: 0 auto;
	display: flex;
	position: relative;
	padding: 20px 0;
}

.searchform {
	margin: 0 auto;
	height: 25px;
	font-size: 20px;
	color: rgb(126, 107, 107);
}

.searchtext {
	height: 24px;
	font-size: 20px;
}

.searchbtn {
	height: 50px;
	font-size: 18px;
	background-color: rgb(242, 238, 239);
	border: 0;
	color: rgb(126, 107, 107);
	font-size: 20px;
	opacity: .7;
}

.searchbtn:hover {
	opacity: .9;
}

.pricep {
	font-size: 22px;
	opacity: .5;
	margin: 10px 0;
}

td p {
	margin: 0;
}
.itemtd{
        	width: 220px;
        	text-align: left;
        	padding:20px;
        }
.image{
            position: relative;
            width: 220px;
            height: 220px;
        }
        .image__overlay{
            position: absolute;
            top: 1px;
            left: 1px;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            opacity: 0; 
            transition: opacity 0.25s;
            border-radius: 5px;
        }
         .image__overlay > p{ */
             transform: translateY(20px); 
             transition: transform 0.25s; 
         } 
        .image__overlay:hover{
            opacity: 1;
        }
        .image__overlay:hover > p{ 
             transform: translateY(0); 
       } 
        .image__overlay p{
            font-size: 1.2em;
            font-weight: bolder;
            opacity: 0.9;
        }
        .image__overlay i{
            font-size: 2em;
            opacity: 0.7;
        }
</style>
</head>

<body>
	<jsp:include page="../header.jsp" />
	<div id="allpage">
		<aside class="aside">
			<br> <a href="<c:url value='/singlebuy/items' />">所有商品</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=周年慶特惠' />">周年慶特惠</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=商品出清' />">商品出清</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=寵物專區' />">寵物專區</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=保健醫用' />">保健醫用</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=日常百貨' />">日常百貨</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=生活家電' />">生活家電</a><br>
			<a href="<c:url value='/singlebuy/classitems?classification=餐廚用具' />">餐廚用具</a><br>
		</aside>
		<article class="article">
			<br>
			<div class="search">
				<form action="<c:url value='/singlebuy/searchitem' />"
					class="searchform" method="GET">
					<label for="search">搜尋商品：</label><input type="text" size="30"
						id="search" name="search" class="searchtext" placeholder=""></input>
					<button type="submit" class="searchbtn">
						<i class="fas fa-search searchbtn"></i>
					</button>
				</form>
			</div>
			<table class="itemtable">
				<c:forEach items='${items}' var='item' varStatus="status">
					<c:if test="${status.count eq 1 || (status.count-1) % 4 eq 0}">
						<tr class="tr">
					</c:if>

					<td class="itemtd">
						<div class="image  animated fadeIn" onclick="window.location.href='<c:url value='/singlebuy/itempage?itemid=${item.itemid}' />'">
							<img class="itemimg" src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />">
							<div class="image__overlay">
								<i class="fas fa-search"></i>
							</div>
						</div>
						<p class="pricep">NT$ ${item.itemprice}</p>
						<p>${item.itemname}</p>
					</td>
					<c:if test="${status.count % 4 eq 0 || status.count eq 4}">
						</tr>
					</c:if>
				</c:forEach>
			</table>
		</article>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		<jsp:include page="../footer.jsp" />
</body>
</html>