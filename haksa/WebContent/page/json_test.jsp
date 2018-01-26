<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="org.json.simple.*"%>
<%
response.setContentType("text/html; charset=UTF-8");
%>
<%
	String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String DB_USER = "shin";
	String DB_PASSWORD = "shin";
	String sql = null;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 로딩 성공");
		conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		System.out.println("접속 성공");
		stmt = conn.createStatement();
/* 
		if (request.getParameter("name") != null) {
			request.setCharacterEncoding("UTF-8");
			String name = new String(request.getParameter("name").getBytes("8859_1"), "UTF-8");
			String age = new String(request.getParameter("age").getBytes("8859_1"), "UTF-8");
			sql = String.format(
					"INSERT INTO XMLTEST(NAME, AGE) values('%s', %s)", name, age);
			System.out.print(sql);
			stmt.executeUpdate(sql);
			System.out.println("추가 성공");
		}
 */
		sql = "SELECT * FROM MAJOR";
		rs = stmt.executeQuery(sql);
		JSONArray arr = new JSONArray();
		
		while (rs.next()) {
			String DAEHAK = rs.getString("DAEHAK");
			String HAKGWA = rs.getString("HAKGWA");
			String JEONGONG = rs.getString("JEONGONG");
			JSONObject obj = new JSONObject();
			obj.put("DAEHAK", DAEHAK);
			obj.put("HAKGWA", HAKGWA);
			obj.put("JEONGONG", JEONGONG);
			if (obj != null)
				arr.add(obj);
		}
		FileWriter file = new FileWriter("D:/Git/haksa/WebContent/js/data.json");
		file.write(arr.toJSONString());
		file.flush();
		file.close();
		
	} catch (Exception e) {
		System.out.println("접속 실패");
		e.printStackTrace();
	}
%>


