package haksa.major;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MajorDAO {
	private Connection connect() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String username="shin";
		String password="shin";
		Connection con=DriverManager.getConnection(url, username, password);
		
		return con;
	}
	
	public List<String> daehakList() throws ClassNotFoundException, SQLException {
		List<String> daehakList = new ArrayList<>();
		String sql="select distinct daehak from MAJOR";
		PreparedStatement pstm=connect().prepareStatement(sql);
		ResultSet rs=pstm.executeQuery();
		
		while(rs.next()) {
			daehakList.add(rs.getString("daehak"));
		}
		return daehakList;
	}
	
	public List<String> hakgwaList(String daehak) throws ClassNotFoundException, SQLException {
		List<String> hakgwaList = new ArrayList<>();
		String sql="select distinct hakgwa from major where daehak=?";
		
		PreparedStatement pstm=connect().prepareStatement(sql);
		pstm.setString(1, daehak);
		
		ResultSet rs=pstm.executeQuery();
		
		while(rs.next()) {
			hakgwaList.add(rs.getString("hakgwa"));
		}
		return hakgwaList;
	}
}
