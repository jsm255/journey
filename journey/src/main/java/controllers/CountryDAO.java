package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import models.CountryDTO;
import utils.DBManagerJo;

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
			conn = DBManagerJo.getConnection();
			
			pstmt = conn.prepareStatement("select* from country");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int code = rs.getInt(1);
				String flag = rs.getString(2);
				String countryName = rs.getString(3);
				String score = rs.getString(4);
				
				CountryDTO country = new CountryDTO(code, flag, countryName, score);
				
				countries.add(country);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countries;
	}
	
	public CountryDTO getCountry(String countryName) {
		countries = getCountries();
		
		for(CountryDTO temp : countries) {
			if(temp.getCountryName().equals(countryName)) return temp;
		}
		
		return null;
	}
	
}
