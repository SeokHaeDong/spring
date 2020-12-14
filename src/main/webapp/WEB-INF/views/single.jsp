<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


<title>Crispy Restaurant Category Flat Bootstrap Responsive Website Template | Single :: W3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Crispy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    
    <script>
//썸네일 파일명을 가져오는 함수
function getThumbFileName(fullFilePath) {
	var arrString = fullFilePath.split("/");
	console.log(arrString);
	arrString.splice(-1, 1, "s_" + arrString[arrString.length - 1]);
	return arrString.join("/");
}
</script>
	
	<!-- css files -->
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel='stylesheet' type='text/css' /><!-- bootstrap css -->
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel='stylesheet' type='text/css' /><!-- custom css -->
    <link href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css" rel="stylesheet"><!-- fontawesome css -->
	<!-- //css files -->
	




<%@include file="header.jsp" %>

<!-- banner -->
<div class="innerpage-banner" id="home">
	<div class="inner-page-layer">
	</div>
</div>
<!-- //banner -->

<!-- single -->
<section class="bottom-banner-w3layouts py-5">
	<div class="container py-md-3">
		<h2 class="heading text-center mb-sm-5 mb-4">게시글 상세 보기 </h2>
		<div class="row inner-sec-w3ls-agileinfo">
			<!--left-->
			<div class="col-lg-8 left-blog-info text-left">
					<div class="card">
						<a href="single.JSP">
							<label>Title</label> <input class="form-control" name='title' value='<c:out value="${board.title }"/>' readonly="readonly">
						</a>
						<div class="card-body">
							<ul class="blog-icons my-4">
								<li>
									<a><span class="fa fa-calendar"></span><c:out value="${board.updateDate}"/></a>
									<a></a>
								</li>
							</ul>
							<a>작성자 : <c:out value="${board.writer}"/></a>
							<h5 class="card-title ">
								<c:out value="${board.title }"/>
							</h5>
							<p class="card-text"><c:out value="${board.content }"/></p>


						</div>
					</div>
			</div>
			<!--//left-->
			<!--right-->
			<aside class="col-lg-4 right-blog-con text-left">
				<div class="right-blog-info text-left">
					<div class="tech-btm">
						<img src="" class="card-img-top img-fluid rounded" alt="">
					</div>
				</div>
			</aside>
			<!--//right-->
		</div>
			<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="isAuthenticated()">
	<c:if test="${pinfo.username eq board.writer}">
		<button data-oper='modify' class="btn btn-default">Modify</button>
	</c:if>
</sec:authorize>
<button data-oper='list' class="btn btn-info">List</button>

<form id='operForm' action="/admin/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
</form>
	</div>

</section>
<!-- //contact -->

<script type="text/javascript">
$(document).ready(function() {
  
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/single_modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/free_board")
    operForm.submit();
    
  });  
});
</script>

<%@include file="footer.jsp" %>
