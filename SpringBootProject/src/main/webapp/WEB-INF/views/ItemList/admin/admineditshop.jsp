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
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" -->
<!-- 	crossorigin="anonymous"></script> -->
<style>
        body {
            font-size: 17px;
            line-height: 1.5em;
        }

        .shopimg {
            height: 250px;
            width: 250px;
            object-fit: cover;
            margin-right:15px;
			border:1px solid rgb(126, 107, 107);
        }
        .intro {
            width: 1100px;
            margin: 0 auto;
            border-bottom: gray 1px dashed;
            display: flex;
            position: relative;
            padding-top: 40px;
            padding-bottom: 20px;
        }
        .introcontext {
            position: relative;
        }
        .tablediv {
            width: 1100px;
            margin: 20px auto;
        }
        .itemtable {
            width: 1100px;
            margin: 0px auto;
            margin-bottom: 0;
            text-align: center;
        }
        td {
        	padding-bottom:15px;
            border-bottom: gray 1px dashed;
        }
        .imgtd {
            width: 200;
        }
        h2{
        	font-weight: bolder;
        }
        p {
            margin: 0;
            padding: 0;
            line-height: 28px;
            font-size: 20px;
        }
        .itemimg {
            margin-top: 15px;
            height: 180px;
            width: 180px;
            object-fit: cover;
            border:1px solid rgb(126, 107, 107);

        }
        .edititemimg {
            height: 170px;
            width: 170px;
            object-fit: cover;
            float: left;
            margin-right: 15px;
            border:1px solid rgb(126, 107, 107);
        }
        .imgtd{
        	width: 200px;
        }
        .nametd{
        	width: 150px;
        }
        .introtd{
        	width: 300px;
        }
        .pricetd{
        	width: 100px;
        }
        .btntd{
        	width: 80px;
        }
        .editshop{
			background-color: white;
			border:0;
			color:rgb(126, 107, 107);
			font-size:22px;
			opacity: .8;
        }
        .editshop:hover{
        	opacity: 1;
        }
        .shopsubmitbtn{
		font-size: 20px;
        background-color: white;
		border:0;
		color:rgb(126, 107, 107);
		text-decoration: none;
		opacity: .8;
		}
		.shopsubmitbtn:hover{
			opacity: 1;
		}
		.edititem{
		font-size: 20px;
        background-color: white;
		border:0;
		color:rgb(126, 107, 107);
		text-decoration: none;
		opacity: .8;
		margin:8px auto;
		}
		.edititem:hover{
			opacity: 1;
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

						    <div class="intro" id="intro">
						        <div>
						            <img class="shopimg" src="<c:url value='/showshopimage?shopid=${shop.id}' />">
						        </div>
						        <div class="introcontext">
						            <form action="shoplist">
						                <br>
						                <h2><c:out value="${shop.shopname}" /></h2>
						                <br>
						                <p><c:out value="${shop.shopintro}" /></p>
						                <br>
						            </form>
						            <button id="editshop" class="editshop"><i class="fas fa-edit">編輯</i></button>
						        </div>
						    </div>
						    <div class="tablediv">
						        <button id="additem" class="shopsubmitbtn">
							        <i class="fas fa-edit">新增商品</i>
							   </button>
							   <button id="btn" class="shopsubmitbtn">
							        <i class="fas fa-edit">一鍵輸入</i>
							   </button>
							   <br>
							   <br>
						        <div class="adddiv" id="adddiv"></div>
						        <table class="itemtable">
						        	<c:forEach items='${items}' var='item'>
						            <tr class="tr" id="item<c:out value="${item.id}" />">
						                <td class="imgtd">
						                    <img class="itemimg" src="<c:url value='/showitemimage?itemid=${item.id}' />">
						                </td>
						                <td class="nametd">
						                    <p><c:out value="${item.shopitem}" /></p>
						                </td>
						                <td class="introtd">
						                    <p><c:out value="${item.itemintro}" /></p>
						                </td>
						                <td class="pricetd">
						                    <p><c:out value="${item.itemprice}" />元/${item.priceunit}</p>
						                </td>
						                <td class="btntd">
						                    <button id="edititem<c:out value="${item.id}" />" class="edititem"><i class="fas fa-edit">編輯</i></button>
                    						<br>
						                    <form action="<c:url value='/admin/product/deleteitem' />" method="POST">
						                    	<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">
						                        <input type="hidden" name="deleteitemid" value="<c:out value="${item.id}" />">
						                        <button type="submit" class="edititem">
													<i class="fas fa-trash-alt">刪除</i>
												</button>
						                    </form>
						                </td>
						            </tr>
						            </c:forEach>
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
        $(function () {

        	$('#editshop').on('click', function () {
        		let sp = document.getElementById("intro");
                sp.innerHTML =
                    "<div>" +
                    '<img class="shopimg" id="editshopimg" src="<c:url value='/showshopimage?shopid=${shop.id}' />">' +
                    "</div>" +
                    '<div class="introcontext">' +
                    '<form action="<c:url value='/admin/product/editshop' />" enctype="multipart/form-data" method="POST">' +
                    '<h2><c:out value="${shop.shopname}" /></h2>' +
                    '<p>廠商介紹：<textarea name="shopintrovalue" id="shopintrovalue" cols="75" rows="4" value="" style="font-size: 20px;" required><c:out value="${shop.shopintro}" /></textarea></p>' +
                    '<br><input type="file" name="uploadshopimg" accept=".jpg" onchange="shows(this)">' +
                    '<input type="hidden" id="checkshopupload" name="checkshopupload" value="NO">' +
                    '<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">' +
                    '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認修改</i></button>' +
                    '</form>' +
                    '</div>';
            })
            
            $('#additem').on('click', function () {
                let sp = document.getElementById("adddiv");
                sp.innerHTML =
                    '<form action="<c:url value='/admin/product/additem' />" enctype="multipart/form-data" method="POST">' +
                    '<img class="edititemimg" id="edititemimg">' +
                    '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" value="" required></p>' +
                    '<p>商品介紹：<input type="text" name="itemintrovalue" id="itemintrovalue" value="" required></p>' +
                    '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" value="" size="5" required>元/<input type="text" name="priceunitvalue" id="priceunitvalue" value="" size="5" placeholder="單位" required></p>' +
                    '<br><input type="file" name="uploaditemimg" onchange="show(this)" required>' +
                    '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
                    '<input type="hidden" name="editshopname" value="<c:out value="${shop.shopname}" />">' +
                    '<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">' +
                    '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認新增</i></button>' +
                    '</form><br><br><hr>';
            })
            
            $('#btn').on('click', function () {
            	console.log(123);
            	$('#itemnamevalue').val("香腸肉包");
            	$('#itemintrovalue').val("6粒/包");
            	$('#itempricevalue').val(190);
            	$('#priceunitvalue').val("包");
            })
            

        <c:forEach items='${items}' var='item'>
    	$('#edititem<c:out value="${item.id}" />').on('click', function () {
            let sp = document.getElementById("adddiv");
            sp.innerHTML =
                '<form action="<c:url value='/admin/product/edititem' />" enctype="multipart/form-data" method="POST">' +
                '<img class="edititemimg" id="edititemimg" src="<c:url value='/showitemimage?itemid=${item.id}' />">' +
                '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" value="<c:out value="${item.shopitem}" />" required></p>' +
                '<p>商品介紹：<input type="text" name="itemintrovalue" id="itemintrovalue" value="<c:out value="${item.itemintro}" />" required></p>' +
                '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" value="<c:out value="${item.itemprice}" />" required size="5">元/<input type="text"' +
                'name="priceunitvalue" id="priceunitvalue" size="5" placeholder="單位" value="<c:out value="${item.priceunit}" />" required></p>' +
                '<br><input type="file" name="uploaditemimg" onchange="show(this)">' +
                '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
                '<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">' +
                '<input type="hidden" name="edititemid" value="<c:out value="${item.id}" />">' +
                '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認修改</i></button>' +
                '</form><br><br><hr>';
            $(window).scrollTop(100);
        	})
            
        </c:forEach>
        })
        
        function show(f) {
			var reader = new FileReader();//建立檔案讀取物件
			var files = f.files[0];//獲取file元件中的檔案
			reader.readAsDataURL(files);//檔案讀取裝換為base64型別
			reader.onloadend = function(e) {
				//載入完畢之後獲取結果賦值給img
				document.getElementById("edititemimg").src = this.result;
				document.getElementById("checkitemupload").value = "upload";
			}
		}
        
        function shows(f) {
			var reader = new FileReader();//建立檔案讀取物件
			var files = f.files[0];//獲取file元件中的檔案
			reader.readAsDataURL(files);//檔案讀取裝換為base64型別
			reader.onloadend = function(e) {
				//載入完畢之後獲取結果賦值給img
				document.getElementById("editshopimg").src = this.result;
				document.getElementById("checkshopupload").value = "upload";
			}
		}
        
    </script>

</body>
</html>
