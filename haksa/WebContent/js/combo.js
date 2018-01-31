/**
 * 콤보 데이터를 처리한다.<p>
 */
var knu_combo = function() {
};

// 콤보 데이터 
knu_combo.comboData = null;
// 콤보 명 
knu_combo.comboName = ["gwamok", "youngyeok", "guyeok", "daehak", "hakgwa", "jeongong", "haknyeon", "jobgroup", "joblevel"];
// 과목에 해당하는 콤보 데이터 
knu_combo.gwamok = {};

/**
 * 콤보 데이터를 가져온다. 
 * @param isSugang 수강신청 페이지인지 여부 
 */
knu_combo.prototype.getCombo = function(isSugang) {
	$.getJSON( "./combo.json", function( data ) {
		knu_combo.comboData = data;
		knu_combo.Data(isSugang);
	});
};

/**
 * 구분 변경 시 처리.
 */
knu_combo.prototype.changeGubun = function() {
	var gbn = $("#cb_gubun");
	// 전체 감춤. 
	knu_combo.hiddenCombo();
	
	var gubun = gbn.val();
	

	
	// 해당 구분 값에 따른 처리 
	if( fsp.common.isEmpty(gubun) || gubun == "-1") {
		return;
	}
	
	var gwamokSqlmap;
	var disp = knu_combo.comboData.dispcombo["c" + gubun];
	



	if( disp ) {
		for(var i = 0; i < knu_combo.comboName.length; i++) {
			var d = disp[knu_combo.comboName[i]];
			
			if( d && d == "Y") {
//				alert(knu_combo.comboName[i]);
				var nm = "#cb_" + knu_combo.comboName[i];
				$(nm).css('display', 'inline-block');
				
				nm = "#st_" + knu_combo.comboName[i];
				$(nm).css('display', 'inline-block');
//				alert(knu_combo.comboName[i]);콤포이름이 나올때 마다 확인 
				
				// 과목인경우 조회 
				if( knu_combo.comboName[i] == "gwamok" ) {
					gwamokSqlmap = disp["gwamok_sqlmap"];
				}
			}	
		}
	}
	
	// 교직, 교양, 자유, 전공 -> 과목 조회 
	if( gwamokSqlmap  && !fsp.common.isEmpty(gwamokSqlmap)) {
		// 조회해야 한다.
		
//		knu_combo.selectGwamok(gubun, gwamokSqlmap);
//	} else {

		
		    knu_combo.dispGwamok(gwamokSqlmap);
		
	}
	
	
	// 교양과목 변경일때 영역구분을 변경한다.
	// 이수구분에 따른 영역구분을 변경한다. 
	if(gubun == "3"|| gubun == "4"){
      
       fsp.combo.changeGyoyang(gubun);	
	}
	
	// 직업연관성에 따른 직업군 표시

	if( gubun == "11") {
		 
		var combo = $("#cb_jobgroup");
		if( !combo ) {
			return;
	     }
//		$("#cb_jobgroup").css('display', 'inline-block');
		var data = knu_combo.comboData.jobgroup;
		
		if( !data ) {
			return;
		}
		combo.empty();
		
		for(var i = 0; i < data.length; i++) {
			combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}
		
		var combolevel = $("#cb_joblevel");
		if( !combolevel ) {
			return;
	     }
//		$("#cb_jobgroup").css('display', 'inline-block');
		var data = knu_combo.comboData.joblevel;
		
		if( !data ) {
			return;
		}
		combolevel.empty();
		
		for(var i = 0; i < data.length; i++) {
			combolevel.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}		
		
		
		
	}
	
	// 학석사 연계 처리 
	if( gubun == "12") {
		// 별도의 콤보 데이터를 표시한다. 
		var combo = $("#cb_hakgwa");
		if( !combo ) {
			return;
	     }
		$("#cb_hakgwa").css('display', 'inline-block');
		var data = knu_combo.comboData.dhakgwa;
		
		if( !data ) {
			return;
		}
		combo.empty();
		
		for(var i = 0; i < data.length; i++) {
			combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}
	} else {
		fsp.combo.changeHakgwa($("#cb_daehak").val());
	}
};
/**
 * 과목 콤보를 표시한다.<p>
 * 
 * @param gbn
 */
knu_combo.dispGwamok = function(gwamokSqlmap) {
	var combo = $("#cb_gwamok");
//	alert(gwamokSqlmap);
	if( combo ) {
		var data = eval("knu_combo.comboData." + gwamokSqlmap);

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
		var user_jeongong = user["jeongong"];
		combo.empty();
		if( data ) {
			for(var i = 0; i < data.length; i++) {
				if(gwamokSqlmap == "daegyo"){
					if(user_jeongong == data[i].h){
					   combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
					}
					 
				}else{
				     combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
				}
			}
		}
	}
};
/**
 * 과목을 조회한다.<p>
 * @param gbn 구분 
 * @param sqlmap
 */
