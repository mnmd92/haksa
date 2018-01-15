<!doctype html>
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
<link href="/css/login.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../libs/use/jquery/jquery.js"></script>
<script type="text/javascript" src="../libs/use/jquery/jquery.json.js"></script>
<script type="text/javascript" src="../js/sz_fsp_json.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>

<script type="text/javascript">
	// 로그인 점검
	var shincheong_yn = 'n';
	$(function(){
		$.extend({	// $(function(){$.extend({ app:{fn_init, fn_login, fn_enterUserId, fn_enterPwd, fn_openPopup} });});
			app : {
				fn_init : function() {
					try {
						$.get( "../notice/noticeA.html", function( data ) {
						  $( ".viewer" ).html( data );
						});
						
						$("#USER_ID").focus();
						if( fsp.getCampus() == "S") {
							$("#sp_campus").text("삼척/도계");
						} else {
							$("#sp_campus").text("춘천");
						}
					} catch( e ) {
						fsp.common.jsError("#fn_init" , ee);
					}
				},	// end fn_init()
				
				/**
				*	로그인 처리를 한다. 
				**/
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
					
					
				}, 	// end fn_login
				
				/**
				*	사용자 아이디 엔터키 이벤트 처리.<p>
				**/
				fn_enterUserId : function(e) {
					if(e.keyCode != 13){
						return;
					}
					
					var userId = $("#USER_ID");
					var pwd = $("#PWD");
					
					if( fsp.common.isNull(userId, true, "아이디", userId) ) {
						return;
					}
					
					pwd.focus();
				},	// end fn_enterUserId
				
				/**
				*	비밀번호 입력창에서 엔터키 입력시 처리.
				**/
				fn_enterPwd : function(e) {
					if(e.keyCode != 13){
						return;
					}
					$.app.fn_login();
				}, // end fn_enterPwd
				
				/**
				*	학번찾기 팝업 화면 
				**/
				fn_openPopup : function(e) {
					if( e ) {
						if(e.keyCode != 13){
							return;
						}
					}
					
					var popUrl = "./find.html";	//팝업창에 출력될 페이지 URL
					var popOption = "width=390, height=330, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl,"",popOption);
				}, // end fn_openPopup
			}
		});		// end extends
	});
	</script>
</head>

<body onload="$.app.fn_init();">
<div id="login">
  <p><img src="/images/logo.gif" /></p>
  <p class="topt"><span id="sp_campus"></span> 학부 수강신청</p>
  
  <div class="idpw"> <span class="idpwtxt">아이디</span>
    <input tabindex="1" maxLength=20 name="USER_ID" type="text" class="input1" id="USER_ID" onkeydown="javascript:$.app.fn_enterUserId(event);">
    <span class="idpwtxt">비밀번호</span>
    <input tabindex="2" name="PWD" maxLength=20 type="password" class="input1" id="PWD" onkeydown="javascript:$.app.fn_enterPwd(event);">
  </div>
  <input tabindex="3" name="button" type="button" class="loginbtn" id="button_login" value="로그인" onClick="javascript:$.app.fn_login();" onkeydown="javascript:$.app.fn_enterPwd(event);">
  <input tabindex="4" name="button" type="button" class="findbtn" id="button_find" value="학번찾기" onClick="javascript:$.app.fn_openPopup();" onkeydown="javascript:$.app.fn_openPopup(event);">
  
  <div class="notice">
    <p class="noticetitle">공지사항</p>
    <div class="viewer">
      
    </div>
  </div>
  <div class="footer">CopyrightⓒKangwon National University.<br>
    All Rights Reserved.</div>
    
<!-- end login -->
</div>
</body>
</html>