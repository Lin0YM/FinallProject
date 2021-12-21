<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
    <title>廠商列表</title>
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

        .shopimg{
            height: 230px;
            width: 230px;
            object-fit: cover;
            border:1px solid rgb(126, 107, 107);
            
        }
        .search{
            width: 800px;
            margin: 0 auto;
            display: flex;
            position: relative;
            padding: 20px 0;
        }
        .searchform{
            margin: 0 auto;
            height: 25px;
			font-size:20px;
        }
        .intro{
            width: 1000px;
            margin: 0 auto;
            /* border: black 1px solid; */
            border-bottom: gray 1px dashed;
            display: flex;
            position: relative;
            padding-top: 20px;
            padding-bottom:10px;
        }
        .introcontext{
            /* border: black 1px solid; */
            position: relative;
            margin-left:10px;
        }
        .introcontext p{
        	margin-top:40px;
        	font-size:20px;
        }
        .gobtn{
            position: absolute;
            bottom: 20px;
            right: 20px;
			background-color: rgb(242, 238, 239);
			border:0;
			color:rgb(126, 107, 107);
			font-size:32px;
			opacity: .7;
        }
        .gobtn:hover{
        	opacity: .9;
        }
        .howtosearch{
        	height: 24px;
			font-size:20px;
        }
        .searchtext{
        	height: 24px;
			font-size:20px;
        }
        .searchbtn{
        	height: 50px;
			font-size:18px;
			background-color: rgb(242, 238, 239);
			border:0;
			color:rgb(126, 107, 107);
			font-size:20px;
			opacity: .7;
        }
        .searchbtn:hover{
        	opacity: .9;
        }
        .searchbtn{
        	height: 50px;
			font-size:18px;
			background-color: rgb(242, 238, 239);
			border:0;
			color:rgb(126, 107, 107);
			font-size:20px;
			opacity: .7;
        }
        .searchbtn:hover{
        	opacity: .9;
        }
    </style>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    
    <div class="search">
        <form action="<c:url value='/search' />" class="searchform" method="GET">
        	<select name="howtosearch" class="howtosearch">
                    <option value="shop">依照廠商</option>
                    <option value="item">依照商品</option>
            </select>
            <label for="search">搜尋：</label><input type="text" size="30" id="search" name="search" class="searchtext" placeholder="">
            <button type="submit"class="searchbtn">
		         <i class="fas fa-search searchbtn"></i>
		    </button>
        </form>
    </div>
    
    <c:forEach items='${shops}' var='shop'>
	    <div class="intro animated fadeIn">
	    	<a href="<c:url value='/item?id=${shop.id}' />">
	        	<img src="<c:url value='/showshopimage?shopid=${shop.id}' />" class="shopimg">
	    	</a>
	        <div class="introcontext">
	            <h1>${shop.shopname}</h1>
	            <p>${shop.shopintro}</p>
	            <div class="gobottom">
        			<button onclick="window.location.href='<c:url value='/item?id=${shop.id}' />'" class="gobtn">
        				<i class="fas fa-arrow-alt-circle-right"></i>
        			</button>
    			</div>
	        </div>
	    </div>
    </c:forEach>
    <br>
    <br>
    <br>
    <br>
    <br>
	<jsp:include page="../footer.jsp"/>


</body>
</html>