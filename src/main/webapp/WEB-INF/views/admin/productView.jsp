<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 상세정보</title>
<link rel="stylesheet" href="/css/productView.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="main-content">
		<div class="title">상품정보</div>
		<table class="productView-back">
			<tr>
				<td>
					<div class="back"><a href="/admin/productList"><i class="fa-solid fa-arrow-left-long"></i>뒤로가기</a></div>
				</td>
			</tr>
		</table>
		<table class="productView-table">
			<tr>
				<th>상품번호</th>
				<td>${view.pno}</td>
				<th>best</th>
				<td>${view.pbest}</td>
				<th>등록일</th>
				<td><fmt:formatDate value="${view.pdate}" pattern="yyyy-MM-dd"/> </td>
			</tr>
		</table>
		<table class="productView-table">
			<tr>
				<td rowspan="5"><img src="/images/product/${view.pimage}" class="product-image"></td>
				<th>카페명</th>
				<td>${view.pbrand}</td>
			</tr>
			<tr>
				<th>원두명</th>
				<td>${view.pname}</td>
			</tr>
			<tr>
				<th>원산지</th>
				<td colspan="2">${view.porigin}</td>
			</tr>
			<tr>
				<th>향</th>
				<td colspan="3">${view.pflavor}</td>
			</tr>
			<tr>
				<th>상세설명</th>
				<td colspan="4" height="200" class="pcontent">${view.pcontent}</td>
			</tr>
		</table>
		<table class="productView-table">
			
			<tr>
				<th>중량(g)</th>
				<td>${view.pgram}</td>
			</tr>
			<tr>
				<th>가격(원)</th>
				<td>${view.pprice}</td>
			</tr>
			<tr>
				<th>수량(개)</th>
				<td>${view.pamount}</td>
			</tr>
		</table>
		<div  class="product-button">
			<a href="/admin/productUpdateForm?pno=${view.pno}" class="productViewButton">상품 수정</a>
			<a href="/admin/productDelete?pno=${view.pno}" class="productDeleteButton">상품 삭제</a>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>