package controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



import models.UserDTO;
import utils.DBManager;


public class UserDAO {
	
//	// 싱글톤 패턴으로 만들기
	private UserDAO() {};
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
//	
//	// 데이터 연동준비
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private ArrayList<UserDTO> users = null;
	
	// 연동된 DB에서 데이터 불러오기
	public ArrayList<UserDTO> getUsers(){
		users = new ArrayList<>();
		
		try {
			 conn = DBManager.getConnection();
			 String sql = "select * from users";
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			
			 while(rs.next()) {
				 int code = rs.getInt(1);
				 String id = rs.getString(2);
				 String pw = rs.getString(3);
				 String name = rs.getString(4);
				 String tel = rs.getString(5);
				 
				 UserDTO user = new UserDTO(code,id,pw,name,tel);
				 users.add(user);
			 }
			 
			 System.out.println("complete");
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	public UserDTO insertUser(UserDTO dto) {
		String sql = "insert into users(id,pw,username,tel) values(?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
	
		
		try {
			conn = DBManager.getConnection();
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
	
	
	public UserDTO searchUser (String joinId) {
		users = getUsers();
		
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getJoinId().equals(joinId)) {
				return users.get(i);
			}
		}
		return null;
	}
	
	public String setUserPw(String joinId, String joinPw, String setPw) {
		
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getJoinId().equals(joinId) && users.get(i).getJoinPw().equals(joinPw)) {
				users.get(i).setJoinPw(setPw);
				return users.get(i).getJoinPw();
			}
		}
		return null;
	}
	
	public String setUserName(String joinId, String joinPw, String setUserName) {
		
		for (int i = 0; i < users.size(); i++) {
			if (users.get(i).getJoinId().equals(joinId) && users.get(i).getJoinPw().equals(joinPw)) {
				users.get(i).setUserName(setUserName);
				return users.get(i).getUserName();
			}
		}
		return null;
	}
	
	// addUser
//	public void addUser(UserDTO user) {
//		if(checkDup(user.getJoinId())) {
//			try {
//				conn = DBManager.getConnection();
//				
//				String sql = "insert into users(id,pw,username,tel) values(?,?,?,?)";
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setString(1,user.getJoinId());
//				pstmt.setString(2, user.getJoinPw());
//				pstmt.setString(3, user.getUserName());
//				pstmt.setString(4, user.getTel());
//				
//				pstmt.executeUpdate();
//				
//				System.out.println("회원가입 성공");
//				
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//	}
	
	// 중복아이디 check
	
	public boolean checkDup(String id) {
		ArrayList<UserDTO> users = getUsers();
		
		for(UserDTO u : users) {
			if(id.equals(u.getJoinId())) {
				return false;
			}
		}
		
		return true;
	}

	
}
