<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
    <title><c:out value="商品列表" /></title>
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
        .intro{
            width: 1200px;
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
        .editbottom{
            position: absolute;
            top: 15px;
            right: 20px;
        }
        .itemtable{
            width: 1000px;
            margin: 20px auto;
            margin-bottom: 0;
            text-align: center;
        }
        td{
            border-bottom: gray 1px dashed;
        }
        
        p{
            margin: 0;
            padding: 0;
            font-size: 18px;
            line-height: 22px;
        }
        .itemimg{
            margin-top: 15px;
            height: 200px;
            width: 200px;
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
            <label for="search">搜尋：</label><input type="text" size="30" class="searchtext" id="search" name="search" placeholder="">
            <button type="submit"class="searchbtn">
		         <i class="fas fa-search searchbtn"></i>
		    </button>
        </form>
    </div>
    
    <table class="itemtable">
        <c:forEach items='${items}' var='item'  varStatus="status">
        	<c:if test="${status.count eq 1 || (status.count-1) % 4 eq 0}">
		        <tr class="tr">
		    </c:if>
		            <td class="animated fadeIn">
		            	<a href="<c:url value='/itembyname?shopname=${item.shopname}' />">
		                	<img class="itemimg" src="<c:url value='/showitemimage?itemid=${item.id}' />">
		                </a>
		                <p>${item.shopitem}</p>
		                <p>${item.itemprice}元/${item.priceunit}</p>
		            </td>
		    <c:if test="${status.count % 4 eq 0 || status.count eq 4}">     
		        </tr>
		    </c:if>   
		</c:forEach>
    </table>
    <br>
    <br>
    <br>
    <br>
    <jsp:include page="../footer.jsp"/>
</body>
</html>