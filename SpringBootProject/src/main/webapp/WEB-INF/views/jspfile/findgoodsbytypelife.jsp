<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
    <script>
		  $( function() {
		    $( "#menu" ).menu();
		  } );
  	</script>
    <style>
    body {
            font-size: 17px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgb(231, 221, 213);
            line-height: 1.5em;
        }
        .wrap{
            width: 870px;
            height: 350px;
            background-color: black;
            margin: 0 auto;
            position: relative;  
            overflow: hidden;
        }
        .slide-img{
            margin: 0;
            padding: 0;
            list-style: none;
            position: absolute;
            width: 3480px;
            display: flex;
            /* left: -800px; */
            transition: .6s;
        }
        .slide-img li{
           width: 870px;
           height: 350px;
           /* 伸展比例 壓縮比例 額外剩餘比例 */
           /* flex:1 0 0; */
        }
        .slide-img li img{
            height: 100%;
            width: 100%;
            /* 元素內容調整大小比例 */
            object-fit: cover;
        }
        .pages{
            list-style: none;
            position: absolute;
            margin: 0;
            padding: 0;
            bottom: 10px;
            display: flex;
            left: 0;
            width: 100%;
            /* 主軸 置中 */
            justify-content: center;
        }
        .pages li{
            border: 1px solid #fff;
            margin: 0 5px;
            width: 10px;
            height: 10px;
            border-radius: 50%;
        }
        .slide-arrow{
            position: absolute;
            /* background-color: red; */
            width: 40px;
            height: 100%;
            display: flex;
            justify-content: center;
            /* 次軸or交錯軸 置中 */
            align-items: center;
            /* 圖層排列 */
            z-index: 1;
            font-size: 36px;
            /* 換游標 */
            cursor: pointer;
            color: white;
            /* 透明度 */
            opacity: .6;
        }
        
     .menu {
        	padding:0;
            width: 100%;
            overflow: auto;
            /* background-color: #ACD6FF; */
            border-radius: 5px;
            list-style-type: none;
            display: flex;
            justify-content: center;
        }
		
        .menu td a {
            display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;
            font-size:22px;
        }

        .menu td a:link {
            text-decoration: none;
        }

        .menu td a:hover {
            background-color: rgb(126, 107, 107);
            color: rgb(231, 221, 213);
            border-radius: 5px;
        } 
        
        
         #menu li a,li {
            display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;
            font-size:22px;
        }
        
        #menu li a:link {
            text-decoration: none;
        }
    	
    	h1 {
            display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;

        }
    
     .thumbnail{ 
     	float:left; 
    	display: inline-block; 
     } 
     .goodslist{ 

     	float:left; 
   	display: inline-block; 
      } 
    
     .tb2{ 
     	position:relative;
     	left:150px;
 	    padding: 20px; 
 	    } 
 	 .tb2 td{ 
 	    width: 310px; 
 		float:left; 
		
 	     } 
 	    .ui-menu { width: 150px; background-color: inherit;} 
 	 .link1{ 
 	 	
 	 	color: gray; 
 	 } 
 	 .p1{ 
 	 display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;
 	 	position:absolute; 
 	 	top: 0; 
 	 	right: 0; 
 	 } 
 	 .p2{ 
 	 
 	 	position:absolute; 
 	 	top: 10; 
 	 	right: 0; 
 	 } 
 	 .p2 a{ 
 	 text-decoration: none;
     color: rgb(126, 107, 107);
 	 } 
    </style>
    

</head>

<body>
    <div class="head">
    <p class="p1">${member3.username}歡迎</p>
    <p class="p2"><a href="<c:url value='/' />">回首頁</a></p>
	<h1 style="text-align: center">二手商品交易專區</h1><hr>
	</div>
	<ul class="menu">
	<table style="margin: 0px auto;">
			<tr height="20"  align="center">
			<td width="350"> 
				<a href="<c:url value='/goods/findbytype/生活用品' />">查詢生活用品類</a><BR>
		    </td>
		    <td width="350">
				<a href="<c:url value='/goods/findbytype/電子商品' />">查詢電子商品類</a><BR>
			</td>
			<td width="350">
				<a href="<c:url value='/goods/findbytype/書籍' />">查詢書籍類</a><BR>
			</td>
			<td width="350">
				<a href="<c:url value='/goods/findbytype/衣物鞋包' />">查詢衣物鞋包類</a><BR>
			</td>
			<td width="350">
				<a href="<c:url value='/goods/findbytype/運動用品' />">查詢運動用品類</a><BR>
			</td>
			</tr>
	</table>
	</ul>
	<table class="tb2">
	
    	<div class="thumbnail">
		<c:forEach items='${findbytype}' var='good'>
    			<td>
                    <div class="caption">
	                    <img width='200' height='200' 
	     					src="<c:url value='/goods/getPicture/${good.id}' />" />
                        <p>商品類別:${good.goodsType}</p>
                        <p>商品名稱:${good.goodsName}</p>
                        <p>商品數量:${good.goodsNum}</p>
                        <p>商品單價:${good.goodsPrice}</p>
                        <p>發布會員:${good.uploadMember}</p>
                        <p>商品簡介:${good.goodsInt}</p>
                        <span>
                        <a href="<c:url value='/goods/Ordergoodsitem?id=${good.id}' />"
						    class="btn btn-primary">
						    <span class="glyphicon-info-sigh glyphicon">下訂商品</span>
						</a>
                        </span>
                        
                    </div>
                
            </td>
           </c:forEach>
          </div>
	</table>
	<hr>
			<input type="submit" value="返回功能列表"  id="returnhome">
        </div>
        <script>
           $(function(){
        	   

			document.getElementById("returnhome").addEventListener("click",returnhome);
	        function returnhome(){
	            location.href="<c:url value='/goods/home' />";
	        }
	        
	            
        })
        </script>
        
</body>

</html>