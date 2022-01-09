package models;

import java.sql.Timestamp;

public class ReviewDTO {
	private int code;
	private String countryName;
	private String userName;
	private String content;
	private int score;
	private Timestamp date;
	private String pw;
	private int attachCnt;
	
	// 회원이 쓴 걸 가져올 때
	public ReviewDTO(int code, String countryName, String userName, String content, int score, Timestamp date, int attachCnt) {
		this.code = code;
		this.countryName = countryName;
		this.userName = userName;
		this.content = content;
		this.score = score;
		this.date = date;
		this.attachCnt = attachCnt;
	}
	
	// 게스트가 쓴 걸 가져올 때
	public ReviewDTO(int code, String countryName, String content, int score, Timestamp date, String pw, int attachCnt) {
		this.code = code;
		this.countryName = countryName;
		this.userName = "Guest";
		this.content = content;
		this.score = score;
		this.date = date;
		this.pw = pw;
		this.attachCnt = attachCnt;
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

	public String getUserName() {
		return userName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public int getAttachCnt() {
		return this.attachCnt;
	}
	
	public void setAttachCnt(int attachCnt) {
		this.attachCnt = attachCnt;
	}
	
}
