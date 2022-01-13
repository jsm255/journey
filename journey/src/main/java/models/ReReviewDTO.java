package models;

import java.sql.Timestamp;

public class ReReviewDTO {
	private int code;
	private String userName;
	private String content;
	private Timestamp date;
	private String pw;
	private int attachCode;
	
	public ReReviewDTO(int code, String userName, String content, Timestamp date, int attachCode) {
		this.code = code;
		this.userName = userName;
		this.content = content;
		this.date = date;
		this.attachCode = attachCode;
	}
	
	public ReReviewDTO(int code, String content, Timestamp date, String pw, int attachCode) {
		this.code = code;
		this.userName = "Guest";
		this.content = content;
		this.date = date;
		this.pw = pw;
		this.attachCode = attachCode;
	}
	
	public ReReviewDTO(String userName, String content, int attachCode) {
		this.userName = userName;
		this.content = content;
		this.attachCode = attachCode;
	}
	
	public ReReviewDTO(String content, int attachCode, String pw) {
		this.userName = "Guest";
		this.content = content;
		this.pw = pw;
		this.attachCode = attachCode;
	}
	
	public ReReviewDTO(int code, String userName, String content) {
		this.code = code;
		this.userName = userName;
		this.content = content;
	}
	
	public ReReviewDTO(int code, String userName, String content, String pw) {
		this.code = code;
		this.userName = "Guest";
		this.content = content;
		this.pw = pw;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
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

	public int getAttachCode() {
		return attachCode;
	}
	
	
}
