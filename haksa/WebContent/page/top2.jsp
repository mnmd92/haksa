<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>::강원대학교 수강신청::</title>
<link href="../css/ku.css" rel="stylesheet" type="text/css">

</head>
<body onload="fn_init();">
	<div class="top">
		<div class="logo"><img src="../images/logo.png" /></div>
		<div class="topt"><span id="sp_campus" style="width:40px;"></span> 학부 &nbsp;<span id="sp_year"></span>년도 &nbsp;<span						id="sp_hakgi"></span> 학기 
			<span id="sp_sugang" style="display:none;"> 예비 </span>수강신청<br>
		</div>
		<div id="menu1" class="menu" onclick="javascript:fn_move(this);">공지사항</div>
		<div id="menu2" class="menu" onclick="javascript:fn_move(this);">개설과목 조회</div>
		<div id="menu3" class="menu" onclick="javascript:fn_move(this);">수강신청</div>
		<div id="menu4" class="menua" onclick="javascript:fn_move(this);">정보수정</div>
	</div>
</body>
</html>