package models;

public class CountryDTO {
	
	private int code;
	private String flag;
	private String countryName;
	private String score;
	private String content;
	
	public CountryDTO(String flag, String countryName, String score, String content) {
		this.flag = flag;
		this.countryName = countryName;
		this.score = score;
		this.content = content; 
	}
	
	public CountryDTO(int code, String flag, String countryName, String score, String content) {
		this.code = code;
		this.flag = flag;
		this.countryName = countryName;
		this.score = score;
		this.content = content; 
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
	
	public String getFlag() {
		return flag;
	}
	
	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
}
