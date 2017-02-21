package com.ogpis.base.common.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	public static void addCookie(HttpServletResponse response, String loginName,String loginNameValue,int maxAge){
		Cookie  cookie = new Cookie(loginName, loginNameValue);
		cookie.setPath("/");
		if (maxAge>0) {
			cookie.setMaxAge(maxAge);
		}
		response.addCookie(cookie);
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
