package com.ssafy.happyhouse.dto;

public class StoreInfo {
	String name;
	String service;
	String address;

	public StoreInfo(String name, String service, String address) {
		super();
		this.name = name;
		this.service = service;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "StoreInfo [name=" + name + ", service=" + service + ", address=" + address + "]";
	}

}
