package models;

//create table users(
//code integer primary key auto_increment,
//id varchar(10) not null primary key,  -- 사용자 아이디
//pw varchar(10) not null,  -- 사용자 비밀번호
//username varchar(20) not null -- 사용자 이름
//tel varchar(30) not null -- 사용자 전화번호
//);


public class UserDTO {
	private int code;
	private String joinId;
	private String joinPw;
	private String userName;
	private String tel;
	
	

	public UserDTO(int code, String joinId, String joinPw, String userName, String tel) {
		super();
		this.code = code;
		this.joinId = joinId;
		this.joinPw = joinPw;
		this.userName = userName;
		this.tel = tel;
	}

	public UserDTO(String joinId, String joinPw, String userName, String tel) {
		super();
		this.joinId = joinId;
		this.joinPw = joinPw;
		this.userName = userName;
		this.tel = tel;
	}





	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getJoinId() {
		return joinId;
	}



	public void setJoinId(String joinId) {
		this.joinId = joinId;
	}



	public String getJoinPw() {
		return joinPw;
	}



	public void setJoinPw(String joinPw) {
		this.joinPw = joinPw;
	}



	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getTel() {
		return tel;
	}



	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "UserDTO [code=" + code + ", joinId=" + joinId + ", joinPw=" + joinPw + ", userName=" + userName
				+ ", tel=" + tel + "]";
	}
	
}
