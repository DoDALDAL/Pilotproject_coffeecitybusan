<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<link rel="stylesheet" href="/css/update.css">
<script language="javascript">
function goPopup(){
	var pop = window.open("/guest/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(maddr1,maddr2,mzipno){
		document.member.maddr1.value = maddr1;
		document.member.maddr2.value = maddr2;
		document.member.mzipno.value = mzipno;
}

function check(){
	let mpasswd = document.member.mpasswd;
	let mpasswdc = document.member.mpasswdConfirm;
	let mname = document.member.mname;
	let memail = document.member.memail;
	let mtel = document.member.mtel;
	let maddr1 = document.member.maddr1;
	let maddr2 = document.member.maddr2;
	let mzipno = document.member.mzipno;
	
	let expPasswd = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/;
	let expMemail = /^[a-zA-Z0-9_+.-]+@([a-z0-9]+\.)+[a-z0-9]{2,4}$/;
	let expMtel = /^[0-9]{11}$/;
	

		
	if(!mpasswd.value){
		alert("비밀번호를 입력해주세요");
		mpasswd.focus();
		return false;
	}
		
	if(!expPasswd.test(mpasswd.value)){
		alert("비밀번호는 영문대소문자, 숫자, 특수기호(!@#$%^&*)로 8자리 이상 15자리 이하로 만들어주세요");
		mpasswd.focus();
		return false;
	}
		
	if(mpasswd.value != mpasswdc.value){
		alert("비밀번호가 일치하지 않습니다.");
		mpasswd.value="";
		mpasswdc.value="";
		mpasswd.focus();
		return false;
	}
	
	if(!mname.value){
		alert("이름을 입력해주세요");
		mname.focus();
		return false;
	}
	
	
	if(!mtel.value){
		alert("휴대전화 번호를 입력해주세요");
		mtel.focus();
		return false;
	}
	
	if(!expMtel.test(mtel.value)){
		alert("연락처는 숫자로만 11자리 입력해주세요");
		mtel.value="";
		mtel.focus();
		return false;
	}
	
	
	if(!memail.value){
		alert("이메일을 입력해주세요");
		memail.focus();
		return false;
	}
	
	if(!expMemail.test(memail.value)){
		alert("이메일 형식을 확인해주세요");
		memail="";
		memail.focus();
		return false;
	}
	
	if(!maddr1.value && !maddr2.value && !mzipno.value){
		alert("주소를 검색하여 입력해주세요.")
		return false;
	}
}
</script>
</head>
<body onload="document.member.mpasswd.focus();">
	<%@ include file="header.jsp" %>
	<main class="updatemain-content">
	<div class="update-title"><h2>내 정보 수정</h2></div>
	<form name="member" method="post" action="/update">
		<input type="hidden" name="mno" value="${update.mno}">
		<table class="update-table">
			<tr>
				<th>아이디(수정)</th>
				<td>${update.mid}</td>
			</tr>
			<tr>
				<th>비밀번호(수정)</th>
				<td><input type="password" name="mpasswd" class="input-row"></td>
			</tr>
			<tr>
				<th>비밀번호 확인(수정)</th>
				<td><input type="password" name="mpasswdConfirm" class="input-row"></td>
			</tr>
		</table>
		<table class="update-table">
			<tr>
				<th>이름(수정)</th>
				<td><input type="text" name="mname" value="${update.mname}" class="input-row"></td>
			</tr>
			<tr>
				<th>생일</th>
				<td>${update.mbirth}</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${update.mgender}</td>
			</tr>
			<tr>
				<th>연락처(수정)</th>
				<td><input type="text" name="mtel" maxlength="11" value="${update.mtel}" class="input-row"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="memail" value="${update.memail}" class="input-row"></td>
			</tr>
		</table>
		<table class="update-table">
			<tr>
				<th>주소(수정)</th>
				<td class="addr-button">
					<input type="text" name="maddr1" readonly value="${fn:split(update.maddr,',')[0]}" class="input-row">
					<input type="button" value="주소검색" onclick="goPopup()" class="addr-button2">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="maddr2" readonly value="${fn:split(update.maddr,',')[1]}" class="input-row"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="mzipno" readonly value="${update.mzipno}" class="input-row"></td>
			</tr>
		</table>
		<table class="update-table">
			<tr>
				<td colspan"2" class="update-button">
					<input type="submit" value="수정하기" class="update-button2" onclick="return check();">
					<a href="/main"><input type="button" value="수정취소" class="update-cancel"></a>
				</td>
			</tr>
		</table>
		<div class="delete"><a href="/member/passwordCheckForm?mode=delete">회원탈퇴</a></div>
	</form>
	</main>
	<%@ include file="footer.jsp" %>
</body>
</html>