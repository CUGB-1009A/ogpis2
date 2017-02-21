package com.ogpis.base.common.util;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	public static void addCookie(HttpServletResponse response, String loginName,String loginNameValue
			,String userRole,String userRoleValue,int maxAge){
		Cookie  loginCookie = new Cookie(loginName, loginNameValue);
		
		Cookie roleCookie=null;
		try {
			roleCookie=new Cookie(userRole, java.net.URLEncoder.encode(userRoleValue, "GBK"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		loginCookie.setPath("/");
		roleCookie.setPath("/");
		if (maxAge>0) {
			loginCookie.setMaxAge(maxAge);
			roleCookie.setMaxAge(maxAge);
		}
		response.addCookie(loginCookie);
		response.addCookie(roleCookie);
	}
	
	public static Cookie getCookieByName(HttpServletRequest request,String name){
		Map<String, Cookie> cookieMap=getCookieMap(request);
		if (cookieMap.containsKey(name)) {
			Cookie cookie=cookieMap.get(name);
			return cookie;
		}else{
			return null;
		}
	}
	
	public static Map<String, Cookie> getCookieMap(HttpServletRequest request) {
		Map<String, Cookie> cookieMap=new HashMap<String, Cookie>();
		Cookie[] cookies=request.getCookies();
		if(null!=cookies){
			for(Cookie cookie:cookies){
				cookieMap.put(cookie.getName(), cookie);
			}
		}
		return cookieMap;
	}
}
