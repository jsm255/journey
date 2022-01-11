package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import models.ReviewDTO;
import utils.DBManager;

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
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select * from review where countryName=? order by attachCnt desc");
			pstmt.setString(1, countryName);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				 
				ReviewDTO review = null;
				
				int code = rs.getInt(1);
				String getCountryName = rs.getString(2);
				String userName = rs.getString(3);
				String content = rs.getString(4);
				int score = rs.getInt(5);
				Timestamp date = rs.getTimestamp(6);
				String pw = "";
				int attachCnt = rs.getInt(8);
				if(userName.equals("Guest")) {		// 비 회원 용
					pw = rs.getString(7);
					review = new ReviewDTO(code, getCountryName, content, score, date, pw, attachCnt);
				}
				else {		// 회원 용
					review = new ReviewDTO(code, getCountryName, userName, content, score, date, attachCnt);
				}
				
				reviews.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reviews;
	}	
	
	public boolean writeReview(ReviewDTO review) {
		try {
			conn = DBManager.getConnection();
			
			if(review.getUserName().equals("Guest")) {
				pstmt = conn.prepareStatement("insert review(countryName, content, score, pw) values(?, ?, ?, ?)");
				pstmt.setString(1, review.getCountryName());
				pstmt.setString(2, review.getContent());
				pstmt.setInt(3, review.getScore());
				pstmt.setString(4, review.getPw());
				
				pstmt.executeUpdate();
			}
			else {
				pstmt = conn.prepareStatement("insert review(countryName, userName, content, score) values(?, ?, ?, ?)");
				pstmt.setString(1, review.getCountryName());
				pstmt.setString(2, review.getUserName());
				pstmt.setString(3, review.getContent());
				pstmt.setInt(3, review.getScore());
				
				pstmt.executeUpdate();
			}
			
			System.out.println("처리 완료!");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public ReviewDTO getReview(int code) {
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select * from review where code=?");
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ReviewDTO review = null;
				
				int reviewCode = rs.getInt(1);
				String getCountryName = rs.getString(2);
				String userName = rs.getString(3);
				String content = rs.getString(4);
				int score = rs.getInt(5);
				Timestamp date = rs.getTimestamp(6);
				String pw = "";
				int attachCnt = rs.getInt(8);
				if(userName.equals("Guest")) {		// 비 회원 용
					pw = rs.getString(7);
					review = new ReviewDTO(reviewCode, getCountryName, content, score, date, pw, attachCnt);
				}
				else {		// 회원 용
					review = new ReviewDTO(reviewCode, getCountryName, userName, content, score, date, attachCnt);
				}
				
				return review;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
