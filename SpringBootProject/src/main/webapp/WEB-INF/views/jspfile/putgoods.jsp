<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>二手商品交易專區商品發布</title>
    <!-- menu1  -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <!-- menu1 -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
    	
    $(document).ready(function(){
    	  $("#oneclick").click(function(event){
    	    event.preventDefault();
    	  });
    	});

    	var increasenum=0;
    	var goods=["籃球","櫃子"];
    	var Info=["二手堪用品","可用品"];
    	var index=0;
    function fn(){
    	
    	let goodsnum=5;
    	let singleprice=20;
    	
    	increasenum++;
    	document.getElementById("goodsName").value=goods[index];
    	document.getElementById("goodsNum").value=increasenum;
    	document.getElementById("goodsPrice").value=goodsnum*singleprice;
    	document.getElementById("goodsInt").value=Info[index];
    	
    	index++;
    	
    	if(index>=goods.length){
    	index=0;
    	}
    	
    }
	
    
    </script>
    <style>
    body {
            font-size: 17px;
            font-family: Arial, Helvetica, sans-serif;
            background-color: rgb(231, 221, 213);
            line-height: 1.5em;
        }
        div.home {
            position: absolute;
            background-color: darkturquoise;
            display:inline-block;
        }

        .header {
            position: relative;
            border: 1px solid black;
            height: 80px;
            background: linear-gradient(to right, gray, white)
        }
        
        .headerTittle {
            position: absolute;
            font-size: 30px;
            top: 20px;
            left: 60px;
            /* background-color: royalblue; */
            font-family: 標楷體;
        }

        .rightTable {
            border: 1px solid black;
            background-color: cornflowerblue;
        }
        

        div.member  {
            position: absolute;
            right: 0;
            top:0;
        }

        .returnTop{
            position: fixed;
            right: 0;
            bottom: 0;
        }
        
        

        div.table{
            border: 1px solid black;
            text-align: center;
            width: 800px;
        }
        table{
            display: inline-block;
        }

        tr th{
            border: 1px solid black;
        }

        .goodsinfo{
            position: absolute;
            background-color: wheat;
            width: 600px;
            height: 500px;
            top: 80px;
            left: 200px;
            border: 1px solid black;
            overflow: auto;
        }
        .goodstitle{
            position: absolute;
            background-color: orange;
            left: 0px;
            width: 600px;

        }
        .putgoodsinfo{
            position: absolute;
            border: 1px solid black;
            width: 500px;
            top: 80px;
            left: 50px;
        }

        .putgoodsinfo p{
            margin: 0;
        }
        
        .buyinfo{
            position: absolute;
            width: 250px;
            height: 600px;
            background-color: palegreen;
            top:100px;
        }
        .people{
            border: 1px solid black;
        }

        #menu li{
            background-color: cadetblue;
            list-style:none;
            
        }
        .btn1{
            margin: 0 20px 0 0;
        }
        #namecommend{
             color: gray;
             font-size: 10px;
         }
         #checkgoods{
         border: 1px black solid;
         width: 70px;
         height: 20px;
         background-color: lightblue;
         }
         .btn2{
            position: absolute;
            bottom: 100px;
            left: 670px;
        }
        
/*         ====================================================== */
        
        @import url("https://fonts.googleapis.com/css?family=Fjalla+One|Montserrat:300,400,700,800|Open+Sans:300");


main {
  max-width: 720px;
  margin: auto;
}

