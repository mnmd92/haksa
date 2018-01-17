//오른쪽 마우스 막기
document.oncontextmenu = function(e){
	if(e){
		e.preventDefault();
	} else {
		event.keyCode = 0;
		event.returnValue = false;
	}
};

/**
 * 공통 모듈.<p>
 */
var fsp_common = function() {
	
};

fsp_common.prototype.getSqlmap = function() {
	if( fsp.getCampus() == "S" ) {
		return "shaksa";
	} else {
		return "chaksa";
	}
};

/**
 * 화면을 초기화한다.<p>
 */
fsp_common.prototype.init = function() {
	// 메뉴 정보를 표시한다.  
	try {
		
	} catch( e ) {
		
	}	
	this.showMsg("CI00011");
};
/**************************************************************************************
* 입력된 객체의 값이 Null인지 유무 확인하기
* @param  chkObj  확인할 객체
* @param  isShowMsg 메시지창 전시 여부
* @param  lbTxt 해당 항목 명칭
* @param  해당 객체가 아니라 Focus를 받을 별도의 객체가 존재할 경우 해당 객체
* @return null 인 경우 - true, 그외 false
**************************************************************************************/
fsp_common.prototype.isNull = function(chkObj, isShowMsg, lbTxt, focusObj) {
	var str = null;
	if( typeof chkObj == "string") {
		str = chkObj;
	} else {
		try {
			str = chkObj.val();
		} catch( e ) {
			str = null;
		}	
		
		if( !focusObj ) {
			focusObj = chkObj;
		}
	}
	// 값이 존재하지 않는다. 
	if( str !== null && str !== "" && str !== undefined ) {
		return false;
	} 
	
	// 메시지를 표시한다. 
	if( isShowMsg ) {
		if( lbTxt ) {
			// [${}] 값을 입력하여 주십시오.
			this.alert("CW00001", lbTxt);
		} else {
			// "값을 입력하여 주십시오."
			this.alert("CW00002");
		}
		
		if( focusObj ) {
			focusObj.focus();
		}
	}
	
	return true;
};
/**
 * 주어진 객체의 값이 존재하는지를 확인한다.<p>
 * @param obj
 */
fsp_common.prototype.isEmpty = function(obj) {
	if( !obj ) {
		return true;
	}
	
	var str = null;
	
	if( typeof obj == "string") {
		str = obj;
	} else {
		str = obj.val();
	}
	
	if( !str ) {
		return true;
	}
	
	if( str === null || str === "") {
		return true;
	}
	
	return false;
};
/**
 * 공백을 제거한 문자열을 가져온다.<p>
 */
fsp_common.prototype.getString = function( str ) {
	if( !str ) {
		return "";
	}
	
	if( str == null || str == undefined || str == "undefined") {
		return "";
	}
	
	return str;
}
/**
 * 
 * @param formatStr
 * @param formatVal
 * @returns {Boolean}
 */
fsp_common.prototype.isValidFormat = function(formatStr, formatValue) {
	if( formatValue === "" || formatValue === null ) {
		return true;
	}
	try {
		return formatStr.test(formatValue) ;
	} catch ( e ) {
		console.log("fsp_common.prototype.isValidFormat error:" + e.description );
	}	
	return false;
};
/**
 * Alert 창을 표시한다.<p>
 * 
 * @param msg 메시지 
 */
fsp_common.prototype.alert = function(msg, arr) {
	alert( fsp.message.getMessage(msg, arr) );
};

/**
 * confirm 창을 표시한다.<p>
 * 
 * @param msg 메시지 
 * @returns 처리 결과 
 */
fsp_common.prototype.confirm = function(msg, arr) {
	return confirm( fsp.message.getMessage(msg, arr) );
};

/**
 * 화면에 메시지를 표시한다. <p>
 * @param msgId 메시지 아이디 
 * @param arr 메시지 표시 속성 
 */
fsp_common.prototype.showMsg = function(msgId, arr) {
	var msg = fsp.message.getMessage(msgId, arr);
	if( !msg ) {
		return;
	}
};
/**
 * 자바스크립트 에러를 기록한다.<p>
 * 
 * @param caller
 * @param e
 */
fsp_common.prototype.jsError = function( caller, e) {
	alert( "javascript 예외\n" + caller + "\n" + e );
};

/**
 * 처리중입니다. 다이얼로그 표시.<p>
 */
fsp_common.prototype.makeWating = function() {
	var loading = $('<div id="loading" class="loading"></div><span id="loading_txt">wating....</span>').appendTo(document.body).hide();
	$(window).ajaxStart(function() {
		loading.show();
	});
	$(window).ajaxStop(function() {
		loading.hide();
	});	
};

/**
 * 강의 평가 결과 팝업 화면을 호출한다.
 */
