<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	
	<div class="main-banner">
	    <div class="banner-text">
	        <p class="banner-title">커피 도시 부산에 오신 것을 환영합니다</p>
	        <p class="banner-subtitle">부산에서만 맛 볼 수 있는 로스터리 카페의 원두</p>
	        <a href="/shoppingForm" class="shopping-link">쇼핑하기</a>
	    </div>
	</div>
	
	<main class="main-content">
        <div class="section-title">
            <div class="best">BEST</div>
            <p>부산을 대표하는 제품을 만나보세요.</p>
        </div>
        
        
        <div>
			<table class="productBest-table">
	    		<tr>
		    <c:forEach var="best" items="${list}" varStatus="status">
			        <td>
			        	<div class="pbest">${best.pbest}</div>
			            <a href="/ViewForm?pno=${best.pno}">
			                <img src="/images/product/${best.pimage}" alt="${best.pname}">
			            </a><br>
			            <div class="bestPbrand">${best.pbrand}</div>
			            <a href="/ViewForm?pno=${best.pno}" class="bestPname">${best.pname}</a>
			            <div class="bestPgram">${best.pgram}g</div><br>    
			            <div class="bestPprice">정상가격 : <s>${best.pprice}원</s></div>
			            <div class="bestPsale">-> 할인가격 : <fmt:formatNumber value="${Math.round(best.pprice*0.9)}" pattern="#,###"/>원</div>
			        </td>
		    	<c:if test="${(status.index + 1) % 4 == 0 && !status.last}">
		        </tr>
		        <tr>
		        </c:if>
		    </c:forEach>
		    	</tr>
			</table>
		</div>
		
		<div class="shopping-link2"><a href="/shoppingForm" class="shopping-linka">상품 더보기</a></div>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>