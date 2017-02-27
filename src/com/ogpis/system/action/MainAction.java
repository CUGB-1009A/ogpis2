package com.ogpis.system.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.base.common.util.ConstantsUtils;
import com.ogpis.base.common.util.CookieUtils;

@Controller
public class MainAction {

	private static  Logger logger = Logger.getLogger(MainAction.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletRequest request,HttpServletResponse response) {
		
		/**
		 * 获取到前台的基本信息，并添加至Cookie中
		 */
		
		/*
		 * AttributePrincipal principal=(AttributePrincipal)reuqest.getUserPrincipal();
		 * String loginName=principal.getName();
		 * 
		 * */
		String loginName=request.getParameter("username");
		String userRole="管理员";
		//String loginName="admin";
		CookieUtils.addCookie(response, ConstantsUtils.LOGIN_NAME, loginName, 
				ConstantsUtils.USER_TYPE,userRole,36000000);
		
		return "main/main";
	}
	
	@RequestMapping(value = "/main/top", method = RequestMethod.GET)
	public String main_top() {
		return "main/main_top";
	}

	@RequestMapping(value = "/main/center", method = RequestMethod.GET)
	public String main_center() {
		return "main/main_center";
	}

	@RequestMapping(value = "/main/left", method = RequestMethod.GET)
	public String main_left() {
		return "main/main_left";
	}
	

	@RequestMapping(value = "/main/bottom", method = RequestMethod.GET)
	public String main_bottom() {
		return "main/main_bottom";
	}
}
