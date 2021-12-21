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
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
<style>
.card-body1{
	width: 1480px;
	margin: 0px auto;
	margin-bottom: 0;
	text-align: center;
	font-size: 15px;
	font-weight: bolder;
	border: gray 2px solid;
	padding: 15px;
	box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, 0.2);
	border-radius: 8px;
}
th{
text-align: center;
}
td p {
	margin: 0;
	padding: 0;
	line-height: 20px;
	font-size: 20px;
	font-weight: normal;
}

.idtd {
	width: 100px;
}
.nametd {
	width: 170px;
}
.phonenumbertd {
	width: 170px;
}
.pricetd {
	width: 100px;
}

.timetd {
	width: 170px;
}

.timetd p {
	margin-top:10px;
}

.pricetd {
	width: 110px;
}

.qtytd {
	width: 280px;
}

.totalitempricetd {
	width: 150px;
	line-height: 40px;
}

.totalitempricetd a {
	font-size: 20px;
	font-weight: normal;
	color: black;
}

.h1 {
	text-align: center;
	margin: 30px 0;
}

.tr {
	height: 100px;
}

.row{
	width: 1500px;
	margin: 30px auto;
	
}
.col-xl-6{
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
					<h2 class="h1">訂單列表</h2>
					
						<div class="row">
                            <div class="col-xl-6">
                            	<div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie me-1"></i>
                                        商品種類收入
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        月營業額
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                </div>
                            </div>
                        </div>
					
					
					<div class="card mb-4" style="border:0px;">
					
                            <div class="card-body1">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">訂單編號</th>
                                            <th style="text-align: center;">收件人姓名</th>
                                            <th style="text-align: center;">收件人電話</th>
                                            <th style="text-align: center;">付款總額</th>
                                            <th style="text-align: center;">下訂時間</th>
                                            <th style="text-align: center;">配送方式</th>
                                            <th style="text-align: center;">地址</th>
                                            <th style="text-align: center;">狀態</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                             <c:forEach items='${orders}' var='order'>
								<tr class="tr" id="item1">
									<td class="idtd" style="vertical-align:middle;">
										<p>${order.orderid}</p>
									</td>
									<td class="nametd" style="vertical-align:middle;">
										<p>${order.name}</p>
									</td>
									<td class="phonenumbertd" style="vertical-align:middle;">
										<p>${order.phonenumber}</p>
									</td>
									<td class="pricetd" style="vertical-align:middle;">
										<p>${order.totalprice}元</p>
									</td>
									<td class="timetd" style="vertical-align:middle;">
										<p>${order.orderTime}</p>
									</td>
									<td class="pricetd" style="vertical-align:middle;">
										<p>${order.deliverymethod}</p>
									</td>
									<td class="qtytd" style="vertical-align:middle;">
										<p>${order.address}</p>
									</td>
									<c:choose>
										<c:when test="${(order.cancelstatus).equals('配送中')}">
											<td class="totalitempricetd" style="vertical-align:middle;"><a
												href="<c:url value='/admin/product/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：配送中</p> <a
												href="<c:url value='/singlebuy/finishorder?orderid=${order.orderid}' />">確認完成</a>
											</td>
										</c:when>
										<c:when test="${(order.cancelstatus).equals('等待取消')}">
											<td class="totalitempricetd" style="vertical-align:middle;"><a
												href="<c:url value='/admin/product/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：等待取消</p> <a
												href="<c:url value='/singlebuy/confirmcancel?orderid=${order.orderid}' />">確認取消</a>
											</td>
										</c:when>
										<c:when test="${(order.cancelstatus).equals('取消完成')}">
											<td class="totalitempricetd" style="vertical-align:middle;"><a
												href="<c:url value='/admin/product/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：訂單取消</p></td>
										</c:when>
										<c:otherwise>
											<td class="totalitempricetd" style="vertical-align:middle;"><a
												href="<c:url value='/admin/product/orderdetail?orderid=${order.orderid}' />">詳細資料</a>
												<p>狀態：訂單完成</p></td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
                                    
                                    
                                    
                                    </tbody>
                                </table>
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
	<script src="<c:url value='/js/datatables-simple-demo.js' />"></script>
	
	<script type="text/javascript">
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
		  type: 'pie',
		  data: {
		    labels: ["${itemTotalPrice[0][0]}", "${itemTotalPrice[1][0]}", "${itemTotalPrice[2][0]}", "${itemTotalPrice[3][0]}", "${itemTotalPrice[4][0]}"],
		    datasets: [{
		      data: [${itemTotalPrice[0][1]}, ${itemTotalPrice[1][1]}, ${itemTotalPrice[2][1]}, ${itemTotalPrice[3][1]}, ${itemTotalPrice[4][1]}],
		      backgroundColor: ['#7E6B6B', '#95C0D0', '#F2825C', '#F6BE61', '#AC4242', '#A9D18E'],
		    }],
		  },
		});
	</script>
	
	<script type="text/javascript">
		var ctx = document.getElementById("myBarChart");
		var myLineChart = new Chart(ctx, {
		  type: 'bar',
		  data: {
		    labels: ["6月", "7月", "8月", "9月", "10月", "11月"],
		    datasets: [{
		      label: "營業額",
		      backgroundColor: "rgba(126, 107, 107,0.6)",
		      borderColor: "rgba(2,117,216,1)",
		      data: [${totalIncome[0][1]}, ${totalIncome[1][1]}, ${totalIncome[2][1]}, ${totalIncome[3][1]}, ${totalIncome[4][1]}, ${totalIncome[5][1]}],
		    }],
		  },
		  options: {
		    scales: {
		      xAxes: [{
		        time: {
		          unit: 'month'
		        },
		        gridLines: {
		          display: false
		        },
		        barPercentage:0.7
		      }],
		      yAxes: [{
		        ticks: {
		          min: 0,
		          maxTicksLimit: 7
		        },
		        gridLines: {
		          display: true
		        }
		      }],
		    },
		    legend: {
		      display: false
		    }
		  }
		});
	</script>
	
</body>
</html>
