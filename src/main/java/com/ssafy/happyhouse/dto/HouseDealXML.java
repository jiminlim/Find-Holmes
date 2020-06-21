package com.ssafy.happyhouse.dto;

public class HouseDealXML {

	private int currentPage;
	private int sizePerPage;
	private String key;
	private String word;
	private String[] types;
	
	public HouseDealXML(int currentPage, int sizePerPage, String key, String word, String[] types) {
		super();
		this.currentPage = currentPage;
		this.sizePerPage = sizePerPage;
		this.key = key;
		this.word = word;
		this.types = types;
	}

	public HouseDealXML(String key, String word, String[] types) {
		super();
		this.key = key;
		this.word = word;
		this.types = types;
	}

	public HouseDealXML() {
		super();
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getSizePerPage() {
		return sizePerPage;
	}

	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String[] getTypes() {
		return types;
	}

	public void setTypes(String[] type) {
		this.types = type;
	}
	
	
}
