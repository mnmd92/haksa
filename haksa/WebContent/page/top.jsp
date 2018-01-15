<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<meta http-equiv='Cache-Control' content='no-cache' />
	<meta http-equiv="imagetoolbar" content="no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="Robots" content="All" />
	<meta name="Keywords" content="" />
	<meta name="Description" content="" />
	
	<title>::강원대학교 수강신청::</title>
	<link href="../css/ku.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="../libs/use/jquery/jquery.js"></script>
	<script type="text/javascript">
		
		// 객체 선언.
		// menu1은 키, "replaceSubject.html"는 값.
		// M_INFO.menu1; == replaceSubject.html
		// M_INFO['menu1']; == replaceSubject.html
		var M_INFO = {
			menu1 : "replaceSubject.html"
			, menu2 : "subject.html"
			, menu3 : "sugang.html"
			, menu4 : "notice.html"
		};
		/**
		*	페이지 이동처리를 한다. 
		**/
		function fn_move(obj) {
			parent.window.frames["main"].location.href = M_INFO[obj.id];
			document.getElementById("menu1").className = "menu";
			document.getElementById("menu2").className = "menu";
			document.getElementById("menu3").className = "menu";
			document.getElementById("menu4").className = "menu";
			obj.className = "menua";
		}	
		
		/**
		*	초기화를 한다. 
		**/
		function fn_init() {
			var user = parent.window._user;
			$("#sp_year").text(user["year"]);
			
			if( user["hakgi"] != "1" && user["hakgi"] != "2") {
				$("#sp_hakgi").text("계절");
			} else {
				$("#sp_hakgi").text(user["hakgi"]);
			}
			if( user["campus"] == "1" ) {
				$("#sp_campus").text("춘천");
			} else if( user["campus"] == "2" ) {
				$("#sp_campus").text("삼척");
			}else{
				$("#sp_campus").text("도계");
			}
			if( user["sugang_type"] == "Y") {
				document.getElementById("sp_sugang").style.display = "";
			}
		}
	</script>
</head>

<body onload="fn_init();">
	<div class="top">
		<div class="logo"><img src="../images/logo.png" /></div>
		<div class="topt"><span id="sp_campus" style="width:40px;"></span> 학부 &nbsp;<span id="sp_year"></span>년도 &nbsp;<span						id="sp_hakgi"></span> 학기 
			<span id="sp_sugang" style="display:none;"> 예비 </span>수강신청<br>
		</div>
		<div id="menu1" class="menu" onclick="javascript:fn_move(this);">대체 과목 조회</div>
		<div id="menu2" class="menu" onclick="javascript:fn_move(this);">개설과목 조회</div>
		<div id="menu3" class="menu" onclick="javascript:fn_move(this);">수강신청</div>
		<div id="menu4" class="menua" onclick="javascript:fn_move(this);">공지사항</div>
	</div>
</body>
</html>