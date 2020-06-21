package com.ssafy.happyhouse.dto;

public class PinArea {

	private String code;
	private String si;
	private String gu;
	private String dong;

	public PinArea() {
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getSi() {
		return si;
	}

	public void setSi(String si) {
		this.si = si;
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
		return "PinArea [code=" + code + ", si=" + si + ", gu=" + gu + ", dong=" + dong + "]";
	}
	
	

}
