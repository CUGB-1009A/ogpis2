package com.ogpis.dataBrowse.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class dataBrowseAction {
	
	@RequestMapping(value = "/dataBrowse")
	public String dataBrowse(HttpServletRequest request, ModelMap model) {		
		System.out.println("dataBrowse/dataBrowse");
		return "dataBrowse/dataBrowse";
	}
	@RequestMapping(value = "/dataBrowse_zyl_qg")
	public String dataBrowse_zyl_qg(HttpServletRequest request, ModelMap model) {		
		System.out.println("dataBrowse/dataBrowse_zyl_qg");
		return "dataBrowse/dataBrowse_zyl_qg";
	}
	@RequestMapping(value = "/dataBrowse_reserves_company")
	public String dataBrowse_reserves_company(HttpServletRequest request, ModelMap model) {		
		System.out.println("dataBrowse/dataBrowse_reserves_company");
		return "dataBrowse/dataBrowse_reserves_company";
	}
	
	@RequestMapping(value = "/dataBrowse_Tu")
	public String dataBrowse_Tu(HttpServletRequest request, ModelMap model) {
		String id = request.getParameter("id");
		model.addAttribute("id",id);
		System.out.println("历史数据要览测试action");
		return "dataBrowse/dataBrowse_Tu";
	}
}