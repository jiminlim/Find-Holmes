package com.ssafy.happyhouse.dto;

public class EnvironmentInfo {
	private String name;
	private String address;
	private String dongcode;
	private String dong;
	private String bizcode;
	private String bizName;
	
	public String getBizName() {
		return bizName;
	}
	public void setBizName(String bizName) {
		this.bizName = bizName;
	}
	public EnvironmentInfo() {
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
		return dongcode;
	}
	public void setDongcode(String dongcode) {
		this.dongcode = dongcode;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBizcode() {
		return bizcode;
	}
	public void setBizcode(String bizcode) {
		this.bizcode = bizcode;
	}
	@Override
	public String toString() {
		return "EnvironmentInfo [name=" + name + ", address=" + address + ", dongcode=" + dongcode + ", dong=" + dong
				+ ", bizcode=" + bizcode + ", bizName=" + bizName + "]";
	}
	
}
