package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Mysql_test {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public Mysql_test() {
		try {
			System.out.println("데이터베이스 접속중...");
			String URL = "jdbc:mysql://localhost:3306:mybatis_example";
			String ID = "root";
			String PW = "root";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, ID, PW);
			System.out.println("데이터베이스 접속완료");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void SELECT() {
		String SQL = "SELECT * FROM Comment";
		try {
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Mysql_test test = new Mysql_test();
		//test.SELECT();
	}
	
}