knu_combo.selectGwamok = function(gbn, sqlmap) {
	var data = knu_combo.gwamok["c" + gbn];
	if( !data ) {
		// 조회한다. 
		try {
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
			
			var inData = {
				HAKGI : user["hakgi"]
				, YEAR :  user["year"]
				, BUSEO_CD : user["hakgwa"]	// 사용자 학과 
				, TEAM_CD : user["jeongong"]	// 전공
				, HAKNYEON : user["haknyeon"]		// 학년 
				, JUYA_GB : user["juya_gb"]	// 주야구분
			};
			
			fsp.clear();
			fsp.addSearch("knu/" + fsp.common.getSqlmap() + "/sugang:" + sqlmap);
			fsp.callService(
				""
				, ""
				, inData
				, function(errorCode, rData){
					try {
						knu_combo.gwamok["c" + gbn] = rData.ds_out;
						knu_combo.dispGwamok(gbn);
					} catch( ee ) {
						fsp.common.jsError("#selectGwamok" , ee);
					}
				}// end success 
			);
		} catch( e) {
			fsp.common.jsError("#selectGwamok" , e);
		}	
	} else {
		knu_combo.dispGwamok(gbn);
	}
};
/**
 * 콤보를 모두 감춘다. 
 */
knu_combo.hiddenCombo = function() {
	for(var i = 0; i < knu_combo.comboName.length; i++) {
		var nm = "#cb_" + knu_combo.comboName[i];
		if( $(nm)) {
			$(nm).css('display', 'none');
		}
		
		nm = "#st_" + knu_combo.comboName[i];
		if( $(nm)) {
			$(nm).css('display', 'none');
		}
	}
};
/**
 * 콤보 데이터를 표시한다. 
 */
knu_combo.Data = function(isSugang) {
	try {
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
		// 고정된 값을 가지는 콤보 설정 
		// 사용자에 따른 컴포넌트 사용 여부 결정
		//

		 
		if(user["a"]=="2" && fsp.getCampus() == "S" ){

		// $("#cb_daehak").prop("disabled", true);
		// $("#cb_hakgwa").prop("disabled", true);
		// $("#cb_jeongong").prop("disabled", true);
		// $("#cb_guyeok").prop("disabled", true);
	    }
		
		// 구분콤보에 데이터 표시 
		if( $("#cb_gubun") ) {
		
			var data = knu_combo.comboData.gubun;
			var gbn = $("#cb_gubun");
			var title = $(document).attr('title'); 
			gbn.empty();
			if( isSugang ) {
				gbn.append("<option value='-1'>[예비수강]</option>");
			}
			// knu_combo.Combo(gbn, data, false);
			
			
			 for(var i = 0; i < data.length; i++) {
				   //  수강신청 페이지에서는 직업 분류가 조회되지 않는다.
				    if(title == "register" && (data[i].c == "10" || data[i].c == "11")  ) continue ;
				    gbn.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
			 }
			 
			// 학석사 연계생이고, 본수강신청 이후에만 조회 됨
			if(user['hakseoksa'] == '1' && user['yebi_gbn'] == 'B'){
					gbn.append("<option value='12'>학석사연계</option>");
			}
			// 수강신청기간에는 예비수강신청 내용이 조회됨
			if( isSugang ) {
				$.app.fn_getYebiShinchengList();
			}
			
		}
		if( $("#cb_daehak") ) {
			var data = knu_combo.comboData.daehak;
			knu_combo.Combo($("#cb_daehak"), data, true);
			$("#cb_daehak").val(user["daehak"]);
					
			// 학과 설정 
			fsp.combo.changeHakgwa(user["daehak"], user["hakgwa"]);
			$("#jeongong").val(user["jeongong"]);
		}
	
		// 학년
		if( $("#cb_haknyeon") ) {
			var data = knu_combo.comboData.haknyeon;
			knu_combo.Combo($("#cb_haknyeon"), data, true);
			$("#cb_haknyeon").val(user["haknyeon"]);
		}
		// 구역 
		if( $("#cb_guyeok") && knu_combo.comboData.guyeok) {
			var data = knu_combo.comboData.guyeok;
			knu_combo.Combo($("#cb_guyeok"), data, true);
			$("#cb_guyeok").val(user["guyeok"]);
		}
		// 영역 
		if( $("#cb_youngyeok") && knu_combo.comboData.youngyeok) {
			var gbn =  $("#cb_gubun").val();
//			alert(gbn);
			var data = knu_combo.comboData.youngyeok;
			knu_combo.Combo($("#cb_youngyeok"), data, true);
		}
		
		if( $("#cb_gubun") ) {
			fsp.combo.changeGubun($("#cb_gubun").val());
		}	
	} catch( e ) {
		alert("error:" + e);
	}
};

