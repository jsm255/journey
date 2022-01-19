package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.CountryDTO;
import models.ReviewDTO;
import utils.DBManager;

public class CountryDAO {
	
	private ArrayList<CountryDTO> countries = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static CountryDAO instance = new CountryDAO();
	private CountryDAO () {};
	public static CountryDAO getInstance() {
		return instance;
	}
	
	public ArrayList<CountryDTO> getCountries() {
		countries = new ArrayList<>();
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select* from country");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int code = rs.getInt(1);
				String flag = rs.getString(2);
				String countryName = rs.getString(3);
				String score = rs.getString(4);
				String content = rs.getString(5);
				
				CountryDTO country = new CountryDTO(code, flag, countryName, score, content);
				
				countries.add(country);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countries;
	}
	
	public CountryDTO getCountry(String countryName) {
		setCountryScore(countryName);
		countries = getCountries();
		
		for(CountryDTO temp : countries) {
			if(temp.getCountryName().equals(countryName)) return temp;
		}
		
		return null;
	}
	
	
	private boolean setCountryScore(String countryName) {
		
		Double average = 0.0;
		String score = "0.0";
		
		try {
			
			conn = DBManager.getConnection();
			
			ReviewDAO rDao = ReviewDAO.getInstance();
			ArrayList<ReviewDTO> reviews = rDao.getReviews(countryName);
			
			if(reviews.size() >= 1) {
				for(ReviewDTO temp : reviews) 
					average += temp.getScore();
				
				average /= reviews.size();
				score = String.format("%2.2f", average);
			}
			
			pstmt = conn.prepareStatement("update country set score=? where countryName=?");
			pstmt.setString(1, score);
			pstmt.setString(2, countryName);
			
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
}
