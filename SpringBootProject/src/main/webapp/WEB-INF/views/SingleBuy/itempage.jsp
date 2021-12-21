<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>${item.itemname}</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

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
	margin-top: 40px;
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
	margin-top: 15px;
	height: 450px;
	width: 450px;
	object-fit: cover;
	border-radius: 5px;
	border: 1px rgb(126, 107, 107) solid;
}

.itemtable {
	width: 1100px;
	margin: 20px 0;
	margin-left: 50px;
	margin-bottom: 0;
	text-align: center;
}

td {
	border-bottom: gray 2px dashed;
	padding-bottom: 15px;
}

.noline {
	border-bottom: 0;
}

.itemintro {
	width: 650px;
	text-align: left;
	padding-left: 20px;
}

.introp {
	line-height: 40px;
	font-size: 18px;
	margin-top: 17px;
}

.itemintro span {
	line-height: 40px;
	font-size: 18px;
}

.itemintro a {
	text-decoration: none;
	border: gray 1px solid;
	background-color: rgb(239, 239, 239);
	color: black;
	padding: 2px;
}

#qty {
	height: 30px;
	font-size: 23px;
	font-weight: bolder;
}

.button {
	width: 40px;
	height: 40px;
	vertical-align: bottom;
	font-size: 25px;
	background-color: rgb(242, 238, 239);
	border: 0;
	color: rgb(126, 107, 107);
	opacity: .7;
}

.button:hover {
	opacity: 1;
}

.h3 {
	text-align: center;
	margin-top: 40px;
	margin-bottom: 0;
	color: rgb(126, 107, 107);
}

.h4 {
	text-align: center;
	margin-top: 13px;
	margin-bottom: 16px;
	color: rgb(126, 107, 107);
}

.itemimg1 {
	margin-top: 15px;
	height: 170px;
	width: 170px;
	object-fit: cover;
	border: gray 1px solid;
}

.itemtable2 {
	width: 1100px;
	margin-bottom: 0;
	text-align: center;
}

.itemtd {
	width: 220px;
}

.cart {
	font-size: 30px;
	background-color: rgb(242, 238, 239);
	border: 0;
	color: rgb(126, 107, 107);
	text-decoration: none;
	opacity: .7;
}

.cart:hover {
	opacity: 1;
}

.pricep {
	font-size: 30px;
	opacity: .5;
	margin: 0;
	margin-top: 40px;
}

.alerta {
	color: rgb(126, 107, 107);
	text-decoration: none;
	font-weight: bolder;
	font-size: 22px;
}

.wrap {
	width: 1100px;
	height: 220px;
	margin: 0 auto;
	position: relative;
	overflow: hidden;
	border-bottom:6px rgb(126, 107, 107) double;
}

.slide-img {
	margin: 0;
	padding: 0;
	list-style: none;
	position: absolute;
	width: 1540px;
	display: flex;
	transition: .6s;
}

.slide-img li {
	width: 180px;
	height: 180px;
	padding: 20px
}

.slide-img li img {
	width: 180px;
	height: 180px;
	object-fit: cover;
}

.slide-arrow {
	position: absolute;
	width: 40px;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1;
	font-size: 36px;
	cursor: pointer;
	color: rgb(126, 107, 107);
	opacity: .8;
}

.slide-arrow:hover {
	opacity: 1;
}

.slide-arrow.right {
	right: 0;
}

.image {
	position: relative;
	width: 180px;
}

.image__overlay {
	position: absolute;
	top: 1px;
	left: 1px;
	width: 180px;
	height: 180px;
	background-color: rgba(0, 0, 0, 0.6);
	color: white;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	opacity: 0;
	transition: opacity 0.25s;
}

.image__overlay>p {
	transform: translateY(20px);
	transition: transform 0.25s;
}

.image__overlay:hover {
	opacity: 0.8;
}

.image__overlay:hover>p {
	transform: translateY(0);
}

.image__overlay p {
	font-size: 1em;
	font-weight: bolder;
	opacity: 0.9;
	padding: 10px;
	margin-top: 15px;
}

.image__overlay i {
	font-size: 2em;
	opacity: 0.7;
}

