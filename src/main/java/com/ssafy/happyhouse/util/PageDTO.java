package com.ssafy.happyhouse.util;

import java.util.Arrays;

public class PageDTO {
	private int pg;
	private String key;
	private String word;
	private String[] types;
	
	public PageDTO() {
		super();
	}
	
	public PageDTO(int pg, String key, String word, String[] types) {
		super();
		this.pg = pg;
		this.key = key;
		this.word = word;
		this.types = types;
	}

	public int getPg() {
		return pg;
	}
	public void setPg(int pg) {
		this.pg = pg;
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
	public void setTypes(String[] types) {
		this.types = types;
	}
	@Override
	public String toString() {
		return "PageDTO [pg=" + pg + ", key=" + key + ", word=" + word + ", types=" + Arrays.toString(types) + "]";
	}
	
	
}
