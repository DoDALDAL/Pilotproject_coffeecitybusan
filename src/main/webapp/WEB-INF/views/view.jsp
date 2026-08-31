<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원두 상세정보</title>
<link rel="stylesheet" href="/css/view.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<table class="view-table1">
		<tr>
			<td>
				<div class="back"><a href="/shoppingForm"><i class="fa-solid fa-arrow-left-long"></i>뒤로가기</a></div>
			</td>
		</tr>
		<tr>
			<td rowspan="7" width="30%" class="view-image"><img src="/images/product/${view.pimage}" class="view-image2"></td>
			<td colspan="2" class="image-info">
				<div class="best-sticker"><c:if test="${view.pbest == 'best'}"><span class="best-text">best</span></c:if></div>
				<div class="pbrandname">
					<p class="pbrand">${view.pbrand}<p>
					<span class="pname">${view.pname}</span> &nbsp; <span class="pgram">${view.pgram}g</span>
				</div>
				<div>
					<div class="pprice"><s>${view.pprice}원</s></div>
					<div class="psale"><fmt:formatNumber value="${Math.round(view.pprice*0.9)}" pattern="#,###"/>원</div>
				</div>
			</td>
		</tr>
			<td colspan="2" class="view-info">상품 정보고시</td>
		<tr>
			<td class="view-info-title">식품 유형</td>
			<td class="view-info-con">커피</td>
		</tr>
		<tr>
			<td class="view-info-title">원산지</td>
			<td class="view-info-con">${view.porigin}</td>
		</tr>
		<tr>
			<td class="view-info-title">향미</td>
			<td class="view-info-con">${view.pflavor}</td>
		</tr>
		<tr>
			<td class="view-info-title">내용량</td>
			<td class="view-info-con">${view.pgram}g</td>
		</tr>
		<tr>
			<td class="view-info-title">등록일</td>
			<td class="view-info-con"><fmt:formatDate value="${view.pdate}" pattern="yyyy-MM-dd"/></td>
		</tr>
	</table>
	<table class="view-table2">
		<tr>
			<td class="con-title">상세정보</td>
		</tr>
		<tr>
			<td class="con-content">${view.pcontent}</td>
		</tr>
	</table>
	<div class="view-button">
		<input type="button" value="장바구니 담기" class="cart-button">
		<input type="button" value="주문하기" class="buy-button">
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>