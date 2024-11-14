<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<header>
	<div class="container-fluid" style="height: 45px;
										background-color: #ffffff;
										border-bottom: 1px solid #777777;
										padding: 0px 5px;">
		<div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	      	<button type="button" class="btn p-0" id="btnToggleSideNav" style="background-color: #ffffff; color: #000000; border: 1px solid #ffffff;">
				<i class="fa-solid fa-list" style="font-size: 25px;"></i>
			</button>
	        <div class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
	        	<img class="bi mx-2" src="<c:url value='/resources/assets/images/header_logo2.png?ver=3'/>" style="height: 35px; margin: 5px;">
	        </div>
	        <div class="me-lg-auto"></div>
	        <ol class="breadcrumb col-12 col-lg-auto align-items-end mb-2 justify-content-center mb-md-0" style="margin-right: 5px;">
				<li class="breadcrumb-item" id="headerSubName" style="font-size: 13px;"></li>
				<li class="breadcrumb-item" id="headerMainName" style="font-size: 15px; font-weight:900;"></li>
			</ol>
			<div class="btn-group me-2 d-none">
				<button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
					언어선택
				</button>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="?lang=ko">한글</a></li>
					<li><a class="dropdown-item" href="?lang=en">English</a></li>
				</ul>
			</div>
			<div class="dropdown text-end">
				<a href="#" class="d-block link-dark text-decoration-none" data-bs-toggle="dropdown" aria-expanded="false">
					<i class="fa-solid fa-gear" style="font-size: 25px;"></i>
				</a>
				<ul class="dropdown-menu text-small">
					<li><a class="dropdown-item" href="#" onClick="window.location.reload()">새로고침</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#" id="btnLogout">로그아웃</a></li>
				</ul>
			</div>
		</div>
    </div>
</header>
<script>
	//sideNav 버튼 click
	/*$('#btnToggleSideNav').on('click',function() {
		if($('#sideNav').css('display') == 'none') {
			$('#sideBackground').css('width','100vw');
			$('#sideNav').show(300);
		} else {
			$('#sideBackground').css('width','0px');
			$('#sideNav').hide(300);
		}
	});*/ 

	$('#btnToggleSideNav').on('mouseenter',function(){
		if($('#sideNav').css('display') == 'none') {
			$('#sideBackground').css('width','100vw');
			$('#sideNav').show(300);
		} else {
		}
	});
	
		
	// 로그아웃 버튼 click
	$('#btnLogout').on('click',function() {
		$.ajax({
			url: '<c:url value="/auth/logout"/>',
            type: 'POST',
            data: {},
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") { //응답결과
					location.href = "/auth/login";
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
				$('#my-spinner').hide();
			}
		});
	});
</script>