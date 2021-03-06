<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <style>
        header {
            border-bottom: 7px double gray;
            color: rgb(126, 107, 107);
            text-align: center;
            width: 100%;
        }
		
		nav {
            width: 100%;
            height: 3em;
            padding-bottom: 10px;
        }
        nav ul {
            padding: 0;
            border-radius: 5px;
        }
        nav ul li {
            width: 9em;
            line-height: 2.5em;
            list-style: none;
            display: inline-block;
            position: relative;
        }
        nav ul li a{
            display: block;
            color: rgb(126, 107, 107);
            font-weight: bolder;
            font-size: 22px;
            text-decoration: none;
            line-height: 2em;
        }
        nav ul li ul{
            display: none;
            position: absolute;
            background-color: rgb(242, 238, 239);
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;

        }
        nav ul li ul li a{
            line-height: 2em;
            margin: 10px 0;
        }
        nav ul li a:hover {
            background-color: rgb(126, 107, 107);
            color: rgb(231, 221, 213);
            border-radius: 5px;
        }
        nav ul li:hover ul{
            display:block;
        }
		        
        .log a{
            text-decoration: none;
            color: rgb(126, 107, 107);
        }
        .log a:hover{
        	font-weight:bolder;
        }
        .log{
            position: absolute;
            right: 30px;
            top: 20px;
            text-align: right;
        }
        .logoimg{
        	margin-top:15px;
        	width: 500px;
        }
    </style>
</head>

<body>
    <header>
        <a href="<c:url value='/' />">
        	<img src="<c:url value='/images/header.png' />" class="logoimg">
        </a>
        <nav>
            <ul>
                <li><a href="<c:url value='/' />">??????</a></li>
                <li><a href="<c:url value='/singlebuy/items' />">????????????</a></li>
                <li><a href="#">????????????</a>
                    <ul>
                        <li><a href="<c:url value='/shops' />">????????????</a></li>
                        
                        <c:choose>
							<c:when test="${status.equals('??????')}">
								<li><a href="<c:url value='/groupBuyshop?name=${member3.name}' />">?????????</a></li>
							</c:when>
							<c:when test="${status.equals('??????')}">
								<li><a href="<c:url value='/groupBuybuyer?name=${member3.name}' />">?????????</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="<c:url value='/member/loginPage' />">?????????</a></li>
							</c:otherwise>
						</c:choose>
                        
<%--                         <li><a href="<c:url value='/groupBuyshop?name=${member3.name}' />">?????????</a></li> --%>
                    </ul>
                </li>
                <li><a href="<c:url value='/forum' />">?????????</a></li>
                <li><a href="<c:url value='/wishindex' />">?????????</a></li>
                <li><a href="<c:url value='/goods/home' />">????????????</a></li>
            </ul>
        </nav>
        <div  class="log">
        	<c:choose>
				<c:when test="${loginCheck.equals('true')}">
					<c:choose>
						<c:when test="${status.equals('??????') || status.equals('??????')}">
							<a href="<c:url value='/member/GoListUser' />">????????????</a><br>
							<a href="<c:url value='/singlebuy/shoppingcart' />">?????????</a>/<a href="<c:url value='/singlebuy/orderlist' />">????????????</a><br>
							<a href="<c:url value='/member/logout' />">????????????</a><br>
						</c:when>
						<c:otherwise>
<%-- 							<a href="<c:url value='/member/Retrieve2' />">(????????????)</a><br> --%>
							<a href="<c:url value='/admin/product/orderlist' />">????????????</a><br>
							<a href="<c:url value='/member/logout' />">???????????????</a><br>
						</c:otherwise>
					</c:choose>
					??????${status},${name}
				</c:when>
				
				<c:otherwise>
					<a href="<c:url value='/member/loginPage' />">????????????</a>
				</c:otherwise>
			</c:choose>
        </div>
    </header>
</body>

</html>