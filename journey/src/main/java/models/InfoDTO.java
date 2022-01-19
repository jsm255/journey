package models;

public class InfoDTO {
	private String countryName,basic;
	
	public InfoDTO() {}	
	
	public InfoDTO(String countryName, String basic) {
		this.countryName = countryName;
		this.basic = basic;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getBasic() {
		return basic;
	}

	public void setBasic(String basic) {
		this.basic = basic;
	}
	
	
}
