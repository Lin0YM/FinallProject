<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
</head>
<body>
	Test
	<div><a href="<c:url value='/groupBuyindex' />">回購物功能首頁</a></div>
	<div>
		<div>
			<a href="<c:url value='/testShopItem' />">測試ShopItem</a><br>
			<a href="<c:url value='/testBuyDetail' />">測試BuyDetail</a><br>
			<a href="<c:url value='/testBuyList' />">測試BuyList</a><br>
			<a href="<c:url value='/testGroupList' />">測試GroupList</a><br>
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
			<tr>
				<c:forEach items='${testBuyDetailResult}' var='tbdr'>
					<td>
						<p>groupName: ${tbdr.groupName}</p>
						<p>groupShopName: ${tbdr.groupShopName}</p>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach items='${testBuyListResult}' var='tblr'>
					<td>
						<p>buyerName: ${tblr.buyerName}</p>
						<p>itemNumber: ${tblr.itemNumber}</p>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<c:forEach items='${testGroupListResult}' var='tglr'>
					<td>
						<p>groupName: ${tglr.groupName}</p>
						<p>groupArea: ${tglr.groupArea}</p>
					</td>
				</c:forEach>
			</tr>
		</table>
		
<%-- 		<a href="<c:url value='/adminUpdate?groupBuyId=${re.groupId}'/>">修改</a> --%>
<%-- 		<a href="<c:url value='/adminDelete/${re.groupBuyId}'/>">刪除</a> --%>
	</div>
</body>
</html>