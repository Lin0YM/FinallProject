<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
<script src="<c:url value='/js/datatables-simple-demo.js' />"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>
	
	<style>
	.h1 {
		text-align: center;
		margin: 30px 0;
		color: black;
	}
	</style>
	
</head>
<style>
	table {
		border-collapse: collapse;
		border-spacing: 0;
		margin-bottom: 2em;
		width: 50%;
		margin-left:auto; 
		margin-right:auto;
	}

		table tbody tr {
			border-top: solid 1px #E5E5E5;
		}

			table tbody tr:first-child {
				border-top: 0;
			}

		table td {
			padding: 0.75em 1em 0.75em 1em;
		}

		table th {
			text-align: left;
			font-weight: bold;
			padding: 0.75em 1em 0.75em 1em;
		}

		table thead {
			background: #878787;
			color: #fff;
			font-weight: 400;
			text-transform: uppercase;
			border: 0;
			box-shadow: 0.125em 0.175em 0 0 rgba(0, 0, 0, 0.125);
			font-size: 0.85em;
			letter-spacing: 2px;
		}

		table tfoot {
			background: #F0F0F0;
			border-top: solid 2px #E5E5E5;
		}
	.ccenter{
		align:center;margin-left:auto;margin-right:auto;
	}	
</style>
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
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                上架商品清單列表
							</div>
                            <div class="card-body">
                                			<form:form method='POST' modelAttribute="wishpoolBean" action='adminwish' enctype="multipart/form-data">
												<table>
													<c:if test='${wishpoolBean.wishpoolId != null}'>
<%-- 									                 	<form:hidden path="wishpoolId" /><br>&nbsp; --%>
									                 	<form:hidden path="createtime" value="${wishpoolBean.createtime}" /><br>&nbsp;
									                 		<tr>
																<td align='right'>ID：</td>
																<td>${wishpoolBean.wishpoolId}&nbsp;
																</td>
															</tr>
													</c:if>
														<tr>
															<td align='right'>標題：</td>
															<td width="50%"><form:input path="title" size="25"/>
																<form:errors path="title" cssClass="error" />&nbsp;
															</td>
														</tr>
														<tr>
															<td align='right'>內容：
															</td>
															<td><form:textarea path="content" size="200" /><br>
															    <form:errors path="content" cssClass="error" />
															</td>
														</tr>
														<c:choose>
															<c:when test='${wishpoolBean.wishpoolId != null}'>
																<tr>
																	<td align='right'>修改圖片:
																	</td>
																	<td><form:input id="productImage" path="productImage" type='file' class='form:input-large' onclick="change()"/><br>
																	</td>							
																</tr>
																<tr>
																	<td align='right'>
																	</td>
																	<td><img src="<c:url value='/getPicture/${wishpoolBean.wishpoolId}' />" id="changeImage" width="300" style="display:block; margin:auto;"><br>
																	</td>							
																</tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<td align='right'>上傳圖片:
																	</td>
																	<td><form:input path="productImage" type='file'/><br>
																	</td>							
																</tr>
																
																<tr>
																	<td align='right'>分類:
																	</td>
																	<td>
																		<form:select path="sort">
															                <form:option value="live">生活、居家</form:option>
															                <form:option value="sport">運動、健身</form:option>
															                <form:option value="food">名產、食品</form:option>
															                <form:option value="careproducts">保養、彩妝</form:option>
															                <form:option value="accessories">飾品、配件</form:option>
															                <form:option value="books">書籍、文創</form:option>
															                <form:option value="game">遊戲、電玩</form:option>
															            </form:select>
																	</td>							
																</tr>
																
															</c:otherwise>
														</c:choose>	
													</table>
														<div align=center style="margin-left:auto;margin-right:auto;width:50%;">
															<input type='submit' value='提交'><hr>
															<c:choose>
																<c:when test='${wishpoolBean.wishpoolId != null}'>
																	<a href="<c:url value='/admin' />"><input type="button" value="回上頁" name="wishpool"></a> 
																</c:when>
																<c:otherwise>
																	<a href="<c:url value='/admin' />"><input type="button" value="回上頁" name="wishpool"></a>
																</c:otherwise>
															</c:choose>	
														</div>            			
											</form:form>
                            </div>
                        </div>
                    </div>
                </main>	               
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
