<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page language="java"  pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<title>Crispy Restaurant Category Flat Bootstrap Responsive Website Template | Blog :: W3layouts</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Crispy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />

<!--     <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script> -->
	
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

<!-- blog -->
<section class="blog py-5">
	<div class="container py-md-3">
		<h2 class="heading text-center mb-sm-5 mb-4">자유 게시판 </h2>
		<div class="row blog-grids head">
		<c:forEach items="${free_board}" var="board">
			<div class="col-lg-7 mb-lg-5 blog-img1">
				<img src="${pageContext.request.contextPath}/resources/images/blog1.jpg" alt="" class="img-fluid" onerror="javascript:src={${pageContext.request.contextPath}/resources/images/blog1.jpg}"/>
				<a href="single.JSP">Blog #<c:out value="${board.bno }"/></a>
			</div>
			<div class="col-lg-5 mb-lg-5 mb-4">
				<h5><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></h5>
				<h4 class="my-3"><a class='move' href='<c:out value="${board.bno}"/>'><c:out value="${board.title}" /></a></h4>
				<p class="my-3"><c:out value="${board.content}" /></p>
				<a href="single.JSP" class="btn-banner"> View Post <c:out value="${board.bno }"/></a>
				<c:out value="${board.content }"/>
			</div>
			</c:forEach>
			<!--  Pagination 시작 -->
				<div class='pull-right'>
					<ul class="pagination">
						
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}"	end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
			<!--  Pagination 끝 -->
			<!-- 페이징 Form 시작 -->
				<form id='actionForm' action="/free_board" method='get'>
				<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
				<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
				</form>
				<!-- 페이징 Form 끝 -->
				
				<!-- Modal  추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Modal title</h4>
						</div>
						<div class="modal-body">처리가 완료되었습니다.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary" data-dismiss="modal">Save
								changes</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
				
		</div>
	</div>
</section>
			
<!-- //blog -->

<%@include file="footer.jsp" %>

<!-- copyright -->
<div class="copyright">
	<div class="container py-4">
		<div class=" text-center">
			<p>Â© 2019 Crispy. All Rights Reserved | Design by <a href="http://w3layouts.com/"> W3layouts</a> </p>
		</div>
	</div>
</div>
<!-- //copyright -->
		
<!-- move top -->
<div class="move-top text-right">
	<a href="#home" class="move-top"> 
		<span class="fa fa-angle-up  mb-3" aria-hidden="true"></span>
	</a>
</div>
<!-- move top -->

<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>';
		
		checkModal(result);
		// replaceState(data, title [, url ]) 히스토리를 수정
		history.replaceState({}, null, null);

		function checkModal(result) {
			// alert(history.state);
			// 글 등록 후 리스트 화면에서 model창이 나온 뒤 새로고침을 해도 model창이 안나오도록
			// result값 체크
			// result값은 controller에서 넘어온 1회성 값으로 페이지를 다시 읽으면 null이된다.
			// history.state 는 조회에서 back 했을때 history객체의 현재 정보를 읽어 값이 있다면 
			// modal창을 띄우지 않는다.
			if (result === '' || history.state) {
				return;
			}

			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result)	+ " 번이 등록되었습니다.");
			}

			$("#myModal").modal("show");
		}
		
		$("#regBtn").on("click", function() {
			self.location = "/admin/register";
		});
		
		var actionForm = $("#actionForm");

		// 페이지 번호 클릭 이벤트
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			// console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		// 상세보기 클릭 이벤트
		$(".move").on("click",function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='" + $(this).attr("href")	+ "'>");
			actionForm.attr("action", "/admin/get");
			actionForm.submit();
		});
		
		// 검색 버튼 클릭 이벤트
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",	function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하세요");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			searchForm.submit();
		});
	});
</script>

