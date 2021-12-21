<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:out value="${shop.shopname}" /></title>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"/>
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
            height: 220px;
            width: 220px;
            object-fit: cover;
            border:1px solid rgb(126, 107, 107);
            
        }
        .intro{
            width: 1000px;
            margin: 0 auto;
            /* border: black 1px solid; */
            border-bottom: gray 1px dashed;
            display: flex;
            position: relative;
            padding-top: 20px;
            padding-bottom:20px;
            font-size: 20px;
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
            font-size: 20px;
            line-height: 25px;
        }
        .itemimg{
            margin-top: 15px;
            height: 200px;
            width: 200px;
            object-fit: cover;
            border:1px solid rgb(126, 107, 107);
            
        }
        a{
            text-decoration: none;
            color: rgb(126, 107, 107);
        }
        a:hover{
        	font-weight:bolder;
        }
        .gobtn{
			background-color: rgb(242, 238, 239);
			border:0;
			color:rgb(126, 107, 107);
			font-size:25px;
			opacity: .5;
        }
        .gobtn:hover{
        	opacity: .7;
        }
    </style>
</head>
<body>
    <jsp:include page="../header.jsp"/>
    
    <div class="intro animated fadeIn">
        <img class="shopimg" src="<c:url value='/showshopimage?shopid=${shop.id}' />">
        <div class="introcontext">
            <h1><c:out value="${shop.shopname}" /></h1><br>
            <p><c:out value="${shop.shopintro}" /></p>
            <div class="editbottom">
            
            	<c:choose>
					<c:when test="${status.equals('管理員') || (member3.name).equals(shop.shopname)}">
        				<button onclick="window.location.href='<c:url value='/editpage?id=${shop.id}' />'" class="gobtn">
	        				<i class="fas fa-edit"></i>
	        			</button>
					</c:when>
				</c:choose>
    		</div>
        </div>
    </div>
    <table class="itemtable">
        <c:forEach items='${items}' var='item'  varStatus="status">
        	<c:if test="${status.count eq 1 || (status.count-1) % 4 eq 0}">
		        <tr class="tr">
		    </c:if>
		            <td class="animated fadeIn">
		                <img class="itemimg" src="<c:url value='/showitemimage?itemid=${item.id}' />">
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