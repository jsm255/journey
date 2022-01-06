package models;

import java.sql.Timestamp;

public class BoardDTO {
	private int code;
	private int countryCode;
	private String userName;
	private String content;
	private int score;
	private Timestamp date;
	private String pw;
	
	// 회원이 쓴 걸 가져올 때
	public BoardDTO(int code, int countryCode, String userName, String content, int score, Timestamp date) {
		this.code = code;
		this.countryCode = countryCode;
		this.userName = userName;
		this.content = content;
		this.score = score;
		this.date = date;
	}
	
	// 게스트가 쓴 걸 가져올 때
	public BoardDTO(int code, int countryCode, String content, int score, Timestamp date, String pw) {
		this.code = code;
		this.countryCode = countryCode;
		this.userName = "Guest";
		this.content = content;
		this.score = score;
		this.date = date;
		this.pw = pw;
	}

	public int getCode() {
		return code;
	}

	public int getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
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
	
	
}
