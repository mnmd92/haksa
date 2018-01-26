<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<style>
html {width:100%; height:100%; margin:0;}
body {margin:0;}

iframe {border:none; }

#topp {width:100%; height:100%;}

#leftt {
	width: 254px;
	float: left;
	
	/* height: 1000px; */
	min-height: 90%;
}

#sugangg {
	width: 100%;
	margin-right: -254px;
}

</style>

</head>
<body>
	<div id="topp">
		<iframe src="top2.jsp" style="width:100%; height:84px" scrolling="no">
		</iframe>
	</div>

	<div id="leftt" style="height:100%">
		<iframe src="left2.jsp" width="254px" height="100%" scrolling="no">
		</iframe>
	</div>
	
	<div id="sugangg">
		<iframe src="sugang2.jsp"> 
		</iframe>
	</div>

</body>
</html>