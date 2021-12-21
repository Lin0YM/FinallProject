<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${shop.shopname}" /></title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    
    <style>
        body {
            font-size: 17px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgb(242, 238, 239);
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
            padding-top: 20px;
            padding-bottom: 20px;
            font-size: 20px;
            line-height: 25px;
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
            border-bottom: gray 1px dashed;
        }
        .imgtd {
            width: 310;
        }
        td>p {
            margin: 0;
            padding: 0;
            font-size: 20px;
            line-height: 25px;
        }
        .itemimg {
            margin-top: 15px;
            height: 170px;
            width: 170px;
            object-fit: cover;
            border:1px solid rgb(126, 107, 107);

        }
        .imgtd{
        	width: 180px;
        }
        .nametd{
        	width: 220px;
        }
        .introtd{
        	width: 330px;
        }
        .pricetd{
        	width: 200px;
        }
        .edittd{
        	width: 120px;
        }
        .edititemimg {
            height: 150px;
            width: 150px;
            object-fit: cover;
            float: left;
            margin-right: 15px;
            border:1px solid rgb(126, 107, 107);
        }
        .editshop{
			background-color: rgb(242, 238, 239);
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
        background-color: rgb(242, 238, 239);
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
        background-color: rgb(242, 238, 239);
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

<body>
    <jsp:include page="../header.jsp"/>

    <div class="intro" id="intro">
        <div>
            <img class="shopimg" src="<c:url value='/showshopimage?shopid=${shop.id}' />">
        </div>
        <div class="introcontext">
            <form action="shoplist">
                <h3><c:out value="${shop.shopname}" /></h3>
                <p><c:out value="${shop.shopintro}" /></p>
            </form>
            <button id="editshop" class="editshop"><i class="fas fa-edit">編輯</i></button>
        </div>
    </div>
    <div class="tablediv">
        <button id="additem" class="shopsubmitbtn">
	        <i class="fas fa-edit">新增商品</i>
	   </button>
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
                <td class="edittd">
                    <button id="edititem<c:out value="${item.id}" />" class="edititem"><i class="fas fa-edit">編輯</i></button>
                    <br>
                    <form action="<c:url value='/deleteitem' />" method="POST">
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
                    '<form action="<c:url value='/editshop' />" enctype="multipart/form-data" method="POST">' +
                    '<h3><c:out value="${shop.shopname}" /></h3>' +
                    '<p>廠商介紹：<textarea name="shopintrovalue" id="shopintrovalue" cols="75" rows="4" value="" style="font-size: 20px;" required><c:out value="${shop.shopintro}" /></textarea></p>' +
                    '<input type="file" name="uploadshopimg" accept=".jpg" onchange="shows(this)">' +
                    '<input type="hidden" id="checkshopupload" name="checkshopupload" value="NO">' +
                    '<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">' +
                    '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認修改</i></button>' +
                    '</form>' +
                    '</div>';
            })
            
            $('#additem').on('click', function () {
                let sp = document.getElementById("adddiv");
                sp.innerHTML =
                    '<form action="<c:url value='/additem' />" enctype="multipart/form-data" method="POST">' +
                    '<img class="edititemimg" id="edititemimg">' +
                    '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" required></p>' +
                    '<p>商品介紹：<input type="text" name="itemintrovalue" id="itemintrovalue" required></p>' +
                    '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" size="5" required>元/<input type="text" name="priceunitvalue" id="priceunitvalue" size="5" placeholder="單位" required></p>' +
                    '<input type="file" name="uploaditemimg" onchange="show(this)" required>' +
                    '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
                    '<input type="hidden" name="editshopname" value="<c:out value="${shop.shopname}" />">' +
                    '<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">' +
                    '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認新增</i></button>' +
                    '</form><br><hr>';
            })

        <c:forEach items='${items}' var='item'>
    	$('#edititem<c:out value="${item.id}" />').on('click', function () {
            let sp = document.getElementById("adddiv");
            sp.innerHTML =
                '<form action="<c:url value='/edititem' />" enctype="multipart/form-data" method="POST">' +
                '<img class="edititemimg" id="edititemimg" src="<c:url value='/showitemimage?itemid=${item.id}' />">' +
                '<p>商品名稱：<input type="text" name="itemnamevalue" id="itemnamevalue" value="<c:out value="${item.shopitem}" />" required></p>' +
                '<p>商品介紹：<input type="text" name="itemintrovalue" id="itemintrovalue" value="<c:out value="${item.itemintro}" />" required></p>' +
                '<p>商品價格：<input type="text" name="itempricevalue" id="itempricevalue" value="<c:out value="${item.itemprice}" />" required size="5">元/<input type="text"' +
                'name="priceunitvalue" id="priceunitvalue" size="5" placeholder="單位" value="<c:out value="${item.priceunit}" />" required></p>' +
                '<input type="file" name="uploaditemimg" onchange="show(this)">' +
                '<input type="hidden" id="checkitemupload" name="checkitemupload" value="NO">' +
                '<input type="hidden" name="editshopid" value="<c:out value="${shop.id}" />">' +
                '<input type="hidden" name="edititemid" value="<c:out value="${item.id}" />">' +
                '<button type="submit" class="shopsubmitbtn"><i class="fas fa-check-circle">確認修改</i></button>' +
                '</form><br><hr>';
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
    <br>
    <br>
    <br>
    <br>
    <jsp:include page="../footer.jsp"/>
</body>
</html>