.card {
  box-shadow: 0 6px 6px rgba(0, 0, 0, 0.3);
  transition: 200ms;
  background: #fff;
}
.card .card__title {
  display: flex;
  align-items: center;
  padding: 30px 40px;
}
.card .card__title h3 {
  flex: 0 1 200px;
  text-align: right;
  margin: 0;
  color: #252525;
  font-family: sans-serif;
  font-weight: 600;
  font-size: 20px;
  text-transform: uppercase;
}
.card .card__title .icon {
  flex: 1 0 10px;
  background: #115dd8;
  color: #fff;
  padding: 10px 10px;
  transition: 200ms;
}
.card .card__title .icon > a {
  color: #fff;
   text-decoration: none;
}
.card .card__title .icon:hover {
  background: #252525;
}
.card .card__body {
  padding: 0 40px;
  display: flex;
  flex-flow: row no-wrap;
  margin-bottom: 25px;
}
.card .card__body > .half {
  box-sizing: border-box;
  padding: 0 15px;
  flex: 1 0 50%;
}
.card .card__body .featured_text h1 {
  margin: 0;
  padding: 0;
  font-weight: 800;
  font-family: "Montserrat", sans-serif;
  font-size: 64px;
  line-height: 50px;
  color: #181e28;
}
.card .card__body .featured_text p {
  margin: 0;
  padding: 0;
}
.card .card__body .featured_text p.sub {
  font-family: "Montserrat", sans-serif;
  font-size: 26px;
  text-transform: uppercase;
  color: #686e77;
  font-weight: 300;
  margin-bottom: 5px;
}
.card .card__body .featured_text p.price {
  font-family: "Fjalla One", sans-serif;
  color: #252525;
  font-size: 26px;
}
.card .card__body .image {
  padding-top: 15px;
  width: 100%;
}
.card .card__body .image img {
  display: block;
  max-width: 100%;
  height: auto;
}
.card .card__body .description {
  margin-bottom: 25px;
}
.card .card__body .description p {
  margin: 0;
  font-family: "Open Sans", sans-serif;
  font-weight: 300;
  line-height: 27px;
  font-size: 16px;
  color: #555;
}
.card .card__body span.stock {
  font-family: "Montserrat", sans-serif;
  font-weight: 600;
  color: #a1cc16;
}
.card .card__body .reviews .stars {
  display: inline-block;
  list-style: none;
  padding: 0;
}
.card .card__body .reviews .stars > li {
  display: inline-block;
}
.card .card__body .reviews .stars > li .fa {
  color: #f7c01b;
}
.card .card__body .reviews > span {
  font-family: "Open Sans", sans-serif;
  font-size: 14px;
  margin-left: 5px;
  color: #555;
}
.card .card__footer {
  padding: 30px 40px;
  display: flex;
  flex-flow: row no-wrap;
  align-items: center;
  position: relative;
}
.card .card__footer::before {
  content: "";
  position: absolute;
  display: block;
  top: 0;
  left: 40px;
  width: calc(100% - 40px);
  height: 3px;
  background: #115dd8;
  background: linear-gradient(to right, #115dd8 0%, #115dd8 20%, #ddd 20%, #ddd 100%);
}
.card .card__footer .recommend {
  flex: 1 0 10px;
}
.card .card__footer .recommend p {
  margin: 0;
  font-family: "Montserrat", sans-serif;
  text-transform: uppercase;
  font-weight: 600;
  font-size: 14px;
  color: #555;
}
.card .card__footer .recommend h3 {
  margin: 0;
  font-size: 20px;
  font-family: "Montserrat", sans-serif;
  font-weight: 600;
  text-transform: uppercase;
  color: #115dd8;
}
.card .card__footer .action button {
  cursor: pointer;
  border: 1px solid #115dd8;
  padding: 14px 30px;
  border-radius: 200px;
  color: #fff;
  background: #115dd8;
  font-family: "Open Sans", sans-serif;
  font-size: 16px;
  transition: 200ms;
}
.card .card__footer .action button:hover {
  background: #fff;
  color: #115dd8;
}

h1 {
            display: block;
            text-align: center;
            color: rgb(126, 107, 107);
            font-weight:bolder;

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
.picleft{
	
	float: left;

} 

.picright{
	float: right;

}       
        
    </style>
    
</head>

<body>
<div class="head">
    <p class="p1">${member3.username}歡迎</p>
	<h1 style="text-align: center">二手商品交易專區-商品發布</h1><hr>
	</div>
	<div class="picleft">
	<a href='https://www.google.com.tw/'><img height="300px" width="200px" src='<c:url value="/other/Picture/1"/>' ></a>
  	</div>
  	<div class="picright">
  	<a href='https://www.google.com.tw/'><img height="300px" width="200px" src='<c:url value="/other/Picture/1"/>' ></a>
<%-- 	<a href='https://www.google.com.tw/'><img src='${pageContext.request.contextPath}/image/unnamed.gif' ></a> --%>
  	</div>
  <main>
    <div class="card">
      <div class="card__title">
        <div class="icon">
          <a href="<c:url value='/goods/home' />"><i class="fa fa-arrow-left">返回功能列表</i></a>
        </div>
        <h3>商品發布</h3>
      </div>
      <form:form method="POST" modelAttribute="newgood" enctype="multipart/form-data" >
      <div class="card__body">
        <div class="half">
          <div class="image">				  
				<img  id="blah" src="<c:url value='/goods/getPicture/${adminimprovegoods.id}' />" alt="" />
          </div>
        </div>
        <div class="half">
          
          <span class="stock"><i class="fa fa-pen"></i> 物品名稱:</span>
          		<form:input id="goodsName" path="goodsName" type="text"/>
                <form:errors path="goodsName"  /><br><br>
          <span class="stock"><i class="fa fa-pen"></i> 數量:(個)</span>  
                <form:input id="goodsNum" path="goodsNum" type="text"/>
                <form:errors path="goodsNum"  /><br><br>
           <span class="stock"><i class="fa fa-pen"></i> 商品單價:(元)</span>
                <form:input id="goodsPrice" path="goodsPrice" type="text"/>
                <form:errors path="goodsPrice"  /><br><br>
           <span class="stock"><i class="fa fa-pen"></i> 發布會員:</span><span>${member3.username}</span>
           		<form:input id="uploadMember" path="uploadMember" type="hidden" value="${member3.username}" />
                <form:errors path="uploadMember" /><br><br>
           <span class="stock"><i class="fa fa-pen"></i> 物品簡介:</span>
           		<form:input id="goodsInt" path="goodsInt" type="textarea"/>
                <form:errors path="goodsInt"  /><br><br>
           <span class="stock"><i class="fa fa-pen"></i> 請選擇物品類別:</span>
           		<select name="goodsType" id="goodsType">
                      <option value="生活用品">生活用品</option>
                      <option value="電子商品">電子商品</option>
                      <option value="書籍">書籍</option>
                      <option value="衣物鞋包">衣物鞋包</option>
                      <option value="運動用品">運動用品</option>
                 </select>
           <br><br>
            <span class="stock"><i class="fa fa-pen"></i> 物品圖片:</span>
            <p><input accept="image/*" type='file' id="imgInp" name="goodpic" /></p>
            <form:errors path="goodpic"  />
             <p id="check"></p>
        </div>
      </div>
      <div class="card__footer">
        <div class="recommend">

        </div>
        <div class="action">
        <button id="oneclick" onclick="fn()">一鍵</button>
          <button type="submit">新增商品</button>
        </div>
      </div>
      </form:form>
    </div>
  </main>

                     
  	<script type="text/javascript">
                    	
    imgInp.onchange = evt => {
      const [file] = imgInp.files
      if (file) {
        blah.src = URL.createObjectURL(file)
                 }
           }
                    	
    function returnworklist(){
                        	
      location.href="<c:url value='/goods/home' />";
          }
	</script>
                        
</body>

</html>