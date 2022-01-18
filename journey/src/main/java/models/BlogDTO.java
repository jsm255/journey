package models;

import java.sql.Timestamp;
import java.util.ArrayList;

public class BlogDTO {
	private int code;
	private String countryName;
	private String id;
	private String title;
	private String content;
	private int score;
	private ArrayList<String> images;
	private Timestamp date;
	private int userCode;
	
	// 불러올 때
	public BlogDTO(int code, String countryName, String id, String title, String content, int score, ArrayList<String> images, Timestamp date, int userCode) {
		this.code = code;
		this.countryName = countryName;
		this.id = id;
		this.title = title;
		this.content = content;
		this.score = score;
		this.images = images;
		this.date = date;
		this.userCode = userCode;
	}
	
	// 작성할 때
	public BlogDTO(String countryName, String id, String title, String content, int score, ArrayList<String> images, int userCode) {
		this.countryName = countryName;
		this.id = id;
		this.title = title;
		this.content = content;
		this.score = score;
		this.images = images;
		this.userCode = userCode;
	}
	
	// 수정할 때
	public BlogDTO(String countryName, String title, String content, int score, ArrayList<String> images) {
		this.countryName = countryName;
		this.title = title;
		this.content = content;
		this.score = score;
		this.images = images;
	}

	public int getCode() {
		return code;
	}
	
	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getId() {
		return id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public int getScore() {
		return this.score;
	}
	
	public void setScore(int score) {
		this.score = score;
	}

	public ArrayList<String> getImages() {
		return images;
	}

	public void setImages(ArrayList<String> images) {
		this.images = images;
	}

	public Timestamp getDate() {
		return date;
	}
	
	public int getUserCode() {
		return userCode;
	}
	
}
