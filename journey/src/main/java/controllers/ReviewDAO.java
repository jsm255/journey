package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import models.ReviewDTO;
import utils.DBManagerJo;

public class ReviewDAO {
	
	private ArrayList<ReviewDTO> reviews = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private static ReviewDAO instance = new ReviewDAO();
	private ReviewDAO () {}
	public static ReviewDAO getInstance() {
		return instance;
	}
	
	public ArrayList<ReviewDTO> getReviews(String countryName){
		reviews = new ArrayList<>();
		
		try {	
			conn = DBManagerJo.getConnection();
			
			pstmt = conn.prepareStatement("select * from review");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				if(rs.getString(2).equals(countryName)) {
					ReviewDTO review = null;
					
					int code = rs.getInt(1);
					String getCountryName = rs.getString(2);
					String userName = rs.getString(3);
					String content = rs.getString(4);
					int score = rs.getInt(5);
					Timestamp date = rs.getTimestamp(6);
					String pw = "";
					if(userName.equals("Guest")) {		// 비 회원 용
						pw = rs.getString(7);
						review = new ReviewDTO(code, getCountryName, content, score, date, pw);
					}
					else {		// 회원 용
						review = new ReviewDTO(code, getCountryName, userName, content, score, date);
					}
					
					reviews.add(review);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reviews;
	}	
	
}
