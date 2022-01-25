package models;

public class LikeDTO {
	private int code;
	private String id;
	private String countryName;
	private int cnt;
	
	public LikeDTO(int code, String id, String countryName, int cnt) {
		this.code = code;
		this.id = id;
		this.countryName = countryName;
		this.cnt = cnt;
	}
	
	public LikeDTO(int code,String id, String countryName) {
		this.code =code;
		this.id = id;
		this.countryName = countryName;
		
	}
	
	public LikeDTO(String countryName, int cnt) {
		this.countryName = countryName;
		this.cnt = cnt;
	}

	public int getCode() {
		return code;
	}


	public String getId() {
		return id;
	}


	public String getCountryName() {
		return countryName;
	}
	
	public int getCnt() {
		return cnt;
	}

	
	
}
