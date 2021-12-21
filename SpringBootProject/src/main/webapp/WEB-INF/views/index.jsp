<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>方便購</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
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
        .wrap{
            width: 1200px;
            height: 475px;
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
            width: 4800px;
            display: flex;
            /* left: -800px; */
            transition: .6s;
        }
        .slide-img li{
           width: 1200px;
           height: 475px;
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
        .slide-arrow:hover{
            opacity: 1;
        }
        .slide-arrow.right{
            right: 0;
        }
        .hot{
            width: 1200px;
            margin: 0 auto;
        }
        .item{
            height: 100%;
        	width: 100%;
        	border:1px solid rgb(126, 107, 107);
        	display: block;
        	object-fit: cover;
        	border-radius: 5px;
        }
        .indeximg{
        	width: 60%;
        	border:1px rgb(126, 107, 107) solid;
        }
        .indeximgdiv{
        	text-align: center;
        }
        .goshopping{
            text-align: center;
            margin:65px 0;
        }
        .goshopping1{
            text-align: center;
            margin:35px 0;
        }
        .goshopping2{
            text-align: center;
            margin:35px auto;
            border:2px rgb(126, 107, 107) solid;
            border-radius: 8px;
            width:180px;
            height:30px;
            padding-top: 15px;
            padding-bottom: 10px;
            
        }
        .goshopping1 a{
        	text-decoration: none;
        }
        .goshoppingbtn{
        	color: rgb(126, 107, 107);
            font-size: 25px;
            text-decoration: none;
            position: relative;
            font-weight: bolder;
        }
        .goshoppingbtn::after{
        	content:"";
        	position: absolute;
        	left:0;
        	bottom:0;
        	width:100%;
        	height:2px;
        	background:currentColor;
        	 -webkit-transform: scaleX(0);
			          transform: scaleX(0);
			  -webkit-transform-origin: right;
			          transform-origin: right;
			  transition: -webkit-transform 250ms ease-in;
			  transition: transform 250ms ease-in;
			  transition: transform 250ms ease-in, -webkit-transform 250ms ease-in;
        }
        
        .goshoppingbtn:hover::after {
			  -webkit-transform: scaleX(1);
			          transform: scaleX(1);
			  -webkit-transform-origin: left;
			          transform-origin: left;
			}
           .wrap2 {
            width: 1100px;
            height: 220px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
            border-top:2px rgb(126, 107, 107) solid;
            border-bottom:6px rgb(126, 107, 107) double;
        }

        .slide-img2 {
            margin: 0;
            padding: 0;
            list-style: none;
            position: absolute;
            width: 1540px;
            display: flex;
            transition: .6s;
        }

        .slide-img2 li {
            width: 180px;
            height: 180px;
            padding: 20px
        }

        .slide-img2 li img {
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .image {
            position: relative;
            width: 180px;
            height: 180px;
        }

        .image__overlay {
            position: absolute;
            top: 1px;
            left: 1px;
            width: 180px;
            height: 180px;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.25s;
        }

        .image__overlay>p {
            transform: translateY(20px);
            transition: transform 0.25s;
        }

        .image__overlay:hover {
            opacity: 0.8;
        }

        .image__overlay:hover>p {
            transform: translateY(0);
        }

        .image__overlay p {
            font-size: 1em;
            font-weight: bolder;
            opacity: 0.9;
            padding: 10px;
            margin-top: 15px;
        }

        .image__overlay i {
            font-size: 2em;
            opacity: 0.7;
        }
        .item{
            border: 1px rgb(126, 107, 107) solid;
            border-radius: 5px;
        }
        .h3 {
            font-size:40px;
            text-align: center;
            margin-top: 13px;
            margin-bottom: 15px;
            color: rgb(244, 177, 131);
            opacity: 0.7;
        }
        .h4 {
            text-align: center;
            margin-top: 8px;
            margin-bottom: 10px;
            color: rgb(126, 107, 107);
        }
        .classificationimg{
        	width: 260px;
            height: 260px;
            border-radius: 8px;
            margin:0 20px;
        }
        .banner{
        	width: 900px;
        	border: 1px rgb(126, 107, 107) solid;
        	border-radius: 8px;
        }
        .returnTop{
        	position: fixed;
            right: 30px;
            bottom: 30px;
            font-size: 40px;
			border:0;
			color:rgb(126, 107, 107);
			opacity: .7;
        }
        .returnTop:hover{
			opacity: .9;
		}     
    </style>
</head>
<body>

    <jsp:include page="header.jsp"/>
    <br>
    <div class="container">
        <div class="wrap">
            <a class="slide-arrow" id="slidePrev" ><i class="fas fa-chevron-left"></i></a>
            <a class="slide-arrow right" id="slideNext"><i class="fas fa-chevron-right"></i></a>
            <ul class="slide-img" id="slide-img">
                <li><img src="<c:url value='/images/slideimg/1.jpg' />"></li>
                <li><img src="<c:url value='/images/slideimg/2.jpg' />"></li>
                <li><img src="<c:url value='/images/slideimg/3.jpg' />"></li>
                <li><img src="<c:url value='/images/slideimg/4.jpg' />"></li>
            </ul>
            <ul class="pages" id="pages">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
        <br>
        <br>
        <div class="indeximgdiv">
        	<img src="<c:url value='/images/index.png' />" class="indeximg">
        </div>
        <div class="goshopping">
        	<p class="h3">Anniversary Sale</p>
        	<h4 class="h4">周 / 年 / 慶 / 特 / 惠</h4>
        	<a href="<c:url value='/singlebuy/classitems?classification=周年慶特惠' />">
	        	<img src="<c:url value='/images/index/周年慶banner.png' />" class="banner">
	        </a>
        </div>
        <div class="goshopping">
        	<p class="h3">Clearance Sale</p>
        	<h4 class="h4">商 / 品 / 出 / 清</h4>
        	<a href="<c:url value='/singlebuy/classitems?classification=商品出清' />">
		        <img src="<c:url value='/images/index/出清banner.png' />" class="banner">
        	</a>
        </div>
        <div class="goshopping1">
        	<p class="h3">Item Categories</p>
        	<h4 class="h4">商 / 品 / 分 / 類</h4>
        	<a href="<c:url value='/singlebuy/classitems?classification=日常百貨' />">
		        <img src="<c:url value='/images/index/日常百貨.png' />" class="classificationimg">
        	</a>
        	<a href="<c:url value='/singlebuy/classitems?classification=保健醫用' />">
		        <img src="<c:url value='/images/index/保健醫用.png' />" class="classificationimg">
        	</a>
        	<a href="<c:url value='/singlebuy/classitems?classification=寵物專區' />">
		        <img src="<c:url value='/images/index/寵物專區.png' />" class="classificationimg">
        	</a>
        </div>
        <div class="goshopping1">
        	<a href="<c:url value='/singlebuy/classitems?classification=生活家電' />">
	        	<img src="<c:url value='/images/index/生活家電.png' />" class="classificationimg">
        	</a>
        	<a href="<c:url value='/singlebuy/classitems?classification=餐廚用具' />">
	        	<img src="<c:url value='/images/index/餐廚用具.png' />" class="classificationimg">
        	</a>
        	<a href="<c:url value='/singlebuy/classitems?classification=銀髮保健' />">
	        	<img src="<c:url value='/images/index/銀髮保健.png' />" class="classificationimg">
        	</a>
        </div>
        <div class="goshopping2">
             <a href="<c:url value='/singlebuy/items' />" class="goshoppingbtn">所有商品</a>
        </div>
        <div class="hot">
                <br>
                <br>
                <p class="h3">Recommended products</p>
        		<h4 class="h4">團 / 購 / 推 / 薦 / 商 / 品</h4>
				<div class="wrap2">
	                <a class="slide-arrow" id="slidePrev2"><i class="fas fa-chevron-left"></i></a>
	                <a class="slide-arrow right" id="slideNext2"><i class="fas fa-chevron-right"></i></a>
	                <ul class="slide-img2" id="slide-img2">
	                    <c:forEach var='item' items="${recommendItems}">
		                    <li>
		                        <div class="image" onclick="window.location.href='<c:url value='/itembyname?shopname=${item.shopname}' />'">
		                            <a href="#">
		                                <img class="item" src="<c:url value='/showitemimage?itemid=${item.id}' />">
		                            </a>
		                            <div class="image__overlay">
		                                <br><i class="fas fa-search searchbtn"></i>
		                                <p>${item.shopitem}</p>
		                            </div>
		                        </div>
		                    </li>
						</c:forEach>
	                </ul>
	            </div>
                <div class="goshopping2">
                	<a href="<c:url value='/shops' />" class="goshoppingbtn">開始團購</a>
                </div>
		</div>
		<br>
        <button type="submit" id="returnTop" class="returnTop">
			<i class="fas fa-angle-double-up"></i>
		</button>
		
    </div>


	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(function(){
            let index=0;
            let slideMove=0;
            $('#pages li').eq(0).css('background-color','white')
            $('#pages li').on('mouseenter',function(){
                index=$(this).index()
                console.log(index)
                moveImg()
            })
            let slideCount=$('#slide-img li').length
            console.log(slideCount)
            $('#slideNext').on('click',function(){
                index++;
                if(index>=slideCount){
                    index=0;
                }
                moveImg()
            })
            $('#slidePrev').on('click',function(){
                index--;
                if(index<0){
                    index=slideCount-1
                }
                moveImg()
            })

            function moveImg(){
                slideMove=0-1200*index;
                $('#slide-img').css('left',slideMove)
                $("#pages li").eq(index).css('background-color','white')
                .siblings().css('background-color','')
            }
            setInterval(autoImg,3500)
            function autoImg(){
                index++;
                if(index>=slideCount){
                    index=0;
                }
                moveImg()
            }
        })
        
        $(function () {
            let index = 0;
            let slideMove = 0;
            let slideCount = $('#slide-img2 li').length
            console.log(slideCount)
            $('#slideNext2').on('click', function () {
                index++;
                if (index >= 3) {
                    index = 0;
                }
                moveImg()
            })
            $('#slidePrev2').on('click', function () {
                index--;
                if (index < 0) {
                    index = slideCount - 1
                }
                moveImg()
            })

            function moveImg() {
                slideMove = 0 - 220 * index;
                $('#slide-img2').css('left', slideMove)
            }
            
            $('#returnTop').on('click', function () {
            	$("html, body").animate({scrollTop: 0}, 1000);
            })
            
        })
    </script>
	<jsp:include page="footer.jsp"/>
	
</body>
</html>