<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록상품 목록</title>
<link rel="stylesheet" href="/css/memberlist.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="main-content">
		<div class="title">상품 목록</div>
		<div class="product-button">
			<span>총 <b>00</b>개의 상품이 있습니다.</span>
			<a href="/admin/productWriteForm">상품등록</a>
		</div>
		
		<table class="productlist-table">
			<tr>
				<th>상품번호</th>
				<th>카페명</th>
				<th>이미지</th>
				<th>원두명</th>
				<th>중량(g))</th>
				<th>가격(원)</th>
				<th>수량(개)</th>	
				<th>등록일</th>
				<th>best</th>
			</tr>
		<c:forEach var="list" items="${list}">	
			<tr>
				<td>${list.pno}</td>
				<td>${list.pbrand}</td>
				<td><a href="/admin/productView?pno=${list.pno}"><img src="/images/product/${list.pimage}" width="100"></a></td>
				<td><a href="/admin/productView?pno=${list.pno}" class="link-pname">${list.pname}</a></td>
				<td>${list.pgram}</td>
				<td>${list.pprice}</td>
				<td>${list.pamount}</td>	
				<td><fmt:formatDate value="${list.pdate}" pattern="yyyy-MM-dd"/> </td>
				<td>${list.pbest}</td>
			</tr>
		</c:forEach>
		</table>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>