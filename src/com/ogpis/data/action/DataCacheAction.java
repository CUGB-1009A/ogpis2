package com.ogpis.data.action;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.ogpis.base.action.BaseAction;
import com.ogpis.forecast.HistoryData;

@Controller
public class DataCacheAction extends BaseAction{
	
	@RequestMapping(value = "/dataCache/list")
	public String dataMaintain(HttpServletRequest request, ModelMap model) {
		String historyData = HistoryData.historyData;
		model.addAttribute("historyData",historyData);
		return "data/dataCache";
	}

}
