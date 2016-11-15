package com.ogpis.demo.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DemoAction {

	@RequestMapping(value = "/demo")
	public String demo(HttpServletRequest request, ModelMap model) {
		System.out.println("demo/demo");
		return "demo/demo";
	}
}
