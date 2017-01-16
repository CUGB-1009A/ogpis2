package com.ogpis.data.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ogpis.base.action.BaseAction;
import com.ogpis.forecast.HistoryData;
import com.ogpis.track.webservice.data.DataService;

@Controller
public class DataCacheAction extends BaseAction{
	@Autowired
	private DataService dataService ;
	
	@RequestMapping(value = "/dataCache/list")
	public String dataMaintain(HttpServletRequest request, ModelMap model) {
		String historyData = HistoryData.historyData;
		model.addAttribute("historyData",historyData);
		return "data/dataCache";
	}
	
	@RequestMapping(value = "/getDataBySql")
	public void getDataBySql(HttpServletRequest request, HttpServletResponse response ,ModelMap model) throws IOException {
		String sql = URLDecoder.decode(request.getParameter("sql"), "UTF-8");
		System.out.println(sql);
		String result = dataService.getData(sql);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(result);
	    response.getWriter().write(result);
		
	}

}
