package com.ogpis.system.action;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainAction {

	private static  Logger logger = Logger.getLogger(MainAction.class);
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
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
	
	@RequestMapping(value = "/main/center1", method = RequestMethod.GET)
	public String main_center1() {
		return "main/main_center1";
	}
	
	@RequestMapping(value = "/main/center2", method = RequestMethod.GET)
	public String main_center2() {
		return "main/main_center2";
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
