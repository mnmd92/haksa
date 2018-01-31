<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>register</title>
<link href="../css/ku.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="../libs/use/jquery/jquery.js"></script>
<script type="text/javascript" src="../libs/use/jquery/jquery.json.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/combo.js"></script>
<script type="text/javascript">

$(function(){
	$.extend({
		app : {
			fn_init : function() {
				
			},	// end fn_init 
			
			fn_fn_searchGwamok : function(){}
		}		
	});
})


</script>


</head>

<body onload="$.app.fn_init();">
  <div class="right">
    <div class="searchcol"><strong id="st_gubun">구분</strong>
      <select name="select" class="input" id="cb_gubun" title="구분">
      </select>
      <strong id="st_youngyeok" style="display:none;">&nbsp;&nbsp;영역</strong>
      <select name="select" class="input" id="cb_youngyeok" title="영역" style="display:none;">
      </select>  
      <strong id="st_gwamok" style="display:none;">&nbsp;&nbsp;과목</strong>
      <select name="select" class="input" id="cb_gwamok" title="과목" style="display:none;">
      </select>
       
      <strong id="st_guyeok" style="display:none;">&nbsp;&nbsp;구역</strong>   
      <select name="select" class="input" id="cb_guyeok" title="구역" style="display:none;">
      </select>
      <strong id="st_daehak" style="display:none;">&nbsp;&nbsp;대학</strong>   
      <select name="select" class="input" id="cb_daehak" title="대학" style="display:none;">
      </select>
      <strong id="st_hakgwa" style="display:none;">&nbsp;&nbsp;학과</strong>  
      <select name="select" class="input" id="cb_hakgwa" title="학과" style="display:none;">
      </select>
      <strong id="st_jeongong" style="display:none;">&nbsp;&nbsp;전공</strong>  
      <select name="select" class="input" id="cb_jeongong" title="전공" style="display:none;">
      </select>
      <strong id="st_haknyeon" style="display:none;">&nbsp;&nbsp;학년</strong>  
      <select name="select" class="input" id="cb_haknyeon" title="학년" style="display:none;">
      </select>
      <input name="button" type="button" class="btn" id="btn_search" value="조회" onClick="$.app.fn_searchGwamok();">
    </div>
    
    <div class="searchcol" id="div_search1" style="display:block;">
    	<strong>교과명으로 검색</strong>&nbsp;
      <input name="text" type="text" class="input" id="txt_gwamok" style="width: 160px;" placeholder="교과명을 입력하세요" onkeydown="javascript:$.app.fn_enterGwamok(event);">
      <input name="button" type="button" class="btn" id="btn_searchGwamok" value="조회" onClick="$.app.fn_searchGwamok('gwamok');">
    </div>
    <div class="searchcol" id="div_search2" style="display:none;">
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