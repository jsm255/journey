package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import models.ReReviewDTO;
import utils.DBManagerJo;

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
			conn = DBManagerJo.getConnection();
			
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
}
