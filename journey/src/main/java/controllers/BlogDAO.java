package controllers;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.StringTokenizer;

import models.BlogDTO;
import utils.DBManager;

public class BlogDAO {
	
	private ArrayList<BlogDTO> blogs = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	private static BlogDAO instance = new BlogDAO();
	private BlogDAO () {};
	public static BlogDAO getInstance() {
		return instance;
	}
	
	public ArrayList<BlogDTO> getBlogs(){
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select* from blog");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BlogDTO blog;
				
				int code = rs.getInt(1);
				String countryName = rs.getString(2);
				String id = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				int score = rs.getInt(6);
				String imageTemp = rs.getString(7);
				Timestamp date = rs.getTimestamp(8);
				int userCode = rs.getInt(9);
				
				if(imageTemp.equals("none")) {
					ArrayList<String> images = new ArrayList<>();
					blog = new BlogDTO(code, countryName, id, title, content, score, images, date, userCode);
				}
				else {
					ArrayList<String> images = new ArrayList<>();
					
					StringTokenizer st = new StringTokenizer(imageTemp, ",");
					String path = "";
					while((path=st.nextToken()) != null) images.add(path);
					blog = new BlogDTO(code, countryName, id, title, content, score, images, date, userCode);
				}
				
				blogs.add(blog);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return blogs;
	}
	
	public BlogDTO getBlog(int code) {
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("select* from blog where code=?");
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				BlogDTO blog;
				
				int getCode = rs.getInt(1);
				String countryName = rs.getString(2);
				String id = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				int score = rs.getInt(6);
				String imageTemp = rs.getString(7);
				Timestamp date = rs.getTimestamp(8);
				int userCode = rs.getInt(9);
				
				if(imageTemp.equals("none")) {
					ArrayList<String> images = new ArrayList<>();
					blog = new BlogDTO(getCode, countryName, id, title, content, score, images, date, userCode);
				}
				else {
					ArrayList<String> images = new ArrayList<>();
					
					StringTokenizer st = new StringTokenizer(imageTemp, ",");
					String path = "";
					while((path=st.nextToken()) != null) images.add(path);
					blog = new BlogDTO(getCode, countryName, id, title, content, score, images, date, userCode);
				}
				
				return blog;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
