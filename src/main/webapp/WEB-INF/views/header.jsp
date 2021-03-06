<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>



<script
	src="<c:url value="${pageContext.request.contextPath}/resources/js/jquery-1.10.2.js"/>"></script>

<meta charset="UTF-8">
<title></title>
<%
	request.setCharacterEncoding("utf-8");
%>


	<!-- top header -->
	<div class="header-top">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<ul class="d-lg-flex header-w3_pvt">
						<li class="mr-lg-3"><span class="fa fa-envelope-open"></span>
							<a href="mailto:olderbabyfox@kakao.com" class="">제발 좀 되라@kakao.com</a>
						</li>
					</ul>
				</div>
				<%
					Date nowTime = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a");
				%>
				<div class="col-sm-6 header-right-w3_pvt">
					<ul class="d-lg-flex header-w3_pvt justify-content-lg-end">
						<li class=""><span class=""><span class="fas fa-clock"><%=sf.format(nowTime)%></span></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- //top header -->

	<!-- //header -->
	<header class="py-sm-3 pt-3 pb-2">
		<div class="container">
			<div id="logo">
				<h1>
					<a href="home.JSP"><span class="fa fa-cutlery"
						aria-hidden="true"></span> 찾아먹는 재미</a>
				</h1>
			</div>
			<!-- nav -->
			<nav class="d-lg-flex">

				<label for="drop" class="toggle"><span class="fa fa-bars"></span></label>
				<input type="checkbox" id="drop" />
				<ul class="menu mt-2 ml-auto">
					<li class="active"><a href="home.JSP">Home</a></li>
					<li class=""><a href="about.JSP">About Us</a></li>
					<li class=""><a href="gallery.JSP">사진</a></li>
					<li class=""><a href="free_board.JSP">자유 게시판</a></li>
					<li class=""><a href="recipe_board.JSP">레시피 게시판</a></li>
					<div class="login-icon ml-2">
						<sec:authorize access="isAuthenticated()">
							<li id="logout"><a href="/customLogout"><i
									class="fa fa-sign-out fa-fw"></i>Logout</a></li>
						</sec:authorize>

						<sec:authorize access="isAnonymous()">
							<li><a href="/customLogin"><i
									class="fa fa-sign-out fa-fw"></i>Login</a></li>
						</sec:authorize>
					</div>
				</ul>


			</nav>
			<div class="clear"></div>
			<!-- //nav -->
		</div>
	</header>
	<!-- //header -->
