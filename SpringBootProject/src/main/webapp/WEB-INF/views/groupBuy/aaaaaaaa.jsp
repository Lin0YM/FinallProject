<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xx</title>
</head>
<body>
	xx
	<div><a href="<c:url value='/groupBuyindex' />">回購物功能首頁</a></div>
	<div>
		<div>
			<a href="<c:url value='/xx' />">xx</a><br>

		</div>
		<table>
			<tr>
				<c:forEach items='${testShopItemResult}' var='tsir'>
					<td>
						<p>shopName: ${tsir.shopname}</p>
						<p>shopitem: ${tsir.shopitem}</p>
					</td>
				</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>