package haksa.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	private Connection connect() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String username="sugang";
		String password="sugang";
		Connection con=DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public boolean login(String hakbun, String pw) throws ClassNotFoundException, SQLException {
		Connection con=this.connect();
		
		String sql="select * from USERS where HAKBUN=? and PASSWORD=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setString(1, hakbun);
		ps.setString(2, pw);
		
		ResultSet rs=ps.executeQuery();
		boolean result=rs.next();
		
		con.close();
		return result;
	}
	
}
