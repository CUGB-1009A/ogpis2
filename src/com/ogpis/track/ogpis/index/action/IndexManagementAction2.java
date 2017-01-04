package com.ogpis.track.ogpis.index.action;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.track.ogpis.base.action.BaseAction;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.index.service.IndexManagementService2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.plan.entity.PlanType2;
import com.ogpis.track.ogpis.plan.service.PlanService2;

@Controller
public class IndexManagementAction2  extends BaseAction {
	
	@Autowired IndexManagementService2 indexManagementService ;
	@Autowired PlanService2 planService ;
	
	@RequestMapping(value="/index2/list")
	public String list(HttpServletRequest request, ModelMap model) {
		String type = request.getParameter("type");
		System.out.println(type);
		List<IndexManagement2> indexList = indexManagementService.findAllIndexByPriority(type);
		model.addAttribute("planType",PlanType2.values());
		model.addAttribute("indexList",indexList);
		model.addAttribute("type",type);
		super.addMenuParams(request, model);
		return "index/list";	
	}
	
	@RequestMapping(value = "/index2/add")
	public String add(HttpServletRequest request, ModelMap model) {	
		String type = request.getParameter("type");
		model.addAttribute("type",type);
		return "index/indexEdit";	
	}
	
	@RequestMapping(value = "/index2/edit")
	public String edit(HttpServletRequest request, ModelMap model,String id) {		
		IndexManagement2 index = indexManagementService.findById(id);
		model.addAttribute("index",index);
		model.addAttribute("type",index.getType());
		return "index/indexEdit";	
	}
	
	@RequestMapping(value = "/index2/back")
	public String back(HttpServletRequest request, ModelMap model,String planId) {		
		Plan2 plan = planService.findById(planId);
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type",plan.getPlanType());
		return "redirect:/plan/show";	
	}
	
	@RequestMapping(value = "/index2/detail")
	public void detail  (HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws IOException {
		String planId = request.getParameter("planId");
		Plan2 plan = planService.findById(planId);
		List<IndexManagement2> indexs =  plan.getIndex();
		String result = "";
		System.out.println(indexs.size());
		if(indexs.size()== 0)
		{
	
			result = "{\"flag\":\"failed\"}";
		}
		else
		{
			result += "{\"planIndex\":[";
			for(IndexManagement2 tempIndex:indexs)
			{
				result += "{\"indexName\":\""+tempIndex.getIndexName()+"\",\"indexType\":\""+tempIndex.getIndexType()+"\",\"indexUnit\":\""+tempIndex.getIndexUnit()+"\",\"indexValue\":\""+tempIndex.getIndexValue()+"\"},";
			}
			result = result.substring(0, result.length()-1);
			result += "]}";
		}
		
		System.out.println(result);
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);			
	}
	
	@RequestMapping(value = "/index2/save" , method = RequestMethod.POST)
	public String save(HttpServletRequest request, ModelMap model,boolean isAdd,IndexManagement2 indexManagement) {		
		IndexManagement2 bean = null;
		String id = request.getParameter("id");
		if(isAdd)
			{
			bean = new IndexManagement2();
			bean.setType(indexManagement.getType());
			bean.setMineType(indexManagement.getMineType());
			bean.setIndexName(indexManagement.getIndexName());
			bean.setIndexType(indexManagement.getIndexType());
			bean.setIndexUnit(indexManagement.getIndexUnit());
			bean.setTrack(indexManagement.isTrack());
			bean.setPriority(indexManagement.getPriority());
			indexManagementService.save(bean);
			}
		else		
			{
			bean = indexManagementService.findById(id);
			bean.setType(indexManagement.getType());
			bean.setMineType(indexManagement.getMineType());
			bean.setIndexName(indexManagement.getIndexName());
			bean.setIndexType(indexManagement.getIndexType());
			bean.setIndexUnit(indexManagement.getIndexUnit());
			bean.setTrack(indexManagement.isTrack());
			bean.setPriority(indexManagement.getPriority());
			indexManagementService.update(bean);
			}
		model.addAttribute("type",indexManagement.getType());
		return "redirect:/index2/list";	
	}
	
	@RequestMapping(value = "/index2/delete")
	public String delete(HttpServletRequest request, ModelMap model,String id) {	
		IndexManagement2 bean = indexManagementService.findById(id);
			bean.setDeleted(true);
			indexManagementService.update(bean);
		model.addAttribute("type",bean.getType());
		return "redirect:/index2/list";
	}
	
	@RequestMapping(value = "/index2/toImportPage")
	public String toImportPage(HttpServletRequest request, ModelMap model,String planId) {		
		Plan2 plan = planService.findById(planId);
		String type = plan.getPlanType();
		List<Plan2> plans = planService.getPlansByType(type);
		model.addAttribute("plans", plans);
		model.addAttribute("planId", planId);
		return "index/importIndex";	
	}
	
	@RequestMapping(value = "/index2/importIndex")
	public String importIndex(HttpServletRequest request, ModelMap model,String planId,String theChosedPlanId) {		
		Plan2 plan = planService.findById(planId);
		Plan2 theChosedPlan = planService.findById(theChosedPlanId);
		IndexManagement2 index ;
		for(IndexManagement2 temp:theChosedPlan.getIndex())
		{
			index = new IndexManagement2();
			index.setIndexName(temp.getIndexName());
			index.setIndexType(temp.getIndexType());
			index.setIndexUnit(temp.getIndexUnit());
			index.setIndexValue(temp.getIndexValue());
			index.setPlan(plan);
			indexManagementService.save(index);
		}
		model.addAttribute("id", planId);
		model.addAttribute("flag", 3);
		model.addAttribute("type",plan.getPlanType());
		return "redirect:/plan/show";	
	}
	
	

}
