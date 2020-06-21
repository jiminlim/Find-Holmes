package com.ssafy.happyhouse.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.dto.UserInfo;
import com.ssafy.happyhouse.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Autowired
	private UserService userService;

	@RequestMapping("/deleteUserInfo")
	private String manDelete(@RequestParam String id , HttpServletRequest request, Model model) throws ServletException, IOException {
		userService.manDelete(id);
		request.getSession().invalidate();
		model.addAttribute("msg", "삭제가 완료되었습니다.");
		return "/index";
	}
	@RequestMapping("/updateUserInfo/{id}")
	private String manUpdate(UserInfo userinfo, Model model, @PathVariable String id,HttpServletRequest request) throws ServletException, IOException {
		userService.manUpdate(userinfo);
		UserInfo user = userService.searchInfo(id);
		request.getSession().setAttribute("user", user);
		model.addAttribute("userinfo",user);
		return "/index";
	}

	
	@ResponseBody
	@RequestMapping(value = "/idcheck", method = RequestMethod.GET)
	private String idcheck(String id) {
		String check;
		try {
			check = userService.idCheck(id);
			
			if(check.equals("yes")) {
				return "ok";
			}else {
				return "no";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "no";
		}
		
	}
	
	
//	@RequestMapping("/idcheck") //중복 체크
//	private String idcheck(Model model, @RequestParam String id_input,HttpServletResponse response) throws IOException {
//		String result = null;
//		JSONObject obj = new JSONObject();
//		try {
//			result = userService.idCheck(id_input);
//			obj.put("idcheckmsg", result);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		PrintWriter out = response.getWriter();
//		out.print(obj.toJSONString());
////		model.addAttribute("idcheckmsg", result); //중복된 아이디가 있습니다
//		return "/user/join.jsp";
//	}
	
	@RequestMapping("/adminUserList")
	public String adminUserList(Model model) throws Exception {
		List<UserInfo> info =  userService.test();
		
		model.addAttribute("userlist", info);
		return "user/adminUserList";
	}
	
	@RequestMapping("/newPwd")
	private String newpwd(HttpServletRequest request, Model model ) throws ServletException, IOException {
		String id = request.getParameter("id");
		String userpwd = request.getParameter("pwd");
		try {
			userService.updatePassword(id, userpwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		return "redirect:/index";
	}

	@RequestMapping("/findPwd")
	private String findPwd(Model model, UserInfo userInfo) throws ServletException, IOException {
		int pwd=0;
		try {
			pwd = userService.findpwd(userInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(pwd == 0) {
			model.addAttribute("msg", "비밀번호가 없습니다.");
		}
		model.addAttribute("id", userInfo.getId());
		model.addAttribute("pwd", pwd);
		
		return "user/findpwd";
	}
	
	@RequestMapping("/join")
	private String join(UserInfo userinfo, Model model) {
		System.out.println("getid   "+userinfo.getId());
		userService.join(userinfo);
		model.addAttribute("msg", "회원가입이 완료되었습니다.");
		return "/user/login";
		
	}
	
	@RequestMapping("/logout")
	private String logout(HttpServletRequest request) throws IOException {
		request.getSession().invalidate();
		return "/index";
	}
	
	@RequestMapping("/login")
	public String login(UserInfo user, Model model,HttpServletRequest request) {
		try {
			user = userService.login(user.getId(), user.getPassword());
			
		} catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
		if(user !=null) {
			request.getSession().setAttribute("user", user);
			model.addAttribute("userinfo",user);
			return "/index";
		}else {
			model.addAttribute("msg","등록된 정보가 없습니다. ");
			return "/user/login";
		}
	}
	//페이지 이동
	@RequestMapping("/moveLoginPage")
	public String moveLoginPage() {
		return "user/login";
	}
	@RequestMapping("/moveJoinPage")
	public String moveJoinPage() {
		return "user/join";
	}
	@RequestMapping("/moveFindPwdPage")
	public String moveFindPwdPage() {
		return "user/findpwd";
	}
	
	@RequestMapping("/ModifyInfo")
	public String ModifyInfo(HttpServletRequest request , Model model) {
		UserInfo userinfo = (UserInfo) request.getSession().getAttribute("user");
		model.addAttribute("userinfo",userinfo);
		return "user/userinfo";
	}
	
	
}
