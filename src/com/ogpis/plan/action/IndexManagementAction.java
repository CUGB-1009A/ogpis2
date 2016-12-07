package com.ogpis.plan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.PlanType;
import com.ogpis.plan.service.IndexManagementService;

@Controller
@RequestMapping("/index")
public class IndexManagementAction {
	@Autowired
	IndexManagementService indexManagementService;

	@RequestMapping(value = "/list")
	public String demo(HttpServletRequest request, ModelMap model) {
		
		//String type=request.getParameter("type");
		String type="QG";
		List<IndexManagement> indexList = indexManagementService.findAllIndexByPriority(type);
		model.addAttribute("planType", PlanType.values());
		model.addAttribute("indexList", indexList);
		model.addAttribute("type", type);
		System.out.println("index/list");
		return "plan/index/list";
	}
}
