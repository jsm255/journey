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
			
			pstmt = conn.prepareStatement("select* from blog order by `date` desc");
			
			rs = pstmt.executeQuery();
			
			blogs = new ArrayList<>();
			
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
					
					StringTokenizer st = new StringTokenizer(imageTemp, "?");
					int size = Integer.parseInt(st.nextToken());
					for(int i = 0; i<size; i++) {
						String path = "blogImages/";
						String temp = st.nextToken();
						images.add(path + temp);
					}
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
					
					StringTokenizer st = new StringTokenizer(imageTemp, "?");
					int size = Integer.parseInt(st.nextToken());
					for(int i = 0; i<size; i++) {
						String path = "blogImages/";
						String temp = st.nextToken();
						images.add(path + temp);
					}
					blog = new BlogDTO(code, countryName, id, title, content, score, images, date, userCode);
				}
				
				return blog;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public boolean writeBlog(BlogDTO blog) {
		try {
			
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("insert blog(countryName, id, title, content, score, images, userCode) value(?,?,?,?,?,?,?)");
			pstmt.setString(1, blog.getCountryName());
			pstmt.setString(2, blog.getId());
			pstmt.setString(3, blog.getTitle());
			pstmt.setString(4, blog.getContent());
			pstmt.setInt(5, blog.getScore());
			
			String str = "";
			if(blog.getImages().size() > 0) {
				ArrayList<String> temp = blog.getImages();
				str += temp.size();
				str += "?";				// 구분자
				for(int i = 0; i<temp.size(); i++) {
					str += temp.get(i);
					if(i != temp.size()-1) str += "?";			// 구분자
				}
			}
			else str += "none";
			
			pstmt.setString(6, str);
			pstmt.setInt(7, blog.getUserCode());
			
			pstmt.executeUpdate();
			
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean deleteBlog(BlogDTO blog) {
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("delete from blog where code=?");
			pstmt.setInt(1, blog.getCode());
			
			pstmt.executeUpdate();
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean updateBlog(BlogDTO blog) {
		
		try {
			conn = DBManager.getConnection();
			
			pstmt = conn.prepareStatement("update blog set countryName=?, title=?, content=?, images=?, score=? where code=?");
			pstmt.setString(1, blog.getCountryName());
			pstmt.setString(2, blog.getTitle());
			pstmt.setString(3, blog.getContent());
			String str = "";
			if(blog.getImages().size() > 0) {
				ArrayList<String> temp = blog.getImages();
				str += temp.size();
				str += "?";				// 구분자
				for(int i = 0; i<temp.size(); i++) {
					str += temp.get(i);
					if(i != temp.size()-1) str += "?";			// 구분자
				}
			}
			else str += "none";
			pstmt.setString(4, str);
			pstmt.setInt(5, blog.getScore());
			pstmt.setInt(6, blog.getCode());
			
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}
