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
<script type="text/javascript">
		function returnhome(){
			location.href="<c:url value='/addminfind/toscopepage' />";
		}

</script>
	
	<style>
	.h1 {
		text-align: center;
		margin: 30px 0;
		color: black;
	}
	
/* 	========================================================== */

*, :before, :after {
  box-sizing: border-box;
  margin: 0;
}



body {
  background: radial-gradient(ellipse at center, rgba(0, 0, 0, 0.02) 0%, rgba(0, 0, 0, 0.6) 100%);
  height: 100vh;


  font-family: Roboto;
}

.modal {
  height: 400px;
  width: 650px;
  margin: auto;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.5);
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  font-size: 0;
}

.side {
  background: linear-gradient(-45deg, #001F60, #009DE0);
  height: 100%;
  width: 100%;
  position: relative;
}
.side .skew {
  background: #F6F6F6;
  height: 110%;
  width: 45%;
  padding: 20px;
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.25);
  position: absolute;
  top: -5%;
  z-index: 5;
  transform: skew(8deg);
}
.side .skew * {
  transform: skew(-8deg);
}
.side .skew h3 {
  color: #474747;
  font: 25px Roboto;
  text-align: center;
}
.side .skew img {
  width: 100%;
  margin: 25px 0;
}
.side .skew .btn {
  background: #474747;
  width: 180px;
  margin: 10px auto;
  padding: 10px 18px;
  font-size: 16px;
  text-align: center;
  border-radius: 3px;
  box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.25);
  cursor: default;
}

.header {
  width: 60%;
  position: absolute;
  top: 0;
  right: 0;
}
.header h1 {
  background: linear-gradient(-45deg, #2ed6bc, #01BCE6);
  padding: 10px 25px;
  font: 25px Roboto;
}

.form {
  width: 350px;
  height: 100%;
  position: absolute;
  top: 56px;
  right: 0;
}

input, select, fieldset, button,textarea {
  border: none;
  outline: none;
  font: 16px Roboto;
}

fieldset {
  display: block;
}

label {
  display: block;
  color: #01BCE6;
  font: 500 13px Roboto;
}

input, select,textarea,button {
  background: rgba(255, 255, 255, 0.18);
  padding: 5px 12px;

  border-radius: 3px;

}
input:nth-last-of-type(1), select:nth-last-of-type(1) {
  margin-right: 0;
}

option {
  background: #474747;
}

.number input {
  width: calc(25% - 7px);
}

.name input {
  width: 100%;
}

.exp, .ccv {
  display: inline-block;
}

.exp {
  width: 60%;
}
.exp select {
  width: calc(50% - 5px);
}

.ccv {
  width: 40%;
}
.ccv input {
  width: 100%;
}
.info{
	margin:0px 50px;
	float: left;
}

.info1{
	position:absolute;
	top:75px;
	left:600px;
	margin:0px 50px;
	float: left;
}
.returnbtn{
	position: absolute;
	left: 350px;
	bottom: 52px;
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
					<li><a class="dropdown-item" href="<c:url value='/member/logout' />">登出</a></li>
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
                        <h1 class="mt-4">修改評論資訊</h1>
                                <form action="<c:url value='/admin/scopeupdate' />" method="post" >
										<input id="orderlistid" name="orderlistid" type="hidden" value="${changeordergoodslist.orderlistid}"/>
                                		<p>商品編號:</p>
                                		<p>${changeordergoodslist.orderlistid}</p>
                                		<p>商品類別:</p>
                        				<p><input id="orderitemtype" name="orderitemtype" type="text" value="${changeordergoodslist.orderitemtype}"/></p>
                                		<p>商品名稱:</p>
				                        <p><input id="orderitemname" name="orderitemname" type="text" value="${changeordergoodslist.orderitemname}"/></p>
				                        <p>下單時間:</p>
				                        <p><input id="orderitemfinishdate" name="orderitemfinishdate" type="text" value="${changeordergoodslist.orderitemfinishdate}"/></p>
				                        <p>下訂會員:</p>
				                        <p><input id="orderitemusername" name="orderitemusername" type="text" value="${changeordergoodslist.orderitemusername}"/></p>
				                        <p>下訂評價:</p>
				                        <p><input id="goodsscope" name="goodsscope" type="text" value="${changeordergoodslist.goodsscope}"/></p>
				                        
				                        <p><input type="submit" value="送出" id="submit"/></p>
  
                                </form>
                                <div class="returnbtn">
                                		
                                	<button id="returnlist" onclick="returnhome()">返回清單列</button>
                      			</div>
                      
                    </div>
                </main>
                
            </div>

	</div>
	<script type="text/javascript">
	
	imgInp.onchange = evt => {
		  const [file] = imgInp.files
		  if (file) {
		    blah.src = URL.createObjectURL(file)
		  }
		}
	
	
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="<c:url value='/js/scripts.js' />"></script>
	<script src="<c:url value='/js/datatables-simple-demo.js' />"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
</body>
</html>
