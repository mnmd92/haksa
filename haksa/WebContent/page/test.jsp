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
	<!-- 	<option id="opt"></option> -->
	</select>


</body>
<script type="text/javascript">
	$('#cb_daehak').on('click', function() {
		$('#cb_daehak').unbind('click');
		$.ajax({
			url : "../js/data.json",
			dataType : "json",
			success : function(data) {
				console.log(data[0].DAEHAK);
				console.log(data.length);
				var result = [];

				for (var i = 0; i < data.length; i++) {
					if ($.inArray(data[i].DAEHAK, result) == -1)
						result.push(data[i].DAEHAK);
				}
	
				for(var i= 0; i< result.length; i++) {
					$("#cb_daehak").append("<option value=\'" + i + "\'>" + result[i] + "</option>" );
				}
				
			}
		});
	});
</script>
</html>