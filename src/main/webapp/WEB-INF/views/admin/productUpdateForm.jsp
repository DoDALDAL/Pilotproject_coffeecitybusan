<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
<script>
function pcheckUp(){
	let pname = document.product.pname;
	let porigin = document.product.porigin;
	let pgram = document.product.pgram;
	let pprice = document.product.pprice;
	let pupload = document.product.pupload;
	let pamount = document.product.pamount;

	let expPprice = /^[0-9]+$/;

	if(!pname.value){
		alert("원두명은 필수 입력사항입니다.");
		pname.focus();
		return false;
	}
	
	if(!porigin.value){
		alert("원산지는 필수 입력사항입니다.");
		porigin.focus();
		return false;
	}
	if(!pgram.value){
		alert("원두의 중량을 선택해주세요.");
		return false;
	}
	
	if(!pprice.value){
		alert("중량에 따른 가격을 입력해주세요.");
		pprice.focus();
		return false;
	}
	
	if(!expPprice.test(pprice.value)){
		alert("가격은 숫자로만 입력해주세요.");
		pprice.value="";
		pprice.focus();
		return false;
	}
	
	if(!pamount.value){
		alert("수량을 입력해주세요.");
		pamount.focus();
		return false;
	}
	
	if(!pupload.value){
		alert("상품 사진을 업로드 해주세요.");
		return false;
	}
}
</script>
<link rel="stylesheet" href="/css/productUpdate.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="main-content">
	<div class="title">상품정보 수정</div>
	<form name="product" method="post" action="/admin/productUpdate" enctype="multipart/form-data">
		<input type="hidden" name="pno" value="${update.pno}">
		<table class="productUpdate">
			<tr>
				<th width="30%">카페명</th>
				<td>${update.pbrand}</td>
			</tr>
			<tr>
				<th>원두명</th>
				<td><input type="text" name="pname" value="${update.pname}" class="update-input"></td>
			</tr>
			<tr>
				<th>원산지</th>
				<td><input type="text" name="porigin" value="${update.porigin}" class="update-input"></td>
			</tr>
			<tr>
				<th>향</th>
				<td><input type="text" name="pflavor" value="${update.pflavor}" class="update-input"></td>
			</tr>
			<tr>
				<th>로스팅레벨</th>
				<td><input type="text" name="proastingLevel" value="${update.proastingLevel}" class="update-input"></td>
			</tr>
			<tr>
				<th>상세정보</th>
				<td><textarea name="pcontent" cols="50" rows="5" class="update-content">${update.pcontent}</textarea></td>
			</tr>
			<tr>
				<th>중량(g)</th>
				<td>
					<select name="pgram" class="pgram">
						<option value="100" <c:if test="${fn:contains(update.pgram,'100')}">selected</c:if>>100g</option>
						<option value="200" <c:if test="${fn:contains(update.pgram,'200')}">selected</c:if>>200g</option>
						<option value="500" <c:if test="${fn:contains(update.pgram,'500')}">selected</c:if>>500g</option>
						<option value="1000" <c:if test="${fn:contains(update.pgram,'1000')}">selected</c:if>>1000g</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>가격(원)</th>
				<td><input type="text" name="pprice" value="${update.pprice}" class="update-input"></td>
			</tr>
			<tr>
				<th>수량(개)</th>
				<td><input type="text" name="pamount" value="${update.pamount}" class="update-input"></td>
			</tr>
			<tr>
				<th><img src="/images/product/${update.pimage}" width="100"></th>
				<td><input type="file" name="pupload" class="file-button"></td>
			</tr>
			<tr>
				<th>상품BEST</th>
				<td>
					<input type="radio" name="pbest" value="best" class="best-button"> best
					<input type="radio" name="pbest" value="general" class="general-button"> general 
				</td>
			</tr>
		</table>
		<div class="productUpdate-button">
			<input type="submit" value="수정하기" onclick="return pcheckUp()" class="productUpdateSubmit">
			<input type="button" value="취소" onclick="history.back()" class="productUpdateCancel">
		</div>
	</form>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>