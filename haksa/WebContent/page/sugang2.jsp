<%@page import="java.util.List"%>
<%@page import="haksa.major.MajorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>register</title>
<link href="../css/ku.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script>
/* 
$(function(){
	$('#id01').on('click', function(){
		alert('데이터 요청');
		$.ajax({
			url:'test02.jsp',
			type:'get',
			success: function(t){
				alert('성공');
				alert($(t).text());

				$("<h1></h1>").text($(t).text()).appendTo("body");

			},
			error: function() {
				alert('연결실패');
			}
			
		});
	});
	
	$('#id02').on('click', function(){
		alert('전송');
	});
});
 */

$(function(){
		$('#cb_daehak').on('click', function(){
			$.ajax({
				url:'test02.jsp',
				type:'get',
				success: function(t){
					alert('성공');
					alert($(t).text());

					$("<h1></h1>").text($(t).text()).appendTo("body");

				},
				error: function() {
					alert('연결실패');
				}
				
			});
		});
		
		$('#id02').on('click', function(){
			alert('전송');
		});
	});
 
</script>


<script>
	function changeGubun() {
		var x = document.getElementById("cb_gubun");
		if (x.options[x.selectedIndex].value == "1") {
			document.getElementById("gwamok").style.display = "";
			document.getElementById("daehak").style.display = "";
			document.getElementById("hakgwa").style.display = "";
			document.getElementById("jeongong").style.display = "";
			document.getElementById("haknyeon").style.display = "";
		} else if (x.options[x.selectedIndex].value == "2") {
			document.getElementById("gwamok").style.display = "";
			document.getElementById("daehak").style.display = "";
		} else if (x.options[x.selectedIndex].value == "3") {
			document.getElementById("youngyeok").style.display = "";
			document.getElementById("gwamok").style.display = "";
		}
	}
	                                  
</script>

<script>
	var x = document.getElementById("cb_daehak").options.[x.selectedIndex].text;
	
</script>

</head>

<body onload="$.app.fn_init();">
<%
	MajorDAO mjdao = new MajorDAO();
