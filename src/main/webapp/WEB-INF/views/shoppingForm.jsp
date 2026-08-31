<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑하기</title>
<link rel="stylesheet" href="/css/shoppingForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<main class="main-content">
		<div class="shopping-title">Coffee City Busan 원두</div>

		<div>
			<table class="product-table">
				<tr>
					<td colspan="4"><div class="underText">총 <b>00</b>개의 상품이 있습니다.</div></td>
				</tr>
	    		<tr>
		    <c:forEach var="dto" items="${pdto}" varStatus="status">
		        <td>
		        	<div class="best-sticker"><c:if test="${dto.pbest == 'best'}"><span class="best-text">best</span></c:if></div>
		            <a href="/ViewForm?pno=${dto.pno}">
		                <img src="/images/product/${dto.pimage}" alt="${dto.pname}">
		            </a><br>
		            <div class="p-brand">${dto.pbrand}</div>
		            <a href="/ViewForm?pno=${dto.pno}" class="p-name">${dto.pname}</a>
		            <div class="p-gram">${dto.pgram}g</div><br>    
		            <div class="p-price">정상가격 : <s>${dto.pprice}원</s></div>
		            <div class="p-sale">-> 할인가격 : <fmt:formatNumber value="${Math.round(dto.pprice*0.9)}" pattern="#,###" />원</div>
		        </td>
		    	<c:if test="${(status.index + 1) % 4 == 0 && !status.last}">
		            </tr><tr>
		        </c:if>
		    </c:forEach>
		    	</tr>
			</table>
		</div>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>