fsp_common.prototype.openEvalPopup = function(year, hakgi, wetakDancheCd, DANDAE_CD, BUSEO_CD
			, TEAM_CD, HAKNYEON, GWAMOK_CD, BAN) {
	var popUrl = "./evalList.html";	// 팝업창에 출력될 페이지 URL
	var args = "YEAR=" +  year 
		+ "&HAKGI=" + hakgi
		+ "&WETAK_DANCHE_CD=" + wetakDancheCd
		+ "&DANDAE_CD=" + DANDAE_CD
		+ "&BUSEO_CD=" + BUSEO_CD
		+ "&TEAM_CD=" + TEAM_CD
		+ "&HAKNYEON=" + HAKNYEON
		+ "&GWAMOK_CD=" + GWAMOK_CD
		+ "&BAN=" + BAN
		;
	var popOption = "width=630, height=600, resizable=no, scrollbars=yes, status=no, location=no;";    //팝업창 옵션(optoin)
	window.open(popUrl + "?" + args,"",popOption);
};


/**
 * 수업계획서 팝업 화면을 호출한다.
 */
fsp_common.prototype.openPlanTimePopup = function(year, hakgi, wetakDancheCd, DANDAE_CD, BUSEO_CD
			, TEAM_CD, HAKNYEON, GWAMOK_CD, BAN) {
	var popUrl = "./planTime.html";	// 팝업창에 출력될 페이지 URL
	var args = "YEAR=" +  year 
		+ "&HAKGI=" + hakgi
		+ "&WETAK_DANCHE_CD=" + wetakDancheCd
		+ "&DANDAE_CD=" + DANDAE_CD
		+ "&BUSEO_CD=" + BUSEO_CD
		+ "&TEAM_CD=" + TEAM_CD
		+ "&HAKNYEON=" + HAKNYEON
		+ "&GWAMOK_CD=" + GWAMOK_CD
		+ "&BAN=" + BAN
		;
	var popOption = "width=650, height=800, resizable=no, scrollbars=yes, status=no, location=no;";    //팝업창 옵션(optoin)
	window.open(popUrl + "?" + args,"",popOption);
};


/**
 * 수강대상을 조회하는 화면
 */
fsp_common.prototype.openDaesangPopup = function(year, hakgi, wetakDancheCd, DANDAE_CD, BUSEO_CD
		, TEAM_CD, HAKNYEON, GWAMOK_CD, BAN) {
var popUrl = "./daesangList.html";	// 팝업창에 출력될 페이지 URL
var args = "YEAR=" +  year 
	+ "&HAKGI=" + hakgi
	+ "&WETAK_DANCHE_CD=" + wetakDancheCd
	+ "&DANDAE_CD=" + DANDAE_CD
	+ "&BUSEO_CD=" + BUSEO_CD
	+ "&TEAM_CD=" + TEAM_CD
	+ "&HAKNYEON=" + HAKNYEON
	+ "&GWAMOK_CD=" + GWAMOK_CD
	+ "&BAN=" + BAN
	;
var popOption = "width=630, height=600, resizable=no, scrollbars=yes, status=no, location=no;";    //팝업창 옵션(optoin)
window.open(popUrl + "?" + args,"",popOption);
};
/**
 * 시간표 팝업 화면을 호출한다.
 */
fsp_common.prototype.openTimeTablePopup = function(year, hakgi, hakbeon, buseo_name, hname) {
	var popUrl = "./timeTable.html";	// 팝업창에 출력될 페이지 URL
	var popOption = "width=650, height=800, resizable=no, scrollbars=yes, status=no, location=no;";    //팝업창 옵션(optoin)
	window.open(popUrl,"",popOption);
};

/**
 * 재이수 팝업 화면을 호출한다.
 */
fsp_common.prototype.openJaesugangPopup = function(year, hakgi, wetakDancheCd, DANDAE_CD, BUSEO_CD
		, TEAM_CD, HAKNYEON, GWAMOK_CD, BAN) {
var popUrl = "./jaesugangList.html";	// 팝업창에 출력될 페이지 URL
var args = 
	 "&GWAMOK_CD=" + GWAMOK_CD
	
	;
var popOption = "width=650, height=300, resizable=no, scrollbars=no, status=no, location=no;";    //팝업창 옵션(optoin)
window.open(popUrl + "?" + args,"",popOption);
};


/**
 * 통장번호 변경  팝업 화면을 호출한다.
 */
fsp_common.prototype.openTongjangPopup = function() {
	var popUrl = "./TongjangNoPop.html";	// 팝업창에 출력될 페이지 URL
	var args ;
	var popOption = "width=500, height=300, resizable=no, scrollbars=no, status=no, location=no;";    //팝업창 옵션(optoin)
	window.open(popUrl + "?" + args,"",popOption);
};