%>
	<div class="right">
    <div class="searchcol">
    	<span id="gubun" style="display:inline-block;">
    	<strong id="st_gubun">구분</strong>
	    <select name="select" class="input" id="cb_gubun" title="구분" onchange="changeGubun()">
			<option value="1" selected>전공과목</option>
			<option value="2">기초교양</option>
			<option value="3">균형교양</option>
			<option value="4">특화교양</option>
			<option value="5">자유선택</option>
	    </select>
     	</span>
     	
		<span id="youngyeok" style="display:none;">
		<strong id="st_youngyeok">&nbsp;&nbsp;영역</strong>
		<select class="input" name="select" id="cb_youngyeok" title="영역" onchange="changeGubun()">
			<option value="22">균형-과학과기술</option>
			<option value="21">균형-사회와문화</option>
			<option value="23">균형-수리적사고</option>
			<option value="19">균형-언어와문학</option>
			<option value="20">균형-역사와철학</option>
			<option value="24">균형-예술과건강</option>
		</select> 
		</span>
	
		<span id="gwamok" style="display:none;">	      
		<strong id="st_gwamok">&nbsp;&nbsp;과목</strong>
		<select class="input" name="select" id="cb_gwamok" title="과목" onchange="changeGubun()">
			<option value="1200080">웹과인터넷활용및실습</option>
			<option value="1200079">인간과환경</option>
			<option value="1200074">자연과학의이해</option>
		</select>
		</span>
       
       	<span id="guyeok" style="display:none;">
		<strong id="st_guyeok">&nbsp;&nbsp;구역</strong>   
		<select class="input" name="select" id="cb_guyeok" title="구역">
		</select>
		</span>
      
      	<%-- <span id="daehak" style="display:none;">
      	<strong id="st_daehak">&nbsp;&nbsp;대학</strong>   
		<select name="select" class="input" id="cb_daehak" title="대학">
			<%
			List<String> daehakList = mjdao.daehakList();
			for(int i=0; i<daehakList.size(); i++) {
			%>
				<option><%= daehakList.get(i)%></option>
			<%}%>
		</select>
      	</span> --%>
      	
      	<span id="daehak" style="display:none;">
      	<strong id="st_daehak">&nbsp;&nbsp;대학</strong>   
		<select name="select" class="input" id="cb_daehak" title="대학">
			<%
			
			%>
		</select>
      	</span>
      	
      
      	<span id="hakgwa" style="display:inline-block;">
		<strong id="st_hakgwa">&nbsp;&nbsp;학과</strong>  
		<select name="select" class="input" id="cb_hakgwa" title="학과">
			<%-- <%
			String hakgwa = request.getParameter("x");
			List<String> hakgwaList = mjdao.hakgwaList(hakgwa);

			for(int i=0; i<hakgwaList.size(); i++) {
			%>
				<option><%= hakgwaList.get(i)%></option>
			<%
			}
			%>
			 --%>
			<script>
				
			</script>
			 
		</select>
      	</span>
      	
      	<span id="jeongong" style="display:inline-block;">
		<strong id="st_jeongong">&nbsp;&nbsp;전공</strong>  
		<select name="select" class="input" id="cb_jeongong" title="전공">
		</select>
		</span>
		
		<span id="haknyeon" style="display:inline-block;">
		<strong id="st_haknyeon">&nbsp;&nbsp;학년</strong>  
		<select name="select" class="input" id="cb_haknyeon" title="학년">
		</select>
		</span>
		
		<input name="button" type="button" class="btn" id="btn_search" value="조회" onClick="$.app.fn_searchGwamok();">
    </div>
    
    <div class="searchcol" id="div_search1" style="display:block;">
	<strong>교과명으로 검색</strong>&nbsp;
	<input name="text" type="text" class="input" id="txt_gwamok" style="width: 160px;" placeholder="교과명을 입력하세요" onkeydown="javascript:$.app.fn_enterGwamok(event);">
	<input name="button" type="button" class="btn" id="btn_searchGwamok" value="조회" onClick="$.app.fn_searchGwamok('gwamok');">
    </div>
    
	<div class="searchcol" id="div_search2">
	<strong>빠른 수강 신청</strong> (교과번호/분반)&nbsp;
	<input name="text" type="text" class="input" id="txt_gwamok1" style="width: 100px;" placeholder="교과번호를 입력하세요">
	<input name="text" type="text" class="input" id="txt_ban" style="width: 80px;" onkeydown="javascript:$.app.fn_enterInsertShincheong(event);" placeholder="분반을 입력하세요">
	<input name="button" type="button" class="btn" id="btn_request" value="신청"  onclick="$.app.fn_processInsertShincheong('gwamok',0)">
    </div>
    
    <div class="result_area"><strong id="st_resultTitle">▶ 개설 교과 목록</strong> ※ 교과목명을 클릭하면  강의계획서 조회, 교수명을 클릭하면 강의평가결과를 조회할 수 있습니다.
		<div id="div_list" style="width:100%; height:300px; overflow-y: auto; display: block; margin-top:5px; ">
			<table border="1" cellpadding="0" cellspacing="0" bordercolor="#DCDCDC" class="table">
				<tr>
					<th>신청</th>
					<th style="width:25px">번호</th>
					<th style="width:25px">구분</th>
					<th style="width:25px">분반</th>
					<th style="width:50px">교과번호</th>
					<th style="min-width:120px">교과목명(영역)</th>
					<th style="min-width:100px">영문교과목명</th>
					<th style="width:45px">학점및시수</th>
					<th style="width:50px">교수명</th>
					<th style="min-width:100px">강의실</th>
					<th style="min-width:100px">강의시간</th>
					<th style="width:25px">대상인원</th>
					<th style="width:25px">신청인원</th>
					<th style="min-width:25px">공학구분</th>
					<th style="min-width:25px">비고</th>
				</tr>
				<tbody id="gawmok_list">			
				</tbody>        
			</table>
		</div>
    </div>
    <div class="result_area"><strong>▶ 수강신청 리스트</strong>
		<div class="repoint" ><input type="button" onclick="javascript:$.app.fn_searchTimeTable();" value="시간표 조회"/>&nbsp;&nbsp;<strong>신청학점 : </strong><span class="num" id="totHakjeom">0.0</span>점</div>
		<table border="1" cellpadding="0" cellspacing="0" bordercolor="#DCDCDC" class="table">
			<tr>
				<th width="25">삭제</th>
				<th width="25">번호</th>
				<th width="25">구분</th>
				<th width="50">교과번호</th>
				<th>교과목명-영역</th>
				<th>영문 교과목명</th>
				<th>학점및시수</th>
				<th width="40">교수명</th>
				<th>강의실</th>
				<th width="50">강의시간</th>
				<th>재이수</th>
				<th>비고</th>
			</tr>
			<tbody id="shincheong_list">			
			</tbody> 
		</table>
    </div>
</div>
</body>
</html>