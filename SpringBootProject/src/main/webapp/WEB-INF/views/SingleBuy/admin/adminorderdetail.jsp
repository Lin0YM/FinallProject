<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>方便購後台管理</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
	
	<style>
	.tablediv {
	width: 950px;
	margin: 20px auto;
	background-color: white;
	font-size: 17px;
	line-height: 1.5em;
}

.itemtable {
	width: 950px;
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
	padding:15px;
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
	height: 220px;
	width: 220px;
	object-fit: cover;
}

.nametd {
	width: 350px;
}

.pricetd {
	width: 120px;
}

.qtytd {
	width: 80px;
}

.totalitempricetd {
	width: 120px;
}

.h1 {
	text-align: center;
	margin: 30px 0;
	color: black;
}

.h2 {
	text-align: right;
	line-height: 25px;
	font-size: 19px;
	font-weight:bolder;
	margin: 5px ;
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
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<span class="navbar-brand ps-3">方便購</span>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
			id="sidebarToggle" href="#!">
			<i class="fas fa-bars"></i>
		</button>
		<!-- Navbar Search-->
		<form
			class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		</form>
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
				role="button" data-bs-toggle="dropdown" aria-expanded="false"><i
					class="fas fa-user fa-fw"></i></a>
				<ul class="dropdown-menu dropdown-menu-end"
					aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="<c:url value='/' />">回首頁</a></li>
					<li><hr class="dropdown-divider" /></li>
					<li><a class="dropdown-item" href="<c:url value='/member/logout' />">管理員登出</a></li>
				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link" href="<c:url value='/member/Retrieve2' />">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 會員管理
						</a> 
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts" aria-expanded="false"
							aria-controls="collapseLayouts">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 網購管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<c:url value='/admin/product/singlebuyitemlist' />">商品管理</a>
								<a class="nav-link" href="<c:url value='/admin/product/orderlist' />">訂單管理</a>  
							</nav>
						</div> 

						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts1" aria-expanded="false"
							aria-controls="collapseLayouts1">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 團購管理
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts1"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<c:url value='/admin/product/shoplist' />">廠商管理</a>  <a
									class="nav-link" href="<c:url value='/groupBuyadmin' />">團購訂單管理</a>
							</nav>
						</div>

						<a class="nav-link" href="<c:url value='/adminforum' />">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 討論區管理
						</a> <a class="nav-link" href="<c:url value='/admin' />">
							<div class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> 許願池管理
						</a> 
						
						
						<a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
							data-bs-target="#collapseLayouts2" aria-expanded="false"
							aria-controls="collapseLayouts1">
							<div class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> 二手商品交易專區
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div>
						</a>
						<div class="collapse" id="collapseLayouts2"
							aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="<c:url value='/addminfind/goodslist' />">二手上架商品清單</a> 
								<a class="nav-link" href="<c:url value='/addminfind/orderrecord' />">查詢會員商品下訂紀錄</a>
								<a class="nav-link" href="<c:url value='/addminfind/toscopepage' />">查詢會員商品購買評論</a>
							</nav>
						</div>
						
						
						
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Logged in as:</div>
					Easy Shopping
				</div>
			</nav>
		</div>


		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
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
									<td><img class="itemimg"
										src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />"
										alt="123"></td>
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
								<td colspan="2" class="itemtable1">
									<br><br><h4 class="h2">商品總額：${order.itemtotalprice}</h4>
									<h4 class="h2">運費：${order.deliveryfee}</h4>
									<h4 class="h2">總額：${order.totalprice}</h4>
								</td>
							</tr>
						</table>
					</div>
					<div class="goback">
						<a href="<c:url value='/admin/product/orderlist' />">回前頁</a>
					</div>


				</div>
			</main>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/js/scripts.js' />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
</body>
</html>
