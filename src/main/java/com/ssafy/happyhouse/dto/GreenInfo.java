package com.ssafy.happyhouse.dto;

public class GreenInfo {
	private String name;
	private String address;
	private String gucode;
	private String dong;
	private String lng;
	private String lat;
	private String bizcode;
	
	public GreenInfo() {
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDongcode() {
		return gucode;
	}
	public void setDongcode(String code) {
		this.gucode = code;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getBizcode() {
		return bizcode;
	}
	public void setBizcode(String bizcode) {
		this.bizcode = bizcode;
	}
	@Override
	public String toString() {
		return "GreenInfo [name=" + name + ", address=" + address + ", code=" + gucode + ", dong=" + dong
				+ ", lng=" + lng + ", lat=" + lat + ", bizcode=" + bizcode + "]";
	}
	



}
