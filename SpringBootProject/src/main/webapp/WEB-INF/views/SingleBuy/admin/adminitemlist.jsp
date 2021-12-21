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
.card-body{
	width: 1300px;
	margin: 0px auto;
	margin-bottom: 0;
	text-align: center;
	font-size: 15px;
	font-weight: bolder;
	border: gray 2px solid;
	padding: 15px;
	box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, 0.2);
}
th{
text-align: center;
}
td p {
	margin: 0;
	padding: 0;
	line-height: 28px;
	font-size: 20px;
	font-weight: normal;
}
.itemimg {
		height: 200px;
		width: 200px;
		object-fit: cover;
		border-radius: 5px;
	    border: 1px rgb(126, 107, 107) solid;
	}
.classificationtd{
	width: 120px;
}
.itemimgtd{
	width: 200px;
}
.itemnametd{
	width: 270px;
}
.itemintrotd{
	width: 500px;
}
.pricetd{
	width: 170px;
}
.edittd{
	width: 100px;
}
.h1 {
	text-align: center;
	margin: 30px 0;
}

.tr {
	height: 120px;
}
.additem{
	float:left;
	font-size: 18px;
    background-color: white;
	border:0;
	color:rgb(126, 107, 107);
	text-decoration: none;
	opacity: .8;
}
.additem:hover{
	opacity: 1;
}
.edit{
	text-align: left;
	margin-left:30px;
}
.edit p{
	line-height: 25px;
	font-size: 17px;
}
.edit input{
	height: 35px;
	font-size: 17px;
}
.edit textarea{
	font-size: 17px;
}
.shopsubmitbtn{
		font-size: 18px;
        background-color: rgb(255, 255, 255,0.2);
		border:0;
		color:rgb(126, 107, 107);
		text-decoration: none;
		opacity: .8;
		}
		.shopsubmitbtn:hover{
			opacity: 1;
			background-color: rgb(242, 238, 239,0.2);
		}
		.edititem{
		font-size: 20px;
        background-color: rgb(255, 255, 255,0.2);
		border:0;
		color:rgb(126, 107, 107);
		text-decoration: none;
		opacity: .8;
		margin:8px auto;
		}
		.edititem:hover{
			opacity: 1;
			background-color: rgb(242, 238, 239,0.2);
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
					<h2 class="h1">網購商品列表</h2>
					
					<div class="card mb-4" style="border:0px;">
                            <div class="card-body">
                            <button id="additem" class="additem">
						        <i class="fas fa-edit">新增商品</i>
						   </button>
                           <button id="btn" class="additem">
						        <i class="fas fa-edit">一鍵輸入</i>
						   </button>
                            <br><br>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center;">商品分類</th>
                                            <th style="text-align: center;">商品圖片</th>
                                            <th style="text-align: center;">商品名稱</th>
                                            <th style="text-align: center;">商品介紹</th>
                                            <th style="text-align: center;">商品價格</th>
                                            <th style="text-align: center;">編輯</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <tr id="addtr">
                                    
                                    </tr>
                                    
                           <c:forEach items='${allItems}' var='item'>
								<tr class="tr" id="item1">
									<td class="classificationtd" style="vertical-align:middle;">
										<p>${item.classification}</p>
									</td>
									<td class="itemimg" style="vertical-align:middle;">
										<img class="itemimg" src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />">
									</td>
									<td class="itemnametd" style="vertical-align:middle;">
										<p>${item.itemname}</p>
									</td>
									<td class="itemintrotd" style="vertical-align:middle;">
										<p>${item.itemintro}</p>
									</td>
									<td class="pricetd" style="vertical-align:middle;">
										<p>${item.itemprice}元/${item.priceunit}</p>
									</td>
									<td class="edittd" style="vertical-align:middle;">
						                <button id="edititem<c:out value="${item.itemid}" />" class="edititem"><i class="fas fa-edit">修改</i></button>
						                <br>
						                <form action="<c:url value='/admin/product/deletesinglebuyitem' />" method="POST">
						                    <input type="hidden" name="deleteitemid" value="<c:out value="${item.itemid}" />">
						                    <button type="submit" class="edititem">
												<i class="fas fa-trash-alt">刪除</i>
											</button>
						                </form>										
									</td>
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
	
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
        $(function () {
        	var i = 0;
//         	$('#additem').on('click', function () {
//                 let content =
//                 	'<tr id="addtr">' +
//                 	'<td></td>' +
//                     '<td style="vertical-align:middle;"><img class="itemimg" id="edititemimg"></td>' +
//                 	'<td colspan="4" style="vertical-align:middle;"><div class="edit">' +
//                     '<form action="<c:url value='/admin/product/addsinglebuyitem' />" enctype="multipart/form-data" method="POST">' +
//                     '<p>商品分類：<input type="text" name="classificationvalue" id="classificationvalue" required></p>' +
//                     '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" required></p>' +
//                     '<p>商品介紹：<textarea name="itemintrovalue" id="itemintrovalue" cols="50" rows="3" required></textarea></p>' +
//                     '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" size="5" required>元/<input type="text" name="priceunitvalue" id="priceunitvalue" size="5" placeholder="單位" required></p>' +
//                     '<br><input type="file" name="uploaditemimg" onchange="show(this)" required>' +
//                     '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
//                     '<input type="submit" value="確認新增">' +
//                     '</form>' +
//                     '</div></td></tr>';
//                     if(i<1){
//                     	$('tbody').prepend(content);
//                     	i++;
//                     }
//             })
            
            $('#additem').on('click', function () {
                let sp = document.getElementById("addtr");
                sp.innerHTML =
                	'<td></td>' +
                    '<td style="vertical-align:middle;"><img class="itemimg" id="edititemimg"></td>' +
                	'<td colspan="4" style="vertical-align:middle;"><div class="edit">' +
                    '<form action="<c:url value='/admin/product/addsinglebuyitem' />" enctype="multipart/form-data" method="POST">' +
                    '<p>商品分類：<input type="text" name="classificationvalue" id="classificationvalue" required></p>' +
                    '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" required></p>' +
                    '<p>商品介紹：<textarea name="itemintrovalue" id="itemintrovalue" cols="50" rows="3" required></textarea></p>' +
                    '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" size="5" required>元/<input type="text" name="priceunitvalue" id="priceunitvalue" size="5" placeholder="單位" required></p>' +
                    '<br><input type="file" name="uploaditemimg" onchange="show(this)" required>' +
                    '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
                    '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認新增</i></button>' +
                    '</form>' +
                    '</div></td>';
            })
            
            <c:forEach items='${allItems}' var='item'>
            $('#edititem${item.itemid}').on('click', function () {
                let sp = document.getElementById("addtr");
                sp.innerHTML =
                	'<td></td>' +
                    '<td style="vertical-align:middle;"><img class="itemimg" id="edititemimg" src="<c:url value='/singlebuy/showitemimage?itemid=${item.itemid}' />"></td>' +
                	'<td colspan="4" style="vertical-align:middle;"><div class="edit">' +
                    '<form action="<c:url value='/admin/product/editsinglebuyitem' />" enctype="multipart/form-data" method="POST">' +
                    '<p>商品分類：<input type="text" name="classificationvalue" id="classificationvalue" value="${item.classification}" required></p>' +
                    '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" value="${item.itemname}" required></p>' +
                    '<p>商品介紹：<textarea name="itemintrovalue" id="itemintrovalue" cols="50" rows="3" required>${item.itemintro}</textarea></p>' +
                    '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" size="5" value="${item.itemprice}" required>元/<input type="text" name="priceunitvalue" id="priceunitvalue" size="5" value="${item.priceunit}" placeholder="單位" required></p>' +
                    '<br><input type="file" name="uploaditemimg" onchange="show(this)">' +
                    '<input type="hidden" name="edititemid" value="<c:out value="${item.itemid}" />">' +
                    '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
                    '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認修改</i></button>' +
                    '</form>' +
                    '</div></td>';
            })
            </c:forEach>
            
            $('#btn').on('click', function () {
            	console.log(123);
            	$('#classificationvalue').val("日常百貨");
            	$('#itemnamevalue').val("【AIWA】兩用手持多功能蒸氣拖把");
            	$('#itemintrovalue').val("高壓除菌＞99.99％，有效去除細菌、病毒、過敏原、異味等有害物質，用清水蒸服頑強汙垢，無需使用清潔劑，無段式蒸氣調節，可依需要調節蒸氣大小");
            	$('#itempricevalue').val(3690);
            	$('#priceunitvalue').val("組");
            })
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
        
    </script>
	
</body>
</html>
