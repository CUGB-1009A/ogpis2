package com.ogpis.plan.action;

import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.PlanType;
import com.ogpis.plan.service.IndexManagementService;
import com.ogpis.plan.service.PlanService;

@Controller
@RequestMapping("/plan")
public class PlanAction {
	@Autowired
	IndexManagementService indexManagementService;
	@Autowired
	PlanService planService;

	@RequestMapping(value = "/list")
	public String list(HttpServletRequest request,ModelMap model,String type,String condition){
		model.addAttribute("type", type);
		model.addAttribute("condition", condition);
		model.addAttribute("planType", PlanType.values());
		return "/plan/planAdmin/list";
	}
	
	@RequestMapping("/toEditPage")
	public String toEditPage(HttpServletRequest request,ModelMap model,String type){
		model.addAttribute("planType", PlanType.values());
		model.addAttribute("type", type);
		
		return "/plan/planAdmin/addPlan";
	}
	@RequestMapping("/save")
	public String save(HttpServletRequest request,Boolean isAdd,ModelMap model,String id,Plan plan,String planType,String indexIds){
		Plan bean=null;
		if(isAdd){
			bean=new Plan();
			bean.setPlanType(planType);
			bean.setReleased(false);
		}else{
			bean=planService.findById(id);
		}
		bean.setPlanName(plan.getPlanName());
		bean.setPlanShortDescription(plan.getPlanShortDescription());
		bean.setTargetAndFinished(plan.getTargetAndFinished());
		bean.setOutputDescription(plan.getOutputDescription());
		bean.setStorageDescription(plan.getStorageDescription());
		bean.setStartTime(plan.getStartTime());
		bean.setEndtime(plan.getEndtime());
		bean.setReleasedDate(plan.getReleasedDate());
		bean.setModifiedTime(new Timestamp(System.currentTimeMillis()));
		model.addAttribute("type",planType);
		model.addAttribute("condition","");
		if(isAdd){
			planService.save(bean);
			return "redirect:list";
		}else{
			planService.update(bean);
			model.addAttribute("id", bean.getId());
			model.addAttribute("flag", 1);
			return "redirect:show";
		}
	}
	
}
