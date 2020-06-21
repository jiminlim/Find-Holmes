package com.ssafy.happyhouse.dto;

public class Location {
	int no;
	String code;
	String name;
	String name_ENG;
	String lat;
	String lng;

	
	public Location() {
		super();
	}
	
	@Override
	public String toString() {
		return "Location [no=" + no + ", code=" + code + ", name=" + name + ", name_ENG=" + name_ENG + ", lat=" + lat
				+ ", lng=" + lng + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getName_ENG() {
		return name_ENG;
	}
	public void setName_ENG(String name_ENG) {
		this.name_ENG = name_ENG;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	
	
}
