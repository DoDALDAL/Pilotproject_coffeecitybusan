<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	let mid = document.member.mid;
	let mpasswd = document.member.mpasswd;
	let mpasswdc = document.member.mpasswdConfirm;
	let mname = document.member.mname;
	let mbirth = document.member.mbirth;
	let mgender = document.member.mgender;
	let memail = document.member.memail;
	let mtel = document.member.mtel;
	let maddr1 = document.member.maddr1;
	let maddr2 = document.member.maddr2;
	let mzipno = document.member.mzipno;
	
	let expId = /^[a-z0-9]+$/;
	let expPasswd = /^[a-zA-Z0-9!@#$%^&*]{8,15}$/;
	let expMbirth = /^[0-9]{8}$/;
	let expMemail = /^[a-zA-Z0-9_+.-]+@([a-z0-9]+\.)+[a-z0-9]{2,4}$/;
	let expMtel = /^[0-9]{11}$/;
		
	if(!mid.value){
		alert("아이디를 입력해주세요");
		mid.focus();
		return false;
	}
		
	if(!expId.test(mid.value)){
		alert("아이디는 영문소문자와 숫자만 가능합니다.");
		mid.value="";
		mid.focus();
		return false;
	}
		
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
	
	if(!mbirth.value){
		alert("생년월일을 입력해주세요");
		mbirth.focus();
		return false;
	}
	
	if(!expMbirth.test(mbirth.value)){
		alert("생년월일은 숫자로만 8자리 입력해주세요.");
		mbirth.value="";
		mbirth.focus();
		return false;
	}
	
	if(!mbirth.value){
		alert("생년월일을 입력해주세요");
		mbirth.focus();
		return false;
	}
	
	if(!mgender.value){
		alert("성별을 선택해주세요");
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
<link rel="stylesheet" href="/css/loginwrite.css">
</head>
<body onload="document.member.mid.focus();" class="write-body">
	<div class="write-Form">
		<a href="/main" class="logo-title">Coffee City Busan</a>
		<div class="form-back">
			<form name="member" method="post" action="/write">
				<div class="input1">
					<input type="text" name="mid" placeholder="아이디" class="input-write-row">
					<input type="password" name="mpasswd" placeholder="비밀번호 (영문대소준자 + 숫자 조합으로 8자리~12자리로 작성해주세요)" class="input-write-row">
					<input type="password" name="mpasswdConfirm" placeholder="비밀번호 확인" class="input-write-row">
				</div>
				<div class="input2">
					<input type="text" name="mname" placeholder="이름" class="input-write-row">
					<input type="text" name="mbirth" maxlength="8" placeholder="생년월일 (숫자로만 8자리 입력해주세요)" class="input-write-row">
					<div class="gender">	
					<input type="radio" name="mgender" value="male"><span class="gender2">남성</span>
					<input type="radio" name="mgender" value="female"><span class="gender2">여성</span>
					</div>	
					<input type="text" name="mtel" maxlength="11" placeholder="연락처 (숫자로만 11자리 입력해주세요)" class="input-write-row">
					<input type="text" name="memail" placeholder="이메일 (@뒤 주소까지 입력해주세요)" class="input-write-row">
				</div>
				<div class="input3">
					<input type="button" value="주소검색" onclick="goPopup()" class="addr-button">
					<input type="text" name="maddr1" readonly placeholder="주소를 검색해주세요" class="input-write-row">
					<input type="text" name="maddr2" readonly placeholder="상세주소" class="input-write-row">
					<input type="text" name="mzipno" readonly placeholder="우편번호" class="input-write-row">
				</div>
				<div class="write-button">
					<input type="submit" value="회원가입" onclick="return check();" class="write-agree-button">
					<input type="button" value="가입취소" onclick="history.back();" class="write-cancel-button">
				</div>
			</form>
		</div>
	</div>
</body>
</html>