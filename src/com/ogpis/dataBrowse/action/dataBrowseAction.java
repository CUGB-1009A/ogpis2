package com.ogpis.dataBrowse.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.data.service.DataSourceService;

@Controller
public class dataBrowseAction {
	
	@Autowired
	private DataSourceService dataSourceService ;
	
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
	
	@RequestMapping(value = "/getTabDimension")
	public void getTabDimension(HttpServletRequest request, HttpServletResponse response ,ModelMap model) throws IOException {
		
	}
}