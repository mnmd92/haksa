<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />

<title>left</title>
<link href="../css/ku.css" rel="stylesheet" type="text/css">

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