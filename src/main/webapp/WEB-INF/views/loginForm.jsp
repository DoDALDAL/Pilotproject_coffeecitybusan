<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/loginwrite.css">
</head>
<body onload="document.memberLogin.mid.focus();" class="login-body">
	<div class="login-Form">
		<a href="/main" class="logo-title">Coffee City Busan</a>
		<form name="memberLogin" method="post" action="/j_spring_security_check">
			<table class="container">
				<tr>
					<td class="input">
						<input type="text" name="mid" placeholder="아이디" class="input-row">
						<input type="password" name="mpasswd" placeholder="비밀번호" class="input-row">
					</td>
				</tr>
			</table>
			<input type="submit" value="로그인" class="login-button">
		</form>
			<div class="back">
					<a href="/main">home</a>
				<sec:authorize access="isAnonymous()">
					<a href="/guest/writeForm">회원가입</a>
				</sec:authorize>
			</div>
	</div>
</body>
</html>