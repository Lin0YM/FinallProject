<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WatchPool</title>
<style>
body{
    font-size: 17px;
    font-family: Arial, Helvetica, sans-serif;
    background-color: white;
    line-height: 1.5em;
}
header{
    background: #333;
    color: lightgreen;
    padding: 20px;
    text-align: center;
    margin-bottom: 10px;
}
textarea{
	margin: auto;
	width:98%;
	height:200px;
}
.container{
    width: 50%;
    /*外距 元素跟元素的間離*/
    margin: auto;
    /*內距 元素內跟邊界間距*/
    padding: 10px;
}
h2{
	margin: 0;
    padding: 0;
}
</style>
</head>
<body>
	<header>
    	<h1>Watch Pool</h1>
    </header>
    <div class="container">
<!--     查詢ID -->
<%--     	<form action="<c:url value='/wishpool/search' />" method="get"> --%>
<!--             <h2>查詢標題</h2> -->
<!--             <label>查詢標題 : </label> -->
<!--                 <input type="text" id="titlesearch" name="titlesearch"><br> -->
<!--             <input type="submit" name="confirmsearch" value="確認"><hr> -->
<!--         </form> -->
    <!-- 總查詢 -->        
    <form action="<c:url value='/wishpool/allsearch' />" method="get">
    	<h2>總查詢</h2>
	    	<div align='center'>
	            <a href="allsearch"><input type="button" value="確認"></a><hr>
	            <a href="<c:url value='/' />"><input type="button" value="回上頁"></a>
            </div>
        </form>
    </div>
</body>
</html>