package com.ssafy.happyhouse.util;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.happyhouse.dto.GreenInfo;

public class DongCompare {

	private String dong;
	List<GreenInfo> list;
	List<GreenInfo> result;
	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public void setList(List<GreenInfo> list) {
		this.list = list;
	}

	public List<GreenInfo> getResult() {
		return result;
	}

	public DongCompare() {
		result = new ArrayList<GreenInfo>();
	}
	
	public void compare() {
		for(GreenInfo g : list) {
			String str = g.getDong();
			int len = dong.length();
			if(len != str.length()) continue;
			int i=0;
			for (i = 0; i < len; i++) {
				if(dong.charAt(i)!=str.charAt(i))
					break;
				if(i==2)
					result.add(g);
			}
		}
		
	}
	
}
