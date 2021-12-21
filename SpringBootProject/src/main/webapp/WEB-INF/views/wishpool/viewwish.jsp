<% String path = request.getContextPath(); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<title>Left Sidebar - Strongly Typed by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<c:url value='/wishpool/css/main.css' />" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
</head>
<script type="text/javascript">
// 	function vote(){
// 		var xh = new XMLHttpRequest();
// 		xh.open("post","/vote",true);
// 		xh.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
//  		xh.send('name=z');
		
// 		xh.onload = function(){
// 			document.getElementById("votecount").innerHTML("sssss");
// 			console.log(xh.status);
// 		       console.log(xh.responseText);
// 		}
// 	}	
	function vote(){                  
		var num=$("#votecount").val();
		var params={"supportting":num};
		    $.ajax({
		        url:"vote", 
		        type : "POST",                                                                    
		        contentType:'application/json', 
 		        data:JSON.stringify(params),
		        error:function(data){                                                                 
		        	alert("失敗");
		        },
		        success:function(data){   
		        	$("#votecount").text(data);
		        }
		    }); 
		};
</script>
<style>
.tupian{
	height: 320px; /*can be anything*/
    width: 320px; /*can be anything*/
    display: block; 
    position: relative;
    margin:0 auto
 } 
/* .tupian img{ */
/*     max-width: 100%; */
/*     max-height: 100%; */
/*     width:auto; */
/*     height:auto; */
/*     position: absolute; */
/*     left: 50%; */
/*     top: 50%; */
/*     transform: translate3d(-50%,-50%,0); */
/*     -webkit-transform: translate3d(-50%,-50%,0); */
/* }  */
</style>
<body class="left-sidebar is-preload">
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
    			<section id="main">
					<div class="container">
						<div class="row">
							<!-- Content -->
								<div id="content" class="col-8 col-12-medium imp-mediu" style="margin:0 auto;">

									<!-- Post -->
										<article class="box post">
											<header>
												<h2><strong>${wishpoolBean.title}</strong></h2>
												<p align="right">結束時間:${wishpoolBean.stoptime}</p>
											</header>

											<span class="image featured"><img src="<c:url value='/getPicture/${wishpoolBean.wishpoolId}' />" /></span>
											<p>&emsp;&emsp;${wishpoolBean.content}</p><br>
											<input type="button" value="許願" onclick="vote()">
											<div id="votecount" name="votecount">投票數:${wishpoolBean.supportting}</div>
											
										</article>

								</div>

						</div><br><br><br><br><br><br><br>
						<div class="container">
							<div class="row aln-center">
								<c:forEach var='pool' items="${wishpool}">	
									<c:if test="${pool.wishpoolId <= 3}">
										<div class="col-4 col-6-medium col-12-small">
											<!-- Feature -->
												<section>
													<div class="tupian">
													<a href="<c:url value="/view/${pool.wishpoolId}" />" class="image featured"><img src="<c:url value='/getPicture/${pool.wishpoolId}' />" /></a>
													</div>
													<header>
														<h3>${pool.title}</h3>
													</header>
													<p>&emsp;&emsp;${pool.content}</p>
												</section>
										</div>
									</c:if>
								</c:forEach>
							</div>		
						</div>
					</div>


				</section>
					<div align='center'>
						<a href="<c:url value='/allsearch' />" ><input type="button" value="回上頁"></a>
					</div>            			
<%-- 		</form:form> --%>
    </div>

		<!-- Scripts -->
		<script src="assets/wishpool/js/jquery.min.js"></script>
		<script src="assets/wishpool/js/jquery.dropotron.min.js"></script>
		<script src="assets/wishpool/js/browser.min.js"></script>
		<script src="assets/wishpool/js/breakpoints.min.js"></script>
		<script src="assets/wishpool/js/util.js"></script>
		<script src="assets/wishpool/js/main.js"></script>
</body>
</html>