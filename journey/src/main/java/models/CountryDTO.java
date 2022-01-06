package models;

public class CountryDTO {
	
	private int code;
	private String countryName;
	private double score;
	
	public CountryDTO(String countryName, double score) {
		this.countryName = countryName;
		this.score = score;
	}
	
	public CountryDTO(int code, String countryName, double score) {
		this.code = code;
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

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}
}
