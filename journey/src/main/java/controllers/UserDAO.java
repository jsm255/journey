package controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import models.UserDTO;

public class UserDAO {
	
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
