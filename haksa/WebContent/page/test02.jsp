<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����������</title>
</head>
<body>
	<%
		try {
			String driver = "oracle.jdbc.driver.OracleDriver"; //��ҹ��� ���! 
			Class.forName(driver); //Ŭ�������� ����־��ָ� �ڵ����� ��ü�� ������ִ� �Լ�. 
			String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; //sql�� ��Ʈ��ȣ�� SID���� 
			String userName = "shin";
			String passWord = "shin";
			Connection con = DriverManager.getConnection(url, userName,
					passWord);
			Statement st = con.createStatement();
			//DB�� ������ �ֱ�
			String sql = "insert into users values ('201510357', '1111', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf')";
			st.executeUpdate(sql);
			String sql2 = "select * from users"; //��ɹ� �߰��� �� ���� �������� �޸�������Ѵ�! 
			ResultSet rs = st.executeQuery(sql2);
			while (rs.next()) {
				String s = rs.getString("hakbun");
				String s1 = rs.getString("password");
				String s2 = rs.getString("daehak");
				String s3 = rs.getString("hakgwa");
				String s4 = rs.getString("jeongong");
				String s5 = rs.getString("name");
				String s6 = rs.getString("haknyeon");
				String s7 = rs.getString("status");
				String s8 = rs.getString("GIJUNHAKJEOM");
				
				out.write(s + " " + s1 + " " + s3 + " " + s4 + " " + s5 + " " + s6 + " " + s7 + " " + s8 + " " + "<br/>"); //�����͸� ��û�ϴ� Ŭ���̾�Ʈ���� �����ش�. 
			}
			con.close();
			st.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	%>

</body>
</html>