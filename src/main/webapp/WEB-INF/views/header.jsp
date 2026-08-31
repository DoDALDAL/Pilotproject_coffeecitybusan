<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<header class="main-header">
		<div class="top-notice-bar">회원가입시 첫 쇼핑을 지원하는 배송비 무료+3,000원 할인 쿠폰 / 동백전 사용 가능</div>
		
		<div class="header-body">
			<div class="header-left"></div>
			
			<div class="header-center">
				<a href="/main"><img src="/images/logo/logo1.png" class="logo1"></a>
			</div>
			
			<div class="header-right">
				<sec:authorize access="isAnonymous()">
					<a href="/main" title="홈"><i class="fa-solid fa-house"></i></a>
					<a href="/loginForm" title="로그인"><i class="fa-solid fa-user"></i></a>
					<a href="#" title="장바구니"><i class="fa-solid fa-bag-shopping"></i></a>
				</sec:authorize>
				<sec:authorize access="hasRole('USER')">
					<span><strong><sec:authentication property="principal.username"/></strong>님</span>
					<a href="/member/passwordCheckForm?mode=update" title="프로필 수정"><i class="fa-solid fa-user"></i></a>
					<a href="/main" title="홈"><i class="fa-solid fa-house"></i></a>
					<a href="#" title="상품목록"><i class="fa-solid fa-basket-shopping" title="장바구니"></i></a>
					<a href="/logout" title="로그아웃"><i class="fa-solid fa-right-from-bracket"></i></a>
				</sec:authorize>
				<sec:authorize access="hasRole('ADMIN')">
					<span><strong><sec:authentication property="principal.username"/></strong>님</span>
					<a href="/main" title="홈"><i class="fa-solid fa-house"></i></a>
					<a href="/member/passwordCheckForm?mode=update" title="프로필 수정"><i class="fa-solid fa-user"></i></a>
					<a href="/admin/list" title="회원목록"><i class="fa-solid fa-users"></i></a>
					<a href="/admin/productList" title="상품목록"><i class="fa-solid fa-list"></i></a>
					<a href="/logout" title="로그아웃"><i class="fa-solid fa-right-from-bracket"></i></a>
				</sec:authorize>
			</div>
		</div>
	</header>
</body>
</html>