<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세정보</title>
<link rel="stylesheet" href="/css/memberView.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<div>
	<%@ include file="header.jsp" %>
	<main class="main-content">
		<div class="title">회원 상세정보</div>
		<table class="memberView-back">
			<tr>
				<td>
					<div class="back"><a href="/admin/list"><i class="fa-solid fa-arrow-left-long"></i>뒤로가기</a></div>
				</td>
			</tr>
		</table>
		<table class="memberView">
			<tr>
				<td>회원번호</td>
				<td>${view.mno}</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${view.mid}</td>
			</tr>
		</table>
		
		<table class="memberView">
			<tr>
				<td>이름</td>
				<td>${view.mname}</td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td>${view.mbirth}</td>
			</tr>
			<tr>	
				<td>성별</td>
				<td>${view.mgender}</td>
			</tr>
			<tr>
				<td>휴대전화번호</td>
				<td>${view.mtel}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${view.memail}</td>
			</tr>
		</table>
		
		<table class="memberView">
			<tr>
				<td>주소</td>
				<td>${view.maddr}</td>
			</tr>
			<tr>
				<td>우편번호</td>
				<td>${view.mzipno}</td>
			</tr>
		</table>
		
		<table class="memberView">
			<tr>
				<td>가입일</td>
				<td><fmt:formatDate value="${view.mdate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
			</tr>
			<tr>
				<td>권한</td>
				<td>${view.mauthority}</td>
			</tr>
		</table>
	</main>
	<%@ include file="footer.jsp" %>
</div>
</body>
</html>