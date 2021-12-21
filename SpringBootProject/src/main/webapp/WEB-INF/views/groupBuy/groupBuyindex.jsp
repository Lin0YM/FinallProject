<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupBuyindex</title>
</head>
<body>
	groupBuyindex
	<div><a href="<c:url value='/' />">回首頁</a></div>
	<table>
		<tr>
			<td>
				<a href="<c:url value='/admin' />">管理員</a><br>
			</td>
			<td>
				<a href="<c:url value='/shop?name=黑橋牌' />">廠商黑橋牌</a><br>
			</td>
			<td>
				<a href="<c:url value='/shop?name=禎祥食品' />">廠商禎祥食品</a><br>
			</td>
			<td>
				<a href="<c:url value='/shop?name=義美食品' />">廠商義美食品</a><br>
			</td>
			<td>
				<a href="<c:url value='/shop?name=卜蜂食品' />">廠商卜蜂食品</a><br>
			</td>
			<td>
				<a href="<c:url value='/shop?name=亞尼克' />">廠商亞尼克</a><br>
			</td>
			
			<td>
				<a href="<c:url value='/buyer?name=林小明' />">林小明</a><br>
			</td>
			<td>
				<a href="<c:url value='/buyer?name=hahaha' />">hahaha</a><br>
			</td>
			<td>
				<a href="<c:url value='/buyer?name=林大明' />">林大明</a><br>
			</td>
			<td>
				<a href="<c:url value='/buyer?name=張先生' />">張先生</a><br>
			</td>

			<td>
				<a href="<c:url value='/test' />">測試頁面</a><br>
			</td>
		</tr>
	</table>
</body> 
</html>