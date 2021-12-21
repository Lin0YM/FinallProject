<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
							<h1 id="logo"><a href="<c:url value='/wishindex' />">Make a Wish</a></h1>
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
											<c:url var="wish" value="/wish" />
									        <form:form method='POST' modelAttribute="wishpoolBean" action='${wish}' enctype="multipart/form-data">
												<table id="table">
													<c:if test='${wishpoolBean.wishpoolId != null}'>
									                 	<form:hidden path="wishpoolId" /><br>&nbsp;
									                 	<form:hidden path="createtime" value="${wishpoolBean.createtime}" /><br>&nbsp;
									                 		<tr>
																<td align='right' width="20">ID：</td>
																<td width='300' width="80%">${wishpoolBean.wishpoolId}&nbsp;
																</td>
															</tr>
													</c:if>
														<tr>
															<td align='right' width="20">標題：</td>
															<td width='300' width="80%"><form:input path="title" size="25"/>
																<form:errors path="title" cssClass="error" />&nbsp;
															</td>
														</tr>
														<tr>
															<td align='right'>內容：
															</td>
															<td width='300'><form:textarea path="content" size="200" /><br>
															    <form:errors path="content" cssClass="error" />
															</td>
														</tr>
														<c:choose>
															<c:when test='${wishpoolBean.wishpoolId != null}'>
																<tr>
																	<td align='right'>分類:
																	</td>
																	<td width='300'>
																		<form:select path="sort">
															                <form:option value="live">生活、居家</form:option>
															                <form:option value="sport">運動、健身</form:option>
															                <form:option value="food">名產、食品</form:option>
															                <form:option value="careproducts">保養、彩妝</form:option>
															                <form:option value="accessories">飾品、配件</form:option>
															                <form:option value="books">書籍、文創</form:option>
															                <form:option value="game">遊戲、電玩</form:option>
															            </form:select>
																	</td>							
																</tr>
																<tr>
																	<td align='right'>修改圖片:
																	</td>
																	<td><form:input id="productImage" path="productImage" type='file' class='form:input-large' onclick="change()"/><br>
																	</td>							
																</tr>
																<tr>
																	<td align='right'>
																	</td>
																	<td width='300'><img src="<c:url value='/getPicture/${wishpoolBean.wishpoolId}' />" id="changeImage" width="300" style="display:block; margin:auto;"><br>
																	</td>							
																</tr>
															</c:when>
															<c:otherwise>
																<tr>
																	<td align='right'>上傳圖片:
																	</td>
																	<td width='300'><form:input path="productImage" type='file'/><br>
																	</td>							
																</tr>
																
																<tr>
																	<td align='right'>分類:
																	</td>
																	<td width='300'>
																		<form:select path="sort">
															                <form:option value="live">生活、居家</form:option>
															                <form:option value="sport">運動、健身</form:option>
															                <form:option value="food">名產、食品</form:option>
															                <form:option value="careproducts">保養、彩妝</form:option>
															                <form:option value="accessories">飾品、配件</form:option>
															                <form:option value="books">書籍、文創</form:option>
															                <form:option value="game">遊戲、電玩</form:option>
															            </form:select>
																	</td>							
																</tr>
																
															</c:otherwise>
														</c:choose>	
													</table>
														<div align='center'>
															<input type='submit' value='提交'><hr>
															<c:choose>
																<c:when test='${wishpoolBean.wishpoolId != null}'>
																	<a href="<c:url value='/allsearch' />"><input type="button" value="回上頁" name="wishpool"></a> 
																</c:when>
																<c:otherwise>
																	<a href="<c:url value='/wishindex' />"><input type="button" value="回上頁" name="wishpool"></a>
																</c:otherwise>
															</c:choose>	
														</div>            			
											</form:form>		
										</article>
									</div>
								</div>
							<div>&nbsp;</div>
						</div>
					</section>
</div>

    <script type="text/javascript">
        productImage.onchange = evt => {							 	    
          	const [file] = productImage.files
          	if (file) {
          		changeImage.src = URL.createObjectURL(file)
          	}                
        }
	</script>
			<!-- Scripts -->
			<script src="/wishpool/js/jquery.min.js"></script>
			<script src="/wishpool/js/jquery.dropotron.min.js"></script>
			<script src="/wishpool/js/browser.min.js"></script>
			<script src="/wishpool/js/breakpoints.min.js"></script>
			<script src="/wishpool/js/util.js"></script>
			<script src="/wishpool/js/main.js"></script>
</body>
</html>