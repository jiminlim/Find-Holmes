package com.ssafy.happyhouse.dto;

public class AreaInfo {
	private String acode;
	private String city;
	private String gu;
	private String dong;
	
	public AreaInfo() {
	}

	public String getAcode() {
		return acode;
	}

	public void setAcode(String acode) {
		this.acode = acode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	@Override
	public String toString() {
		return "AreaInfo [acode=" + acode + ", city=" + city + ", gu=" + gu + ", dong=" + dong + "]";
	}
	
	
	
}
