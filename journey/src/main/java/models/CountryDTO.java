package models;

public class CountryDTO {
	
	private int code;
	private String flag;
	private String countryName;
	private String score;
	
	public CountryDTO(String flag, String countryName, String score) {
		this.flag = flag;
		this.countryName = countryName;
		this.score = score;
	}
	
	public CountryDTO(int code, String flag, String countryName, String score) {
		this.code = code;
		this.flag = flag;
		this.countryName = countryName;
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
