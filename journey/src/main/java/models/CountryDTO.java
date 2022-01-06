package models;

public class CountryDTO {
	
	private int code;
	private String flag;
	private String countryName;
	private String score;
	
	public CountryDTO(String countryName, String flag, String score) {
		this.countryName = countryName;
		this.flag = flag;
		this.score = score;
	}
	
	public CountryDTO(int code, String countryName, String flag, String score) {
		this.code = code;
		this.countryName = countryName;
		this.flag = flag;
		this.score = score;
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
}