/**
 * 주어진 대학에 해당하는 학과 정보를 표시한다.<p>
 * 
 * @param daehak 대학코드 
 */
knu_combo.prototype.changeHakgwa = function(daehak, defValue) {

	var combo = $("#cb_hakgwa");
	if( !combo ) {
		return;
	}
	
	var data = knu_combo.comboData.hakgwa;
	
	if( !data ) {
		return;
	}
	combo.empty();
	
	var firstValue = "";
	for(var i = 0; i < data.length; i++) {
		if( data[i].d == daehak ) {
			if( firstValue == "") {
				firstValue = data[i].c;
			}
			combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}	
	}

	// 전공을 변경시킴. 
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
	
	if( defValue ) {
		combo.val(defValue);
	} else {
		combo.val(user["hakgwa"]);
		defValue = combo.val();
		
		if( defValue == null ) {
			defValue = firstValue;
			
			combo.val(firstValue);
			defValue = combo.val();
		}
	}

	fsp.combo.changeJeongong(defValue, user["jeongong"]);
};

/**
 * 주어진 학과에 해당하는 전공 정보를 표시한다.<p>
 * 
 * @param hakgwa 학과 코드  
 */
knu_combo.prototype.changeJeongong = function(hakgwa,defValue) {
		
	var combo = $("#cb_jeongong");
	if( !combo ) {
		return;
	}
	
	var data = knu_combo.comboData.jeongong;
	if( !data) {
		return;
	}
	
	combo.empty();
	
	var firstValue = "";
	for(var i = 0; i < data.length; i++) {
		if( data[i].h == hakgwa ) {
			if( firstValue == "") {
				firstValue = data[i].c;
			}
			combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}	
	}
	
	if( defValue ) {
		combo.val(defValue);
	} else {
		// 사용자 기본값으로 체크  
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
		combo.val(user["jeongong"]);
	}
	
	if( combo.val() == null ) {
		combo.val(firstValue);
	}
};
/**
 * 주어진 교양 선택에 따라 영역을 변경한다.
 * 
 * @param 교양 영역 변경  
 */
knu_combo.prototype.changeGyoyang = function(gubun) {
		
	 var isu_cd ;
     if(gubun == "3"){
  	   isu_cd = "42";
     }else if(gubun == "4"){
  	   isu_cd = "43";
     }
     
	
	var combo = $("#cb_youngyeok");
	var youngyeok_cd;
	if( !combo ) {
		return;
	}
	
	var data = knu_combo.comboData.youngyeok;
	if( !data) {
		return;
	}
	
	combo.empty();
	
	var firstValue = "";
	for(var i = 0; i < data.length; i++) {
		if( data[i].h == isu_cd ) {
			if( firstValue == "") {
				firstValue = data[i].c;
			}
			combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}	
	}
	
	youngyeok_cd = $("#cb_youngyeok").val();
	
	fsp.combo.changeYoungyeok();	

};



/**
 * 영역에 따른 과목 변경
 * 
 * @param 영역에 따른 과목 변경  
 */
knu_combo.prototype.changeYoungyeok = function() {
	
   var gubun = $("#cb_gubun").val();
   var youngyeok = $("#cb_youngyeok").val();
   var dataFile;
    if(gubun == "3"){
    	dataFile = "gyunhyeong";
    }else if(gubun =="4"){
    	dataFile = "tukhwa";	
    }

	var combo = $("#cb_gwamok");
	combo.empty();

		
	   var data;
		data = eval("knu_combo.comboData."+dataFile);

		combo.empty();
		if( data ) {
			for(var i = 0; i < data.length; i++) {
				
					if(youngyeok == data[i].h){
					   combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
					}
				
			}
		}

};
/**
 * 콤보의 데이터를 초기화 한다.
 * 
 * @param combo
 */
knu_combo.Combo = function(combo, data, isClear) {
	try {
		if( isClear ) {
			combo.empty();
		}
		//alert(document.toString());
		for(var i = 0; i < data.length; i++) {
			combo.append("<option value='" + data[i].c + "'>" + data[i].n + "</option>");
		}
	} catch( e ) {
	}
};
/**
 * fsp 객체에 추가한다.<p>
 */
fsp.addConstructor(function() {
    if (typeof fsp.combo === "undefined") {
        fsp.combo = new knu_combo();
    }
});