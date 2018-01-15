<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::강원대학교 학사관리 시스템::</title>

<link href="/css/login2.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="login">
		<p>
			<img src="/images/logo.gif">
		</p>
		<p class="txt">강원대학교 학사관리 시스템</p>
		
		<form action="/page/login_pro.jsp" method="post">
			<div class="idpw">
			<span class="idpwtxt">아이디</span>
			<input class="input1" type="text" name="USER_ID" maxlength="20"> 
			
			<span class="idpwtxt">비밀번호</span>
			<input class="input1" type="password" name="USER_PW" maxlength="20">
			</div>
			<input class="loginbtn" type="submit" value="로그인">
			<input class="findbtn" type="button" name="button" id="button_find" value="학번찾기">
		</form>

		<div class="footer">"Created by Shin"</div>
	</div>
</body>
</html>