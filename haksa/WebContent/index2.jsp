<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/css/login.css" rel="stylesheet" type="text/css">
<title>::강원대학교 수강신청::</title>
	
</head>
<body>
	<div id="login">
		<p><img src="/images/logo.gif" /></p>
		<p class="topt">춘천학부 수강신청</p>
		<form action="/page/login_pro.jsp" method="post">
			<div class="idpw">
				<span class="idpwtxt">아이디</span> <input tabindex="1" name="USER_ID" maxLength=20 type="text" class="input1" id="USER_ID">
				<span class="idpwtxt">비밀번호</span> <input tabindex="2" name="PWD" maxLength=20 type="password" class="input1" id="PWD">
			</div>
			<input tabindex="3" name="button" type="button" class="loginbtn"id="button_login" value="로그인"> 
			<input tabindex="4" name="button" type="button" class="findbtn" id="button_find" value="학번찾기">
		</form>
		<div class="notice">
			<p class="noticetitle">공지사항</p>
			<div class="viewer"></div>
		</div>
		
		<div class="footer">
			CopyrightⓒKangwon National University.<br> All Rights Reserved.
		</div>

		<!-- end login -->
	</div>
</body>
</html>