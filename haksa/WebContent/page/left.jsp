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

<title>left</title>
<link href="../css/ku.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../libs/use/jquery/jquery.js"></script>
<script type="text/javascript" src="../libs/use/jquery/jquery.json.js"></script>
<script type="text/javascript" src="../js/sz_fsp_json.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">


	$(function(){
		$.extend({
			left : {
				fn_init : function() {
					
					
					try {
						var user = parent.window._user;
						// 계좌번호 팝업 창 조회 
						// $.left.fn_TongjangNoPopup();
						if(user["hakgi"]=="3" || user["hakgi"]=="4" ){
     					   fsp.common.openTongjangPopup();
						}
						//if(user["seolmun_yn"] == "2"){
			            //      $.left.fn_seolmunPopup(user["hakbeon"]);
		                //}
						
					} catch( e ) {
						fsp.common.jsError("#fn_init" , e );
						
					}
				},	// end fn_init()
				
				/**
				*	로그아웃 처리를 한다. 
				**/
				fn_logout : function() {
					try {
						var data = {};
						fsp.callService(
							"LoginAction"
							, "webLogout"
							, data
							, function(errorCode, rData){
								try {
									if( errorCode == 0 ) {
										parent.window.location.href = "index.html";
									} 
								} catch( ee ) {
									fsp.common.jsError("#fn_logout" , ee);
								}
							}// end success 
						);
					} catch( e) {
						fsp.common.jsError("#fn_logout" , e);
					}	
				}, // end fn_logout
				/**
				*	비밀번호 변경 호출 
				**/
				fn_changepwPopup : function(hakbeon) {
					var popUrl = "./changePW.html";	// 팝업창에 출력될 페이지 URL
					var args = "HAKBEON=" + hakbeon  ;
					var popOption = "width=500, height=300, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
					window.open(popUrl + "?" + args,"",popOption);
				},
				/**
				*	교육만족도 설문조사 팝업
				
				
				fn_seolmunPopup : function(hakbeon) {
					
					var popUrl = "./seolmun.html";	// 팝업창에 출력될 페이지 URL
					var args = "HAKBEON=" + hakbeon  ;
					var popOption = "width=500, height=300, resizable=no, scrollbars=yes, status=no;";    //팝업창 옵션(optoin)
					var popup = window.open(popUrl + "?" + args,"",popOption);
					if(popup == null || popup.screenLeft == 0){
						alert('팝업이 차단중입니다. 팝업차단을 해제하세요')
					}
				},				
				**/
				/**
				*	학번을 조회한다. 
				**/
				fn_changeHakbeon : function() {
					var hakbeon = $("#txt_cond");
					
					if( fsp.common.isNull(hakbeon, true, "학번", hakbeon) ) {
						return;
					}
					
					try {
						var data = {
								HAKBEON : hakbeon.val()
						};
						
						fsp.callService(
							 "AdminAction"
							, "change"
							, data
							, function(errorCode, rData){
								try {
									if( errorCode == 0 ) {
										parent.window.location.href = "main.jsp";
										
									} else if( errorCode == "1001" ) {
										parent.window.location.href = "index.html";
									}
								} catch( ee ) {
									fsp.common.jsError("#fn_changeHakbeon" , ee);
								}
							}// end success 
						);
					} catch( e) {
						fsp.common.jsError("#fn_logout" , e);
					}	
					
				}, 	// end fn_changeHakbeon
				/**
				*	학번 엔터키 입력시 처리.
				**/
				fn_enterHakbeon : function(e) {
					if(e.keyCode != 13){
						return;
					}
					
					$.left.fn_changeHakbeon();
				} // end fn_enterHakbeon
			}
		});		// end extends
	});
	</script>
</head>

<body onload="$.left.fn_init();">
	<div class="left">
		<div class="login">
			<p class="user">
				<strong id="txt_login">신승용</strong>&nbsp;님 로그인
			</p>
			<input type="button" class="logout" value="로그아웃"
				onClick="javascript:$.left.fn_logout();">
			<p>
				취득학점 : <span class="num" id="txt_sumhakjeom">47.5</span> 학점
			</p>
			<p>
				졸업학점 : <span class="num" id="txt_sumhakjeom">130</span> 학점
			</p>
		</div>

		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			class="lefttable">
			<tr>
				<td width="40%" class="tdtitle">대학</td>
				<td width="60%"><span id="txt_daehak">IT대학</span></td>
			</tr>
			<tr>
				<td class="tdtitle">학과</td>
				<td><span id="txt_hakgwa">컴퓨터학부</span></td>
			</tr>
			<tr>
				<td class="tdtitle">전공</td>
				<td><span id="txt_jeongong">컴퓨터정보통신공학전공</span></td>
			</tr>
			<tr>
				<td class="tdtitle">학번</td>
				<td><span id="txt_hakbun">201414030</span></td>
			</tr>
			<tr>
				<td class="tdtitle">성명</td>
				<td><span id="txt_name">신승용</span></td>
			</tr>
			<tr>
				<td class="tdtitle">학년</td>
				<td><span id="txt_haknyeon">4</span>학년</td>
			</tr>
			<tr>
				<td class="tdtitle">학적상태</td>
				<td><span id="txt_status">재학</span></td>
			</tr>
			<tr>
				<td class="tdtitle">신청가능학점</td>
				<td><span id="txt_gijunhakjeom">6</span> 학점</td>
			</tr>

			<tr>
				<td class="tdtitle">수강신청시작일</td>
				<td class="date"><span id="txt_sijak_ilsi">2017-12-19
						10:00</span></td>
			</tr>
			<tr>
				<td class="tdtitle">수강신청종료일</td>
				<td class="date"><span id="txt_jongryo_ilsi">2017-12-20
						17:00</span></td>
			</tr>





			<!--  비밀번호 변경하기 추가 2015년 1학기
    <tr>
      <td>
       <a href="javascript:$.left.fn_changepwPopup('201414030')"> 비밀번호변경하기 </a>
      </td>
    </tr>
    -->
			<!-- 교육만족도 설문조사하기
   <tr>
      <td colspan="2" >
       <a href="javascript:$.left.fn_seolmunPopup('201414030')"><b> 교육만족도 설문조사하기</b> </a>
      </td>
    </tr>
   -->


		</table>


		<div class="footer">
			CopyrightⓒKangwon National University.<br>All Rights Reserved.
		</div>
	</div>
</body>
</html>