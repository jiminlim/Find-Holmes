package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.AreaInfo;
import com.ssafy.happyhouse.dto.GreenInfo;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.Location;
import com.ssafy.happyhouse.dto.SidoCodeDTO;
import com.ssafy.happyhouse.service.HouseService;

@Controller
@RequestMapping(value = "/map")
public class MapController {
	
	@Autowired
	private HouseService houseService;
	

	@ResponseBody
	@RequestMapping("/apt")
	public JSONArray apt(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String dong = request.getParameter("dong");
		List<HouseInfo> list = null;
		JSONArray arr = new JSONArray();
		try {
			list = houseService.selectApt(dong);
			for(HouseInfo dto : list) {
				JSONObject obj = new JSONObject();
				obj.put("no", dto.getNo());
				obj.put("dong", dto.getDong());
				obj.put("AptName", dto.getAptName());
				obj.put("code", dto.getCode());
				obj.put("jibun", dto.getJibun());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	
	
	@ResponseBody
	@RequestMapping("/dong")
	public JSONArray dong(HttpServletRequest request) throws IOException {
		String gugun = request.getParameter("gugun");
		List<HouseInfo> list = null;
		JSONArray arr = new JSONArray();
		try {
			list = houseService.selectDong(gugun);
			for(HouseInfo dto : list) {
				JSONObject obj = new JSONObject();
				obj.put("code", dto.getCode());
				obj.put("dong", dto.getDong());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	
	@ResponseBody
	@RequestMapping("/gugun")
	public JSONArray sido(HttpServletRequest request) throws IOException {
		String sido = request.getParameter("sido");
		List<AreaInfo> list = null;
		JSONArray arr = new JSONArray();
		try {
			list = houseService.selectGugun(sido);
			for(AreaInfo dto : list) {
				JSONObject obj = new JSONObject();
				obj.put("gugun_code", dto.getAcode());
				obj.put("gugun_name", dto.getGu());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	
	@ResponseBody
	@RequestMapping("/sido")
	public JSONArray sido() throws IOException {
		List<AreaInfo> list = null;
		JSONArray arr = new JSONArray();
		try {
			list = houseService.selectSido();
			for(AreaInfo dto : list) {
				JSONObject obj = new JSONObject();
				obj.put("sido_code", dto.getAcode());
				obj.put("sido_name", dto.getCity());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	
	@RequestMapping("/moveAptMap")
	public String moveAptInfo() {
		return "apt/map";
	}
	
	@RequestMapping("/moveAptMap2")
	public String moveAptMap2() {
		return "apt/kakaoMap";
	}
	@RequestMapping("/moveEnvi")
	public String moveEnvi() {
		return "envi";
	}
	
	@ResponseBody
	@RequestMapping("/center")
	public JSONObject center(@RequestParam(value = "code") String code) throws IOException {
		Location lo = new Location();
		JSONObject obj = new JSONObject();
		try {
			lo = houseService.findGuCenterLocation(code);
			obj.put("guname", lo.getName());
			obj.put("lat", lo.getLat());
			obj.put("lng", lo.getLng());
		} catch (Exception e) {
			obj.put("message_code", "-1");
			e.printStackTrace();
		} 
		return obj;
	}
	@ResponseBody
	@RequestMapping("/findaddress")
	public JSONObject findaddress(@RequestParam(value = "dong") String dong,
			@RequestParam(value = "jibun") String jibun, 
			@RequestParam(value = "AptName") String AptName) throws IOException {
		AreaInfo lo = new AreaInfo();
		HouseDeal deal = new HouseDeal();
		JSONObject obj = new JSONObject();
		System.out.println("입력데이터"+AptName+" "+dong+" "+jibun);
		try {
			lo = houseService.findaddress(dong);
			obj.put("city", lo.getCity());
			obj.put("gu", lo.getGu());
			obj.put("dong", lo.getDong());
		} catch (Exception e) {
			obj.put("message_code", "-1");
			e.printStackTrace();
		} 
		return obj;
	}
	
	@ResponseBody
	@RequestMapping("/greenbelt")
	public JSONArray greanbelt(@RequestParam(value = "code") String code) throws IOException {
		List<GreenInfo> list = null;
		JSONArray arr = new JSONArray();
		try {
			list = houseService.findGreenList(code);
			for(GreenInfo dto : list) {
				JSONObject obj = new JSONObject();
				obj.put("green_name", dto.getName());
				obj.put("green_lat", dto.getLat());
				obj.put("green_lng", dto.getLng());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	
	@ResponseBody
	@RequestMapping("/aptinfolist")
	public JSONArray aptinfolist(@RequestParam(value = "code") String code) throws IOException {
		List<HouseInfo> list = null;
		JSONArray arr = new JSONArray();
		try {
			list = houseService.selectDong(code);
			for(HouseInfo dto : list) {
				JSONObject obj = new JSONObject();
				obj.put("aptname", dto.getAptName());
				obj.put("lat", dto.getLat());
				obj.put("lng", dto.getLng());
				obj.put("code", dto.getCode());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	@ResponseBody
	@RequestMapping("/sliderRangeList")
	public JSONArray sliderRangeList(@RequestParam(value = "data1") String data1,@RequestParam(value = "data2") String data2) throws IOException {
		List<HouseInfo> list = null;
		Map<String, String> map = new HashMap<>();
		data1 = data1.substring(0, data1.length()-3)+",000";
		data2 = data2.substring(0, data2.length()-3)+",000";
		System.out.println(data1);
        map.put("data1", data1);
        map.put("data2", data2);
		JSONArray arr = new JSONArray();
		try {
			list = houseService.sliderRangeList(map);
			for(HouseInfo dto : list) {
				JSONObject obj = new JSONObject();
				System.out.println(dto);
				obj.put("aptname", dto.getAptName());
				obj.put("lat", dto.getLat());
				obj.put("lng", dto.getLng());
				obj.put("code", dto.getCode());
				arr.add(obj);
			}
		} catch (Exception e) {
			JSONObject obj = new JSONObject();
			obj.put("message_code", "-1");
			arr.add(obj);
			e.printStackTrace();
		} 
		return arr;
	}
	
}
