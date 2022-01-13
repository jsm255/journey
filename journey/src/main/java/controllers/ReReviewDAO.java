package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import models.ReReviewDTO;
import models.ReviewDTO;
import utils.DBManager;

public class ReReviewDAO {
	
	private ArrayList<ReReviewDTO> reReviews = new ArrayList<>();
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static ReReviewDAO instance = new ReReviewDAO();
	private ReReviewDAO() {}
	public static ReReviewDAO getInstance() {
		return instance;
	}
	
	public ArrayList<ReReviewDTO> getReReviews(int attachCode) {
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select * from reReview where attachCode=?");
			
			pstmt.setInt(1, attachCode);
			
			rs = pstmt.executeQuery();
			
			reReviews = new ArrayList<>();
			
			while(rs.next()) {
				ReReviewDTO rrview = null;
				
				int code = rs.getInt(1);
				String userName = rs.getString(2);
				String content = rs.getString(3);
				Timestamp date = rs.getTimestamp(4);
				String pw = "";
				int attachCodeTemp = rs.getInt(6);
				if(userName.equals("Guest")) {
					pw = rs.getString(5);
					rrview = new ReReviewDTO(code, content, date, pw, attachCodeTemp);
				}
				else {
					rrview = new ReReviewDTO(code, userName, content, date, attachCodeTemp);
				}
				
				reReviews.add(rrview);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return reReviews;
	}
	
	public ReReviewDTO getReReview(int code) {
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select * from reReview where code=?");
			
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ReReviewDTO rrview = null;
				
				int rrviewCode = rs.getInt(1);
				String userName = rs.getString(2);
				String content = rs.getString(3);
				Timestamp date = rs.getTimestamp(4);
				String pw = "";
				int attachCodeTemp = rs.getInt(6);
				if(userName.equals("Guest")) {
					pw = rs.getString(5);
					rrview = new ReReviewDTO(rrviewCode, content, date, pw, attachCodeTemp);
				}
				else {
					rrview = new ReReviewDTO(rrviewCode, userName, content, date, attachCodeTemp);
				}
				
				return rrview;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean removeReReview(ReReviewDTO rrview) {
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("delete from reReview where code=?");
			
			pstmt.setInt(1, rrview.getCode());
			
			pstmt.executeUpdate();
			
			// 지웠으면 원래 리뷰에 있던 attachCnt도 하나 줄여줘야 한다.
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean removeReReviewsAttached(ReviewDTO review) {
		try {
			int attach = review.getAttachCnt();
			if(attach != 0) {
				conn = DBManager.getConnection();
				
				pstmt = conn.prepareStatement("select * from reReview where attachCode=?");
				
				pstmt.setInt(1, review.getCode());
				
				rs = pstmt.executeQuery();
				
				reReviews = new ArrayList<>();
				
				while(rs.next()) {
					ReReviewDTO rrview = null;
					
					int code = rs.getInt(1);
					String userName = rs.getString(2);
					String content = rs.getString(3);
					Timestamp date = rs.getTimestamp(4);
					String pw = "";
					int attachCodeTemp = rs.getInt(6);
					if(userName.equals("Guest")) {
						pw = rs.getString(5);
						rrview = new ReReviewDTO(code, content, date, pw, attachCodeTemp);
					}
					else {
						rrview = new ReReviewDTO(code, userName, content, date, attachCodeTemp);
					}
					
					reReviews.add(rrview);
				}
				
				for(ReReviewDTO rrview : reReviews) {
					pstmt = conn.prepareStatement("delete from reReview where code=?");
					
					pstmt.setInt(1, rrview.getCode());
					
					pstmt.executeUpdate();
				}
				return true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
}
