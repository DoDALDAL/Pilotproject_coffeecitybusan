<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인 폼</title>
<link rel="stylesheet" href="/css/passwordCheckForm.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body onload="document.passwordCheckForm.mpasswd.focus();">
	<div class="check-Form">
		<div><a href="/main"><img src="/images/logo/logo1.png" class="logo1"></a></div>
		<div class="check-title">비밀번호 확인</div>
		<div class="check-sub">- 회원정보 수정과 회원 탈퇴를 위해 비밀번호를 입력하세요 -</div>
		<form name="passwordCheckForm" method="post" action="/member/passwordCheck">
			<input type="hidden" name="mode" value="${mode}">
			<table class="container">
				<tr>
					<td class="input">
						<input type="password" name="mpasswd" placeholder="비밀번호를 입력해주세요" class="input-row">
					</td>
				</tr>
			</table>
			<input type="submit" value="전송" class="check-button">
		</form>
		<div class="back"><a href="/main"><i class="fa-solid fa-arrow-left-long"></i>뒤로가기</a></div>
	</div>
	<div class="error-masssge">
		<c:if test="${not empty msg}">
			<p style="color:red;font-weight:bold">${msg}</p>
		</c:if>
	</div>
</body>
</html>