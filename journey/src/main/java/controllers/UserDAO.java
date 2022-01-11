package controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import models.UserDTO;


public class UserDAO {
	
//	// 싱글톤 패턴으로 만들기
//	private UserDAO() {};
//	private static UserDAO instance = new UserDAO();
//	public static UserDAO getInstance() {
//		return instance;
//	}
//	
//	// 데이터 연동준비
//	private Connection conn = null;
//	private PreparedStatement pstmt = null;
//	private ResultSet rs = null;
//	
//	private ArrayList<UserDTO> users = null;
//	
//	// 연동된 DB에서 데이터 불러오기
//	public ArrayList<UserDTO> getUsers(){
//		users = new ArrayList<>();
//		
//		try {
//			 conn = DBManagerJung.getConnetion();
//			 String sql = "select * from users";
//			 pstmt = conn.prepareStatement(sql);
//			 rs = pstmt.executeQuery();
//			
//			 while(rs.next()) {
//				 int code = rs.getInt(1);
//				 String id = rs.getString(2);
//				 String pw = rs.getString(3);
//				 String name = rs.getString(4);
//				 String tel = rs.getString(5);
//				 
//				 UserDTO user = new UserDTO(code,id,pw,name,tel);
//				 users.add(user);
//			 }
//			 
//			 System.out.println("complete");
//			 
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return users;
//	}
	
	public UserDTO insertUser(UserDTO dto) {
		String sql = "insert into users(joinId, joinPw, UserName, tel) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String url = "jdbc:mysql://localhost:3306/journey";
		String id = "root";
		String pw = "0000";
		
		try {
			conn = DriverManager.getConnection(url, id, pw);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getJoinId());
			pstmt.setString(2, dto.getJoinPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getTel());
			pstmt.executeUpdate();
			
			System.out.println("입력완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}

	
}