.item {
	border: 1px rgb(126, 107, 107) solid;
	border-radius: 5px;
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
			<table class="itemtable">
				<tr>
					<td><img class="itemimg"
						src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />">
					</td>
					<td class="itemintro">
						<h1>${item.itemname}</h1>
						<p class="pricep">NT$ ${item.itemprice} /${item.priceunit}</p>
						<p class="introp">商品介紹：${item.itemintro}</p> <c:choose>
							<c:when test="${loginCheck.equals('true')}">
								<span>數量：</span>
								<button id="btnReduce" onclick="btnReduce()" class="button">
									<i class="fas fa-minus"></i>
								</button>
								<input type="text" size="1" id="qty" value="1"
									onchange="qtychange()">
								<button id="btnAdd" onclick="btnAdd()" class="button">
									<i class="fas fa-plus"></i>
								</button>
								<br>
								<br>
								<br>
								<form action="<c:url value='/singlebuy/addcart' />"
									class="cartform" id="cartform" method="POST">
									<input type="hidden" name="quantity" id="quantity" value="1" />
									<input type="hidden" name="gocartitemid" value="${item.itemid}" />
								</form>
								<button class="cart" id="cart" onclick="addalert()">
									<i class="fas fa-cart-plus">加入購物車</i>
								</button>
							</c:when>
							<c:otherwise>
								<span>數量：</span>
								<button id="btnReduce" onclick="btnReduce()" class="button">
									<i class="fas fa-minus"></i>
								</button>
								<input type="text" size="1" id="qty" name="quantity" value="1">
								<input type="hidden" name="quantity" id="quantity" value="1" />
								<button id="btnAdd" onclick="btnAdd()" class="button">
									<i class="fas fa-plus"></i>
								</button>
								<br>
								<br>
								<br>
								<button onclick="goalert()" class="cart">
									<i class="fas fa-cart-plus">加入購物車</i>
								</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</table>
			<h2 class="h3">【 ${item.classification} 】</h2>
			<h4 class="h4">推 / 薦 / 商 / 品</h4>
			<div class="wrap">
                <a class="slide-arrow" id="slidePrev"><i class="fas fa-chevron-left"></i></a>
                <a class="slide-arrow right" id="slideNext"><i class="fas fa-chevron-right"></i></a>
                <ul class="slide-img" id="slide-img">
                    <c:forEach var='item' items="${recommendItems}">
	                    <li>
	                        <div class="image" onclick="window.location.href='<c:url value='/singlebuy/itempage?itemid=${item.itemid}' />'">
	                            <a href="#">
	                                <img class="item" src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />">
	                            </a>
	                            <div class="image__overlay">
	                                <br><i class="fas fa-search searchbtn"></i>
	                                <p>${item.itemname}</p>
	                            </div>
	                        </div>
	                    </li>
					</c:forEach>
                </ul>
            </div>
		</article>
	</div>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="<c:url value='/js/jquery-3.6.0.js' />"></script>
	<script>
		function btnAdd() {
			var value = document.getElementById("qty").value;
			value = Number(value) + 1;
			document.getElementById("qty").value = value;
			document.getElementById("quantity").value = value;
		}

		function btnReduce() {
			var value = Number(document.getElementById("qty").value);
			if (value <= 1) {
				value = 1;
			} else {
				value -= 1;
			}
			document.getElementById("qty").value = value;
			document.getElementById("quantity").value = value;
		}

		function qtychange() {
			var value = document.getElementById("qty").value;
			document.getElementById("quantity").value = value;
		}

		function goalert() {
			Swal
					.fire({
						icon : 'warning',
						title : '請先登入！',
						footer : '<a href="<c:url value='/member/loginPage' />" class="alerta">登入往這</a>'
					})
		}

		function addalert() {
			Swal.fire({
				icon : 'success',
				title : '已成功加入購物車！',
				showConfirmButton : false,
				timer : 1500
			}).then(function(result) {
				if (true) {
					$("#cartform").submit();
				}
			})
		}
		
		$(function () {
            let index = 0;
            let slideMove = 0;
            $('#pages li').eq(0).css('background-color', 'white')
            $('#pages li').on('mouseenter', function () {
                index = $(this).index()
                console.log(index)
                moveImg()
            })
            let slideCount = $('#slide-img li').length
            console.log(slideCount)
            $('#slideNext').on('click', function () {
                index++;
                if (index >= 3) {
                    index = 0;
                }
                moveImg()
            })
            $('#slidePrev').on('click', function () {
                index--;
                if (index < 0) {
                    index = slideCount - 1
                }
                moveImg()
            })

            function moveImg() {
                slideMove = 0 - 220 * index;
                $('#slide-img').css('left', slideMove)
                $("#pages li").eq(index).css('background-color', 'white')
                    .siblings().css('background-color', '')
            }
        })
	</script>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../footer.jsp" />
</body>
</html>