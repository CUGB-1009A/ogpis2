package com.ogpis.plan.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.plan.entity.PlanDocument;
import com.ogpis.plan.service.IndexManagementService;
import com.ogpis.plan.service.PlanDocumentService;
import com.ogpis.plan.service.PlanService;
import com.ogpis.system.service.UserService;

@Controller
@RequestMapping("/document")
public class PlanDocumentAction extends BaseAction {
	@Autowired
	private PlanDocumentService planDocumentService;
	@Autowired
	private PlanService planService;
	@Autowired
	private UserService userService;
	
	private ArrayList idList =new ArrayList();
	
	String pictureType="bmp,jpg,jpeg,png,gif";
	String soundType="mp3,mp4";
	String pdfType="pdf";
	String txtType="txt,bat";
	String officeType="doc,docx,xls,xlsx,ppt,pptx";
	String wordType="doc,docx,wps";
	String pptType="ppt,pptx";
	
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request,ModelMap model){
		/*String selectCondition=request.getParameter("selectCondition");
		String inputValue=request.getParameter("inputValue");
		String selectValue=request.getParameter("selectValue");
		int pageNo=1;
		int pageSize=10;
		Pagination planDocuments=null;
		if(selectCondition.equals("0"))
			planDocuments=planDocumentService.getPlanDocuments(pageNo, pageSize);
		else
			planDocuments=planDocumentService.getDocumentsByPlan(selectCondition, pageNo, pageSize);
		
		model.addAttribute("planDocuments", planDocuments);
		model.addAttribute("inputValue", inputValue);
		model.addAttribute("selectCondition", selectCondition);
		model.addAttribute("selectValue", selectValue);*/
		
		return "plan/document/list";
	}
	
}