/**
*	교육만족도 설문조사 팝업 화면 호출
**/
fsp_common.prototype.open_seolmunPopup = function(hakbeon) {
	
	var popUrl = "./seolmun.html";	// 팝업창에 출력될 페이지 URL
	var args = "HAKBEON=" + hakbeon  ;
	var popOption = "width=500, height=300, resizable=no, scrollbars=yes, status=no,location=no ;";    //팝업창 옵션(optoin)
	var popup = window.open(popUrl + "?" + args,"",popOption);
	
	if(popup == null || popup.screenLeft == 0){
		alert('팝업이 차단중입니다. 팝업차단을 해제하세요')
	} 
};

/**
*	보안문자 팝업 화면 호출
**/
fsp_common.prototype.openBoanMunjaPopup = function(no) {
	var popUrl = "./BoanMunjaPop.html";	// 팝업창에 출력될 페이지 URL
	var args = "NO=" + no  ;
	var popOption = "width=500, height=300, resizable=no, scrollbars=no, status=no,location=no;";    //팝업창 옵션(optoin)
	window.open(popUrl + "?" + args,"",popOption);
};

/**
 * 해당 문자열에 대해서 NULL을 제외하고 표시 문자열을 가져온다.<p>
 * @param str
 * @returns
 */
fsp_common.prototype.getDispStr = function( str ) {
	if( !str ) {
		return "";
	}
	
	if( str == null || str == undefined ) {
		return "";
	}
	
	return str;
};
/**
 * URL의 파라메터를 가져온다.<p>
 * 
 * @returns 
 */
fsp_common.prototype.getParamStrings = function() {
	var vars = {};
	var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,    
		function(m,key,value) {
		  vars[key] = value;
		}
	);
	
	return vars;
};
/**
 * fsp 객체에 추가한다.<p>
 */
fsp.addConstructor(function() {
    if (typeof fsp.common === "undefined") {
        fsp.common = new fsp_common();
    }
});

/*
 *  메시지 처리 모듈.
 */
var fsp_message = function() {

};
/**
 * 메시지 정보.<p>
 */
fsp_message.messageInfo = {
	CI00001 : "저장 하시겠습니까?"
	, CI00002 : "삭제 하시겠습니까?"
	, CI00003 : "승인 하시겠습니까?"
	, CI00004 : "신규 입력 상태입니다. 자료를 입력해 주십시오."
	, CI00005 : "처리 하시겠습니까?"	
	, CI00011 : "화면을 초기화했습니다."
	, CI00012 : "수강신청 완료했습니다."
	, CI00013 : "조회를 완료했습니다."
	, CI00014 : "조회를 완료했습니다.[조회건수 : ${}]"
	, CI00015 :	"처리를 완료했습니다."
	, CI00016 :	"삭제를 완료했습니다."	
	, CI00017 :	"로그인을 완료했습니다."	
	, CI00018 :	"로그인 중입니다. 잠시만 기다려 주세요."	
	, CW00001 : "[${}] 값을 입력하여 주십시오."
	, CW00002 : "값을 입력하여 주십시오."
	, CW00003 : "해당 데이터가 존재하지 않습니다."
	, CW00004 : "주민등록번호 앞자리는 숫자 6자리로 입력해야 합니다.\n 확인하여 주십시오."
	, CW00005 : "주민등록번호 뒷자리는 숫자 7자리로 입력해야 합니다.\n 확인하여 주십시오."
	, CW00006 : "[${}] 값은 ${} 자리 이상으로 입력하여 주십시오."
	, CW00007 :	"수강신청을 100회 이상 처리하셨습니다. 재로그인 후에 다시 처리해 주십시오."
};

/**
 * 주어진 메시지 아이디에 해당하는 메시지를 가져온다.<p>
 * @param messageId
 */
fsp_message.prototype.getMessage = function(messageId, arr) {
	var msg = fsp_message.messageInfo[messageId];
	if( !msg ) {
		return messageId;
	}
	
	if( !arr ) {
		return msg;
	}
	//  ${} 포함 문자열 대체
	var oMsg = msg;
	var cnt = 0;
	var p = -1;
	var rMsg = "";
	while(true) {
		p = oMsg.indexOf("${}");
		if ( p == -1 ) {
			break;
		}
		rMsg = rMsg + oMsg.substr(0, p);
		if ( arr.constructor == Array) {
			rMsg = rMsg + arr[cnt];
		} else {
			rMsg = rMsg + arr;
		}
		
		oMsg = oMsg.substr(p+3);
		cnt++;
	}

	rMsg = rMsg + oMsg;
	return rMsg;	
};

/**
 * fsp 객체에 추가한다.<p>
 */
fsp.addConstructor(function() {
    if (typeof fsp.message === "undefined") {
        fsp.message = new fsp_message();
    }
});
