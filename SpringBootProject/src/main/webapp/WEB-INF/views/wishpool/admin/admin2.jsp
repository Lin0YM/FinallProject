<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>會員中心</title>

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

.aside {
	/* margin: 20px auto; */
	width: 11%;
	float: left;
	text-align: center;
	box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.2);
	margin-left: 100px;
	margin-top: 85px;
	text-align: center;
	background-color: white;
	border-radius: 5px;
}

.aside a {
	text-decoration: none;
	line-height: 45px;
	font-size: 18px;
	color: rgb(126, 107, 107);
	list-style-type: none;
	font-weight: bolder;
	display: block;
}

.aside a:hover {
	background-color: rgb(126, 107, 107);
	color: rgb(231, 221, 213);
	border-radius: 5px;
}

.article {
	width: 78%;
	float: right;
}

#allpage {
	width: 82%;
	margin: 0 auto;
}

.tablediv {
	width: 1000px;
	margin: 20px auto;
	background-color: white;
}

.h1 {
	text-align: center;
	margin: 30px 0;
}
</style>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div id="allpage">
		<aside class="aside">
			<br> <a href="">會員資料</a><br>
			<a href="<c:url value='/singlebuy/orderlist' />">網購訂單查詢</a><br>
			<a href="">團購訂單查詢</a><br>
			<a href="">討論區管理</a><br>
			<a href="">許願池管理</a><br>
			<a href="">二手拍賣管理</a><br>
		</aside>
		<article class="article">
			<h2 class="h1">訂單列表</h2>
			<div class="tablediv">
			
				<table>
					<thead>
					  <tr>
						<th>編號</th>
						<th>標題</th>
						<th>內容</th>
						<th>縮圖</th>
						<th>發起人</th>
						<th>投票量</th>
						<th>投票量(結束)</th>
						<th>建立時間</th>
						<th>截止時間</th>
						<th>分類</th>
						<th>功能</th>
					  </tr>
				</thead>	
				<tbody>
				<c:forEach var='pool' items="${wishpool}">	
					  <tr>
						<td align="center">${pool.wishpoolId}</td>

						<td align="center">${pool.title}</td>

						<td width="30%">${pool.content}</td>

						<td><img src="<c:url value='/getPicture/${pool.wishpoolId}' />" width="96" style="display:block; margin:auto;"><br></td>
						
						<td align="center">${pool.creator}</td>
						
						<td align="center">${pool.supportting}</td>
						
						<td align="center">${pool.endsupport}</td>
						
						<td align="center">${pool.createtime}</td>
						
						<td align="center">${pool.stoptime}</td>
						
						<td align="center">${pool.sort}</td>

						<td align='center'><a href="<c:url value="/adminupdate/${pool.wishpoolId}" />">修改</a>
							<a href='<c:url value="/admindelete/${pool.wishpoolId}" />'>刪除</a>
							<a href='<c:url value="/adminview/${pool.wishpoolId}" />'>預覽</a></td>
					</tr>
				</c:forEach>
				  </tbody>
				  </table>

			</div>
			<br> <br> <br> <br>
		</article>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>