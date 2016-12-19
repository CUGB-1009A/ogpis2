package com.ogpis.plan.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.PlanType;
import com.ogpis.plan.service.IndexManagementService;

@Controller
@RequestMapping("/index")
public class IndexManagementAction {
	@Autowired
	IndexManagementService indexManagementService;

	@RequestMapping(value = "/list")
	public String findAllIndexByPriority(HttpServletRequest request, ModelMap model) {
		
		String type=request.getParameter("type");
		List<IndexManagement> indexList = indexManagementService.findAllIndexByPriority(type);
		model.addAttribute("planType", PlanType.values());
		model.addAttribute("indexList", indexList);
		model.addAttribute("type", type);
		return "plan/index/list";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,ModelMap model){
		String type="QG";
		model.addAttribute("type", type);
		return "plan/index/indexEdit";
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST )
	public String save(HttpServletRequest request,ModelMap model,boolean isAdd,IndexManagement indexManagement){
		IndexManagement bean=null;
		String id=request.getParameter("id");
		if(isAdd){
			bean=new IndexManagement();
			bean.setPlanType(indexManagement.getPlanType());
			bean.setMineType(indexManagement.getMineType());
			bean.setIndexName(indexManagement.getIndexName());
			bean.setIndexType(indexManagement.getIndexType());
			bean.setIndexUnit(indexManagement.getIndexUnit());
			bean.setTrack(indexManagement.getTrack());
			bean.setPriority(indexManagement.getPriority());
			indexManagementService.save(bean);
		}else{
			bean=indexManagementService.findById(id);
			bean.setPlanType(indexManagement.getPlanType());
			bean.setMineType(indexManagement.getMineType());
			bean.setIndexName(indexManagement.getIndexName());
			bean.setIndexType(indexManagement.getIndexType());
			bean.setIndexUnit(indexManagement.getIndexUnit());
			bean.setTrack(indexManagement.getTrack());
			bean.setPriority(indexManagement.getPriority());
			indexManagementService.update(bean);
		}
		model.addAttribute("type",indexManagement.getPlanType());
		return "redirect:/index/list";
	}
	
	@RequestMapping("/edit")
	public String edit(HttpServletRequest request,ModelMap model,String id){
		IndexManagement index=indexManagementService.findById(id);
		model.addAttribute("index",index);
		model.addAttribute("type", index.getPlanType());
		return "plan/index/indexEdit";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request,ModelMap model,String id){
		IndexManagement bean=indexManagementService.findById(id);
		bean.setDeleted(true);
		indexManagementService.update(bean);
		model.addAttribute("type",bean.getPlanType());
		return "redirect:/index/list";
	}
	
}
