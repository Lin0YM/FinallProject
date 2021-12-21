<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<title>許願池</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<c:url value='/wishpool/css/main.css' />" />
</head>
<body class="homepage is-preload">
<div id="page-wrapper">
			<!-- Header -->
				<section id="header">
					<div class="container">
					<!-- Logo -->
							<h1 id="logo"><a href="wishindex">Make a Wish</a></h1>
						<!-- Nav -->
							<nav id="nav" style="position: absolute;">
								<ul>
									<li><a class="icon solid fa-home" href="<c:url value='/' />"><span>回首頁</span></a></li>
<%-- 									<li><a class="icon solid fa-cog" href="<c:url value='/wishindex' />"><span>Left Sidebar</span></a></li> --%>
									<li><a class="icon solid fa-retweet" href="<c:url value='/allsearchByMemberCRUD' />"><span>查看許願</span></a></li>
								</ul>
							</nav>			
					</div>
				</section>
			<!-- Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<!-- Content -->
								<div id="content" class="col-8 col-12-medium imp-mediu" style="margin:0 auto;">
									<!-- Post -->
										<article class="box post">
									    	<table>
									    		<tr>
													<td align='right' width="20">編號：</td>
													<td width='300'>${wishpoolBean.wishpoolId}</td>
												</tr>
												<tr>
													<td align='right'>標題：</td>
													<td width='300'>${wishpoolBean.title}</td>
												</tr>
												<tr>
													<td align='right'>內容：</td>
													<td width='300'>${wishpoolBean.content}</td>
												</tr>
												<tr>
													<td align='right' valign="top">圖片：</td>
													<td width='300'>&emsp;<img src="<c:url value='/getPicture/${wishpoolBean.wishpoolId}' />" id="changeImage" width="300" style="display:block; margin:auto;"></td>
												</tr>
									    	</table>		
												<div style="text-align: center;">您已成功許願 謝謝!!<br><a href="<c:url value='/wishindex' />" ><input type="button" value="回首頁"></a></div>
										</article>
								</div>
						</div>
						<div>&nbsp;</div>
					</div>
				</section>
</div>

			<!-- Scripts -->
			<script src="/wishpool/js/jquery.min.js"></script>
			<script src="/wishpool/js/jquery.dropotron.min.js"></script>
			<script src="/wishpool/js/browser.min.js"></script>
			<script src="/wishpool/js/breakpoints.min.js"></script>
			<script src="/wishpool/js/util.js"></script>
			<script src="/wishpool/js/main.js"></script>
</body>
</html>