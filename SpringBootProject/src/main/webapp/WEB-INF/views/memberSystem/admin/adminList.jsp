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
.card-body {
	width: 1700px;
	margin: 0px auto;
	margin-bottom: 0;
	text-align: center;
	font-size: 15px;
	font-weight: bolder;
	border: gray 2px solid;
	padding: 15px;
	box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, 0.2);
}

.pricetd {
	width: 120px;
}

.idtd {
	width: 150px;
}

.timetd {
	width: 200px;
}

.qtytd {
	width: 20%;
}

.h1 {
	text-align: center;
	margin: 30px 0;
}

input {
	padding: 5px 15px;
	background: #ccc;
	border: 0 none;
	cursor: pointer;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	font-weight: bold;
	margin-bottom: 10px;
}
/*表格偶數行顏色*/
tbody tr:nth-child(even) {
	background: #F5EAEA
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
					<li>
						<hr class="dropdown-divider" />
					</li>
					<li><a class="dropdown-item"
						href="<c:url value='/member/logout' />">管理員登出</a></li>
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
					<h2 class="h1">會員管理</h2>
					<input class="btn btn-secondary" type="button" value="新增使用者"
						onclick="location.href='<c:url value='/member/addNew' />'">&nbsp;&nbsp;&nbsp;
					<input class="btn btn-secondary" type="button" value="總查詢"
						onclick="location.href='<c:url value='/member/adminList' />'">&nbsp;&nbsp;&nbsp;
					<input class="btn btn-secondary" type="button" value="編號查詢"
						onclick="location.href='<c:url value='/member/searchById' />'">&nbsp;&nbsp;&nbsp;
					<input class="btn btn-secondary" type="button" value="帳戶查詢"
						onclick="location.href='<c:url value='searchByUsername' />'">

					<div class="card mb-4" style="border: 0px;">
						<div class="card-body">
							<table id="datatablesSimple">

								<thead>
									<tr>
										<th style="text-align: center;">編號</th>
										<th style="text-align: center;">姓名</th>
										<th style="text-align: center;">電話號碼</th>
										<th style="text-align: center;">電子郵件</th>
										<th style="text-align: center;">地址</th>
										<th style="text-align: center;">權限</th>
										<th style="text-align: center;">狀態</th>
										<th style="text-align: center;">狀態變更</th>
										<th style="text-align: center;">個資變更</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items='${members}' var='member'>
										<tr class="tr" id="item1">
											<td style="vertical-align: middle;" class="pricetd">${member.id}</td>
											<td style="vertical-align: middle;" class="idtd">${member.name}</td>
											<td style="vertical-align: middle;" class="timetd">${member.phonenumber}</td>
											<td style="vertical-align: middle;" class="pricetd">${member.emailaddress}</td>
											<td style="vertical-align: middle;" class="qtytd">${member.address}</td>
											<td style="vertical-align: middle;" class="pricetd">${member.status}</td>
											<td style="vertical-align: middle;" class="pricetd">${member.act_level}</td>
											<td style="vertical-align: middle;" class="idtd"><c:choose>
													<c:when test="${member.act_level.equals('停權')}">
														<input style="margin: 8px;" type="button"
															class="btn btn-dark btn-sm" value="啟用"
															onclick="location.href='enable/${member.id}'">
													</c:when>
													<c:otherwise>
														<input style="margin: 8px;" type="button"
															class="btn btn-danger btn-sm" value="帳號停用"
															onclick="location.href='disable/${member.id}'">
													</c:otherwise>
												</c:choose></td>
											<td style="vertical-align: middle;" class="idtd"><input
												style="margin: 8px;" type="button"
												class="btn btn-primary btn-sm" value="修改"
												onclick="location.href='edit/${member.id}'"> <input
												style="margin: 8px;" type="button"
												class="btn btn-secondary btn-sm" value="刪除"
												onclick="location.href='delete?id=${member.id}'"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
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
	<script src="<c:url value='/js/datatables-simple-demo.js' />"></script>

</body>

</html>
