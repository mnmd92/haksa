<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>::강원대학교 학사관리 시스템::</title>
<link href="/css/login2.css" rel="stylesheet" type="text/css">

<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script type="text/javascript" src="/js/sz_fsp_json.min.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript">
/*
	$.extend() : 두 개 이상 합치기 위한 함수

*/
$(function(){
	$.extend({
		app : {
			fn_enterUserId : function (e) {
				if(e.keyCode != 13) {
					return;
				}
				
				var userId = $("#USER_ID");
				var pwd = $("#PWD");
				/* 
				if( fsp.common.isNull(userId, true, "아이디", userId) ) {
					return;
				}
				 */
				pwd.focus();
			}, 
			
			fn_enterPwd : function(e) {
				if(e.keyCode != 13){
					return;
				}
				$.app.fn_login();
			}, 
			
			fn_login : function() {
				var userId = $("#USER_ID");
				var pwd = $("#PWD");
				if( fsp.common.isNull(userId, true, "아이디", userId) ) {
					return;
				}
				
				if( fsp.common.isNull(pwd, true, "비밀번호", pwd) ) {
					return;
				}
				
				var data = {
					UserID : userId.val()
					, Pwd : pwd.val()
					, Campus : fsp.getCampus()
				};
				
				// 로그인을 추가적으로 계속신청하는 경우 방지
				if(shincheong_yn == 'n'){
					shincheong_yn = 'y';
				//	$("#button_login").val("로그인중")
					
				}else{
				    alert("로그인 중입니다. 잠시만 기다려 주세요");	
					return;
				}
									
				try {
					fsp.callService(
						"LoginAction"
						, "webLogin"
						, data
						, function(errorCode, rData){
							try {
								if( errorCode == 0 ) {
									shincheong_yn = 'n';
									window.location.href = "main.jsp";
								} 
								    shincheong_yn = 'n';
							} catch( ee ) {
								shincheong_yn = 'n';
								fsp.common.jsError("#fn_login" , ee);
							}
						}// end success 
					);
				} catch(e) {
					shincheong_yn = 'n';
					fsp.common.jsError("#fn_login" , e);
				}	
				
				
			}
			
			
		}
	});
});


</script>

</head>
<body>
	<div id="login">
		<p>
			<img src="/images/logo.gif">
		</p>
		<p class="txt">강원대학교 학사관리 시스템</p>
		
		<div class="idpw">
		<span class="idpwtxt">아이디</span>
		<input class="input1" type="text" name="USER_ID" id="USER_ID" maxlength="20" onkeydown="javascript:$.app.fn_enterUserId(event);"> 
		
		<span class="idpwtxt">비밀번호</span>
		<input class="input1" type="password" name="PWD" id="PWD" maxlength="20" onkeydown="javascript:$.app.fn_enterPwd(event);">
		</div>
		<input class="loginbtn" type="submit" value="로그인" onkeydown="javascript:$.app.fn_enterPwd(event);">
		<input class="findbtn" type="button" name="button" id="button_find" value="학번찾기">

		<div class="footer">"Created by Shin"</div>
	</div>
</body>
</html>