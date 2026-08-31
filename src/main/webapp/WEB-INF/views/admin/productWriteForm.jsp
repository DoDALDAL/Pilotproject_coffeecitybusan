<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script>
function pcheck(){
	let pbrand = document.product.pbrand;
	let pname = document.product.pname;
	let porigin = document.product.porigin;
	let pgram = document.product.pgram;
	let pprice = document.product.pprice;
	let pupload = document.product.pupload;
	let pamount = document.product.pamount;

	let expPprice = /^[0-9]+$/;

	if(!pbrand.value){
		alert("카페 선택은 필수 선택사항입니다.");
		return false;
	}
	
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
<link rel="stylesheet" href="/css/productWriteForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="main-content">
		<div class="title">상품 등록</div>
		<form name="product" method="post" action="/admin/productWrite" enctype="multipart/form-data">
			<table class="productView-back">
				<tr>
					<td>
						<div class="back"><a href="/admin/productList"><i class="fa-solid fa-arrow-left-long"></i>뒤로가기</a></div>
					</td>
				</tr>
			</table>
			<table class="productwrite-table">
				<tr>
					<th width="30%">카페명</th>
					<td>
						<select name="pbrand" class="pbrand">
							<option value="선택하세요">선택하세요</option>
							<option value="MOMOS">MOMOS</option>
							<option value="BLACKUP">BLACKUP</option>
							<option value="Mavis">Mavis</option>
							<option value="PARK">PARK</option>
							<option value="Waveon">Waveon</option>
							<option value="Hytte">Hytte</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>원두명</th>
					<td><input type="text" name="pname" class="product-input"></td>
				</tr>
				<tr>
					<th>원산지</th>
					<td><input type="text" name="porigin" class="product-input"></td>
				</tr>
				<tr>
					<th>향</th>
					<td><input type="text" name="pflavor" class="product-input"></td>
				</tr>
				<tr>
					<th>로스팅레벨</th>
					<td><input type="text" name="proastingLevel" class="product-input"></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td><textarea name="pcontent" class="pcontent" cols="50" rows="5" placeholder="상세정보를 입력해주세요"></textarea></td>
				</tr>
				<tr>
					<th>중량(g)</th>
					<td>
						<select name="pgram" class="pgram">
							<option value="100">100g</option>
							<option value="200">200g</option>
							<option value="500">500g</option>
							<option value="1000">1000g</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>가격(원)</th>
					<td><input type="text" name="pprice" placeholder="숫자로만 입력해주세요." class="product-input"></td>
				</tr>
				<tr>
					<th>수량(개)</th>
					<td><input type="text" name="pamount" placeholder="숫자로만 입력해주세요." class="product-input"></td>
				</tr>
				<tr>
					<th>상품이미지</th>
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
			<div class="productWrite-button">
				<input type="submit" value="등록하기" onclick="return pcheck();" class="productWriteSubmit">
				<input type="reset" value="작성취소" onclick="history.back();" class="productWriteCancel">
			</div>
		</form>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>