<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.1.js"></script>
<script>
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

</script>

<title>Insert title here</title>
</head>
<body>
	<button id="id01"> 데이터 요청</button><br/> 
	<button id="id02"> DB로 전송</button><br/>

	
</body>
</html>