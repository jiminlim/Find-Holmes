package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.mapping.Environment;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.EnvironmentInfo;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.service.EnviService;

@Controller
@RequestMapping(value = "/envi")
public class EnviController {

	@Autowired
	private EnviService service;
	
	@ResponseBody
	@RequestMapping("/bizcount")
	public JSONArray apt(@RequestParam(value = "dong") String dong) throws IOException {
		JSONArray arr = new JSONArray();
		dong = dong.trim();
		try {
			List<EnvironmentInfo> bizlist = service.bizcount(dong);
			for (EnvironmentInfo envi : bizlist) {
				JSONObject obj = new JSONObject();
				envi.setBizName(bizNameFind(envi.getBizcode()));
				obj.put("bizcode", envi.getBizcode());
				obj.put("bizName", envi.getBizName());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			e.printStackTrace();
			arr.add(obj);
		} 
		return arr;
	}

	
	@ResponseBody
	@RequestMapping("/getAddress")
	public JSONArray getAddress(@RequestParam(value = "dong") String dong,
			@RequestParam(value = "biz") String biz) throws IOException {
		JSONArray arr = new JSONArray();
		dong = dong.trim();
		EnvironmentInfo en = new EnvironmentInfo();
		en.setDong(dong);
		en.setBizcode(biz);
		try {
			List<EnvironmentInfo> bizlist = service.getAddress(en);
			JSONObject obj1 = new JSONObject();
			obj1.put("len", bizlist.size());
			arr.add(obj1);
			for (EnvironmentInfo envi : bizlist) {
				JSONObject obj = new JSONObject();
				obj.put("address", envi.getAddress());
				obj.put("name", envi.getName());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			e.printStackTrace();
			arr.add(obj);
		} 
		return arr;
	}
	private String bizNameFind(String biz) {
		String bizname ="";
		if(biz.equals("21")){
			bizname="대기배출";
		}else if(biz.equals("22")){
			bizname="폐수배출";
		}else if(biz.equals("23")){
			bizname="소음진동";
		}else if(biz.equals("25")){
			bizname="기타수질";
		}else if(biz.equals("28")){
			bizname="악취배출";
		}else if(biz.equals("34")){
			bizname="지정폐기물";
		}else if(biz.equals("35")){
			bizname="폐기물처리";
		}else if(biz.equals("42")){
			bizname="유독물판매";
		}else if(biz.equals("44")){
			bizname="유독물운반";
		}else if(biz.equals("92")){
			bizname="건설폐기물";
		}else {
			bizname="기타";
		}		
		return bizname;
	}
}
