<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>

</head>
<body>

<strong id="st_daehak">&nbsp;&nbsp;대학</strong>   
	<select name="select" class="input" id="cb_daehak" title="대학">
		<option id="opt"></option>
	</select>

<%-- 
<span id="hakgwa" style="display:inline-block;">
	<strong id="st_hakgwa">&nbsp;&nbsp;학과</strong>  
	<select name="select" class="input" id="cb_hakgwa" title="학과">
		<%
	String hakgwa = request.getParameter("x");
	List<String> hakgwaList = mjdao.hakgwaList(hakgwa);
	
	for(int i=0; i<hakgwaList.size(); i++) {
	%>
		<option><%= hakgwaList.get(i)%></option>
	<%
	}
	%>
	
				 
	</select>
</span>
  --%>     	
</body>
<script type="text/javascript">
$('#cb_daehak').on('click', function(){
	$.ajax({
		url: "../js/data.json",
		dataType: "json",
		success: function(data) {
			console.log(data[0].DAEHAK);
			console.log(data.length);
			var result = [];
			 
			 
			for(var i=0;i<data.length;i++){
				console.log("1::::"+data[i].DAEHAK);
				if($.inArray(data[i].DAEHAK, result))
					console.log("2::::"+data[i].DAEHAK);
					result.push(data[i].DAEHAK);	
			}
			console.log("111");
			console.log(result);
			console.log("222");
			
			//$("#opt").text(result[8].DAEHAK);
		}
	});
});

</script>
</html>