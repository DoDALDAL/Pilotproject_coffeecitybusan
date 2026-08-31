<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<link rel="stylesheet" href="/css/memberlist.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
</head>
<body>
	<%@ include file="header.jsp" %>
	<main class="main-content">
			<div class="title">가입 회원 목록</div>
			<table class="list-table">
				<tr>
					<th>회원번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>연락처</th>
					<th>가입일</th>
				</tr>
			<c:forEach var="list" items="${member}">
				<tr>
					<td>${list.mno}</td>
					<td><a href="/admin/view?mno=${list.mno}" class="list-view">${list.mid}</a></td>
					<td>${list.mname}</td>
					<td>${list.mtel}</td>
					<td><fmt:formatDate value="${list.mdate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
				</tr>
			</c:forEach>	
			</table>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>