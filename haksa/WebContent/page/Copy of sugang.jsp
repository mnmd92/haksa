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
	
	<title>register</title>
	<link href="../css/ku.css" rel="stylesheet" type="text/css">
	 
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script type="text/javascript" src="../js/jquery.json.js"></script>
	<script type="text/javascript" src="../js/sz_fsp_json.min.js"></script>
	<script type="text/javascript" src="../js/common.js"></script>
	<script type="text/javascript" src="../js/combo.js"></script>
	
	<script type="text/javascript">
	var objGwamokList;
	var objShincheinList;
	var su_cnt;
	
	
	$(function(){
		$.extend({
			app : {
				num : 0, 
				fn_init : function() {
					try {
						
						// cache false 처리
						$.ajaxSetup({ cache: false });
						
						var issugang = true;
						var _user = {};

						
						_user['a'] = '2';
						_user['id'] = '201414030';
						_user['name'] = '신승용';
						_user['hakgi'] = '4';
						_user['year'] = '2017';
						_user['campus'] = 'C';
						_user['daehak_name'] = 'IT대학';
						_user['daehak'] = '57';
						_user['hakgwa_name'] = '컴퓨터학부';
						_user['hakgwa'] = '06102';
						_user['jeongong_name'] = '컴퓨터정보통신공학전공';
						_user['jeongong'] = '0610201';
						_user['haknyeon'] = '4';
						_user['juya_gb'] = '1';
						_user['guyeok'] = '';
						_user['campus'] = '1';
						_user['witak_danche_cd'] = '000';
						_user['hakseoksa'] = '2';
						_user['joleop_hakjeom'] = '130';
						_user['seolmun_yn'] = '2';
						_user['notice_type'] = 'D';
						_user['yebi_gbn'] = 'B';
						_user['gigan_gbn'] = 'B2';
						_user['sugang_type'] = 'N';

							
							
							var user = _user;
					
						if( user["gigan_gbn"] == "Y1" || user["gigan_gbn"] == "Y2" || user["hakgi"] == "3" || user["hakgi"] == "4") {
							issugang = false;
						}
						
						// 콤보 데이터 가져오기 
						fsp.combo.getCombo(issugang);
						
						//직업연관성 삭제하기
						//$("#cb_gubun option[value='11']").remove();
						
						// 구분 변경 
						$("#cb_gubun").change(function() {
							fsp.combo.changeGubun($(this).val());
						});
						
						//if(!((user["hakgi"] == "3" || user["hakgi"] == "4") && user["campus"] == "2")){ //삼척계절학기경우 제1구역만 했었는데 다른대학에서도 강좌개설이 이뤄짐
												
						// 대학 변경 
						$("#cb_daehak").change(function() {
							fsp.combo.changeHakgwa($(this).val());
						});
						// 학과 변경 
						$("#cb_hakgwa").change(function() {
							fsp.combo.changeJeongong($(this).val());
						});
						// 영역 변경 
						$("#cb_youngyeok").change(function() {
							fsp.combo.changeYoungyeok();
						});
						//}
						// 춘천인 경우만 표시 
						if( user["campus"] == "1" ) {
							$("#div_search1").show();
							$("#div_search2").show();
						}
						
						// 조회 
						$.app.fn_searchShincheongList();
					} catch( e ) {
						alert("error:"  + e );
					}
				},	// end fn_init()
				
				/**
				*	수강신청 대상 과목을 조회한다. 
				**/
				fn_searchGwamok : function(sGwamok) {
					
					try {
						var user = parent.window._user;
						var sGb = $("#cb_gubun").val();
		
						
						var inData = {
								 HAKGI : user["hakgi"]
						       , YEAR :  user["year"]	            //user["year"]
						       , JUYA_GB :  user["juya_gb"]         // 주야구분
						       , GUYEOK_CD :  $("#cb_guyeok").val() // 구역코드
						       , CAMPUS_CD :  user["campus"]        // 캠퍼스코드
						       , YEBI_GBN :   user['yebi_gbn']      // 예비수강신청/본수강신청구분
							   , DAEHAK_CD : $("#cb_daehak").val()
						       , BUSEO_CD  : $("#cb_hakgwa").val()  //user["hakgwa"]	// 사용자 학과 
							   , TEAM_CD   : $("#cb_jeongong").val()	//user["jeongong"]	// 전공
							   , HAKNYEON  : $("#cb_haknyeon").val()	//user["haknyeon"]		// 학년 
							   , GWAMOK_CD :  $("#cb_gwamok").val()
							   , GWAMOK_NAME : $("#txt_gwamok").val()
							   , GBN : user["a"]
							};
						
											
						fsp.clear();
						if(sGwamok == "gwamok"){
							var gwamokNm = $("#txt_gwamok");
							if( fsp.common.isNull(gwamokNm, true, "과목명", gwamokNm) ) {
								return;
							}
							
							if( gwamokNm.val().length <= 1) {
								fsp.common.alert("CW00006", ["과목명", "2"]);
								gwamokNm.focus();
								return;
							}
							fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GwamokSearch");	
						}else{
							
							
							if(sGb==-1) {
								
								$.app.fn_getYebiShinchengList();
								return;
							}
							
							if(fsp.getCampus() == "S"){
								  if(sGb=="1") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:JeongongGwamok");	
								  if(sGb=="2") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GichoGwamok");				
								  if(sGb=="3") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GyunhyeongGwamok");						
								  if(sGb=="4") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:TukhwaGwamok");
								  if(sGb=="5") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:DaegyoGwamok");	
								  if(sGb=="6") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GyojikGwamok");				
								  if(sGb=="7") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:JayuseontaekGwamok");						
								  if(sGb=="12")fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:HakseoksaYeongye");							
							}else{
								  if(sGb=="1") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:JeongongGwamok");	
								  if(sGb=="2") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GichoGwamok");				
								  if(sGb=="3") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GyunhyeongGwamok");						
								  if(sGb=="4") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:TukhwaGwamok");
								  if(sGb=="5") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:DaegyoGwamok");	
								  if(sGb=="6") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GyojikGwamok");				
								  if(sGb=="7") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:JayuseontaekGwamok");						
								  if(sGb=="8") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:GasangGwamok");
								  if(sGb=="9") fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:HwasangGwamok");
								  if(sGb=="12")fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:HakseoksaYeongye");	
														
							}
						}
					
						$('#gawmok_list tr').remove();
					
						fsp.callService(
							""
							, ""	
							, inData
							, function(errorCode, rData){
								try {
									if( errorCode == 0 ) {
										$.app.fn_processData(rData,user);
									} 
								} catch( ee ) {
									fsp.common.jsError("#fn_searchGwamok" , ee);
								}
							}// end success 
						);
					} catch( e) {
						fsp.common.jsError("#fn_searchGwamok" , e);
					}	
				},// end fn_searchGwamok
				
				/**
				*	수강신청한 과목을 조회한다. 
				**/
				fn_searchShincheongList : function() {
					try {						
						var inData = {
						};
							
var _user = {};

						
						_user['a'] = '2';
						_user['id'] = '201414030';
						_user['name'] = '신승용';
						_user['hakgi'] = '4';
						_user['year'] = '2017';
						_user['campus'] = 'C';
						_user['daehak_name'] = 'IT대학';
						_user['daehak'] = '57';
						_user['hakgwa_name'] = '컴퓨터학부';
						_user['hakgwa'] = '06102';
						_user['jeongong_name'] = '컴퓨터정보통신공학전공';
						_user['jeongong'] = '0610201';
						_user['haknyeon'] = '4';
						_user['juya_gb'] = '1';
						_user['guyeok'] = '';
						_user['campus'] = '1';
						_user['witak_danche_cd'] = '000';
						_user['hakseoksa'] = '2';
						_user['joleop_hakjeom'] = '130';
						_user['seolmun_yn'] = '2';
						_user['notice_type'] = 'D';
						_user['yebi_gbn'] = 'B';
						_user['gigan_gbn'] = 'B2';
						_user['sugang_type'] = 'N';

							
							
							var user = _user;
						 
						fsp.clear();
						
						if(user['gigan_gbn'] == "Y2" ||user['gigan_gbn'] == "Y3" ){
							fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongListYebi");
						}else if((user['gigan_gbn'] == "B1" || user['gigan_gbn'] == "B2" || user['gigan_gbn'] == "B3" || user['gigan_gbn'] == "B4") && user['hakseoksa'] != "1") {
							 fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongList");							
		                }else if((user['gigan_gbn'] == "B1" || user['gigan_gbn'] == "B2" || user['gigan_gbn'] == "B3" || user['gigan_gbn'] == "B4") && user['hakseoksa'] == "1") {
		                     fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongListHakseoksa");							
 		                }else{
							return;
						}

						 $('#shincheong_list tr').remove();
						
						fsp.callService(
							""
							, ""
							, inData
							, function(errorCode, rData){
								try {
									if( errorCode == 0 ) {
										var sListHtml = "";
										var ds_list = rData.ds_out;
										var totHakjeom = 0.0;
										
										var bGb = true;
								  		if(user['gigan_gbn'] == "Y1" || user['gigan_gbn'] == "Y3" || user['gigan_gbn'] == "B2" || user['gigan_gbn'] == "B3"){
								  			bGb = false;
								  		}			
										
								  		if(user["a"] == "1"	|| user["a"] == "R" ){
								  			bGb = true;
								  		}
								  		
										for(var i=0;i<ds_list.length;i++){
											sListHtml += "<tr>\n";
											
											if(bGb){
												sListHtml += "<td><input onclick=\"$.app.fn_deleteShincheong("+ i +")\" name=\"button\" type=\"button\" class=\"delbtn\" id=\"button\" value=\"삭제\"></td>";
											}else{
									  			sListHtml += "<td>&nbsp;</td>";
											}
											
									  		var popStr = "'" + parent.window._user["year"]
											+ "', '" + parent.window._user["hakgi"] 
											+ "', '" + ds_list[i].WETAK_DANCHE_CD 
											+ "', '" + ds_list[i].DANDAE_CD 
											+ "', '" + ds_list[i].BUSEO_CD
											+ "', '" + ds_list[i].TEAM_CD 
											+ "', '" + ds_list[i].HAKNYEON 
											+ "', '" + ds_list[i].GWAMOK_CD
											+ "', '" + ds_list[i].BAN + "'"
											;
											
											sListHtml += "<td>" + (i+1) + "</td>\n";
											sListHtml += "<td>" + ds_list[i].ISU_NAME + "</td>\n";
											sListHtml += "<td>" + ds_list[i].GWAMOK_CD + "</td>\n";
											//sListHtml += "<td>" + ds_list[i].BAN + "</td>\n";
											sListHtml += "<td><a href=\"javascript:fsp.common.openPlanTimePopup(" + popStr + ")\">" + ds_list[i].GWAMOK_HNAME + "</a></td>\n";
											//sListHtml += "<td>&nbsp;</td>\n";
											sListHtml += "<td>" + fsp.common.getString(ds_list[i].GWAMOK_ENAME) + "</td>\n";
											sListHtml += "<td>" + ds_list[i].SISU + "</td>\n";
											sListHtml += "<td><a href=\"javascript:fsp.common.openEvalPopup(" + popStr + ")\">" +  fsp.common.getString(ds_list[i].H_NAME) + "</a></td>\n";
											sListHtml += "<td>" + fsp.common.getString(ds_list[i].GANGUISIL) + "</td>\n";
											sListHtml += "<td>" + fsp.common.getString(ds_list[i].GANGUISIGAN) + "</td>\n";
											if(user['gigan_gbn'] == "Y2"){
											   sListHtml += "<td>" + fsp.common.getString(ds_list[i].JAESUGANG_NAME) + "</td>\n";
											}else{
											   sListHtml += "<td><a href=\"javascript:fsp.common.openJaesugangPopup(" + popStr + ")\">" + fsp.common.getString(ds_list[i].JAESUGANG_NAME) + "</a></td>\n";
										    }
											sListHtml += "<td>" + fsp.common.getString(ds_list[i].BIGO) + "</td>\n";
											//sListHtml += "<td>&nbsp;</td>\n";
											sListHtml += "</tr>\n";
											totHakjeom += parseFloat(ds_list[i].HAKJEOM);
										}
										objShincheinList = ds_list;
										// 중복 발생으로 인하여 삭제처리 변경 
										$('#shincheong_list tr').remove();
										$("#shincheong_list").append(sListHtml);
										$("#totHakjeom").text(totHakjeom);												} 
								} catch( ee ) {
									fsp.common.jsError("#fn_searchShincheongList" , ee);
								}
							}// end success 
						);
					} catch( e) {
						fsp.common.jsError("#fn_searchShincheongList" , e);
					}	
				},// end fn_searchGwamok			
				
				fn_getYebiShinchengList : function(){
					try {
						var user = parent.window._user;
						var sJsonUrl = "../yebi/" + user['year'] + user['hakgi'] + "/" + user['id'] + ".json";
						
						$('#gawmok_list tr').remove();
						
						$.getJSON( sJsonUrl, function( data ) {
							$.app.fn_processData(data,user);
						});
						
					} catch( e) {
						fsp.common.jsError("#fn_deleteShincheong" , e);
					}	
					
				},
				
				fn_processData : function(rData, user){
					
					var user = parent.window._user;
					var sListHtml = "";
					var ds_list = rData.ds_out;
					
					if(ds_list.length <1 ){
						fsp.common.alert("CW00003");
						return;
					}
					
					for(var i=0;i<ds_list.length;i++){
				  		var sugang_inwon = parseInt(ds_list[i].SUGANG_INWON);
				  		var daesang_inwon = parseInt(ds_list[i].DAESANG_INWON);
				  		var bGb = true;
				  		
				  		if(user['gigan_gbn'] == "Y1" || user['gigan_gbn'] == "Y3" || user['gigan_gbn'] == "B2" || user['gigan_gbn'] == "B4"){
				  			bGb = false;
				  		}
				  		
				  		if(user['gigan_gbn'] == "B1" || user['gigan_gbn'] == "B3"){
					  		if(daesang_inwon == 0){
					  			bGb = false;
					  		}else if(sugang_inwon >= daesang_inwon ){
					  			bGb = false;
					  		}
				  		
					    	if(user["a"] == "1" ){
					  			bGb = true;
					  	    }	
				  		}
				  		
				  		if(user["a"] == "R" ){
				  			bGb = true;
				  	    }	
						
				  		sListHtml += "<tr>\n";
				  	
				  		if(bGb){
							sListHtml += "<td><input  onclick=\"$.app.fn_processInsertShincheong('gwamokList',"+ i +")\" name=\"button\" type=\"button\" class=\"btn\" id=\"button\" value=\"신청\"></td>";
				  		}else{
				  			sListHtml += "<td>&nbsp;</td>";
				  		}

				  		var popStr = "'" + parent.window._user["year"]
						+ "', '" + parent.window._user["hakgi"] 
						+ "', '" + ds_list[i].WETAK_DANCHE_CD 
						+ "', '" + ds_list[i].DANDAE_CD 
						+ "', '" + ds_list[i].BUSEO_CD
						+ "', '" + ds_list[i].TEAM_CD 
						+ "', '" + ds_list[i].HAKNYEON 
						+ "', '" + ds_list[i].GWAMOK_CD
						+ "', '" + ds_list[i].BAN + "'"
						;				  		
				  		
						sListHtml += "<td>" + (i+1) + "</td>\n";
						sListHtml += "<td>" + ds_list[i].ISU_NAME + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].BAN) + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].GWAMOK_CD) + "</td>\n";
						sListHtml += "<td><a href=\"javascript:fsp.common.openPlanTimePopup(" + popStr + ")\">" +  ds_list[i].GWAMOK_HNAME + "</a></td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].GWAMOK_ENAME) + "</td>\n";
						sListHtml += "<td>" + ds_list[i].SISU + "</td>\n";
						sListHtml += "<td><a href=\"javascript:fsp.common.openEvalPopup(" + popStr + ")\">" + fsp.common.getString(ds_list[i].H_NAME) + "</a></td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].GANGUISIL) + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].SUEOPSIGAN) + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].DAESANG_INWON) + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].SUGANG_INWON) + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].GONGHAK_GB) + "</td>\n";
						sListHtml += "<td>" + fsp.common.getString(ds_list[i].BIGO) + "</td>\n";
						//sListHtml += "<td>&nbsp;</td>\n";
						//sListHtml += "<td>&nbsp;</td>\n";
						sListHtml += "</tr>\n";
					}
					objGwamokList=ds_list;
					$("#gawmok_list").append(sListHtml);
				
				},
				
				
				/**
				*	수강신청한 과목을 삭제한다. 
				**/
				fn_deleteShincheong : function(nIdx) {
					try {
						var user = parent.window._user;
						var sGb = $("#cb_gubun").val();
						var inData = {
								 SU_GWAMOK_CD : objShincheinList[nIdx].GWAMOK_CD
								, SU_BAN : objShincheinList[nIdx].BAN
								, GBN : "P"
								
							};

						fsp.clear();
						
						var gbn_hakseoksa = objShincheinList[nIdx].HAKSEOKSA_YN;
						
						
					   // alert(gbn_hakseoksa);
						if(user['gigan_gbn'] == "Y2" ){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongDeleteYebi");
						}else if((user["gigan_gbn"] == "B1" || user["gigan_gbn"] == "B4") && gbn_hakseoksa == "N" ){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongDelete");
						}else if((user['gigan_gbn'] == "B1" || user["gigan_gbn"] == "B4") && gbn_hakseoksa == "Y" ){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongDeleteHakseoksa");
						}else{
							fsp.common.alert("수강신청 기간이 아닙니다.");
							return;
						}

						fsp.callService(
							""
							, ""
							, inData
							, function(errorCode, rData){
								try {
									if( errorCode == 0 ) {
										//fsp.common.alert("CI00016");	
										//$.app.fn_searchShincheongList();
										
										
										fsp.common.alert( rData.ds_out[0].ERRMSG );
										if( rData.ds_out[0].ERRCD != "000"){
											return;
										}
										//fsp.common.alert("CI00012");
										$.app.fn_searchShincheongList();
										
									} 
								} catch( ee ) {
									fsp.common.jsError("#fn_deleteShincheong" , ee);
								}
							}// end success 
						);
					} catch( e) {
						fsp.common.jsError("#fn_deleteShincheong" , e);
					}	
				},// end fn_searchGwamok				
				
				fn_processInsertShincheong : function (sGb,nIdx) {
					try{
						var inData;
						
						if(sGb == "gwamok"){
							
							var gwamok_cd = $("#txt_gwamok1").val();
							var ban = $("#txt_ban").val();
							
							if(gwamok_cd.length <= 6){
								fsp.common.alert("CW00006", ["과목코드", "7"]);
								$("#txt_gwamok1").focus();
								return;
							}
	                        if(ban.length == 0){
	                        	fsp.common.alert("CW00006", ["반", "1"]);
	                        	$("#txt_ban").focus();
								return;
							}	
							
							
							
							
						    inData = { SU_GWAMOK_CD : $("#txt_gwamok1").val(),
							       SU_BAN : $("#txt_ban").val()}
						}else{
							inData = {SU_GWAMOK_CD : objGwamokList[nIdx].GWAMOK_CD,
								      SU_BAN : objGwamokList[nIdx].BAN,
								      GBN : "P"
							    }
						};		
			
						
						
						$.app.fn_insertShincheong(inData);
					} catch( e) {
						fsp.common.jsError("#fn_processInsertShincheong" , e);
					}	
				},
				
				
				/**
				*	수강신청한 과목을 저장한다. 
				**/
				fn_insertShincheong : function(inData) {
					try {
						var user = parent.window._user;						
						var sGb = $("#cb_gubun").val();
						
						fsp.clear();
						if(user["gigan_gbn"] == "Y2" ){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongInsertYebi");
						}else if( (user["gigan_gbn"] == "B1" ||  user["gigan_gbn"] == "B3") && user["haknyeon"] == "9" && user["campus"] == '1'){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongInsertTagyo");
						}else if((sGb != "12" && user["gigan_gbn"] == "B1") || (sGb != "12" && user["gigan_gbn"] == "B3") ){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongInsert");
						}else if((sGb == "12" && user['gigan_gbn'] == "B1") || (sGb == "12" && user['gigan_gbn'] == "B3")){
							fsp.addSingle("knu/" + fsp.common.getSqlmap() + "/sugang:ShincheongInsertHakseoksa");		
						}else{
							fsp.common.alert("수강신청 기간이 아닙니다.");
							return;
						}						
						
						// 건수를 증가시킨다. 
						if( this.num > 100 ) {
							fsp.common.alert("CW00007");
							try {
								parent.window.location = "index.html";
							} catch ( ee ) {
								window.location = "index.html";
							}
							return;
						}
						
						  
						// 건수 증가
						this.num += 1;
						fsp.callService(
							""
							, ""
							, inData
							, function(errorCode, rData){
								try {
									if( errorCode == 0 ) {
										
															
										fsp.common.alert( rData.ds_out[0].ERRMSG );
																													
									    if(rData.ds_out[0].ERRCD == "001"){
									    	try {
												parent.window.location = "index.html";
											 } catch ( ee ) {
												window.location = "index.html";
											 }
											 return;
										// 설문조사	 
									    }else if(rData.ds_out[0].ERRCD == "111"){
									    	fsp.common.open_seolmunPopup(user["hakbeon"]);
									    	return;
										// 보안문자	
										}else if( rData.ds_out[0].ERRCD == "112"){
											var no = Math.ceil(Math.random()*100);
											    fsp.common.openBoanMunjaPopup(no);
									    	return;
										}	
										//fsp.common.alert("CI00012");
										$.app.fn_searchShincheongList();
									} 
								} catch( ee ) {
									fsp.common.jsError("#fn_insertShincheong" , ee);
								}
							}// end success 
						);
					} catch( e) {
						fsp.common.jsError("#fn_insertShincheong" , e);
					}	
				},// end fn_searchGwamok								
				/**
				*	시간표 조회 
				**/
				fn_searchTimeTable : function() {
					try {
						var user = parent.window._user;
						// year, hakgi, HAKNYEON, BUSEO_NAME, H_NAME
						fsp.common.openTimeTablePopup(user["year"], user["hakgi"], user["hakbeon"]
							, user["hakgwa_name"], user["name"]);
					} catch( e ) {
						fsp.common.jsError("#fn_searchTimeTable" , e);
					}
				},	// end fn_searchTimeTable
				
				/**
				*	엔터키 이벤트 처리.<p>
				**/
				fn_enterGwamok : function(e) {
					if(e.keyCode != 13){
						return;
					}
					
					$.app.fn_searchGwamok('gwamok');
				},	// end fn_enterGwamok
				fn_enterInsertShincheong : function(e) {
					if(e.keyCode != 13){
						return;
					}
					
					$.app.fn_processInsertShincheong('gwamok',0);
				},	// end fn_enterInsertShincheong
			}
		});		// end extends
	});
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