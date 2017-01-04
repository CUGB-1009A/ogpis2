package com.ogpis.track.ogpis.system.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.track.ogpis.base.action.BaseAction;
import com.ogpis.track.ogpis.document.entity.PlanDocument;
import com.ogpis.track.ogpis.plan.entity.Plan;
import com.ogpis.track.ogpis.system.entity.User;
import com.ogpis.track.ogpis.system.service.MenuItemService;
import com.ogpis.track.ogpis.system.service.UserService;

@Controller
public class WelcomeAction extends BaseAction {
	
	@Autowired 
	MenuItemService menuItemService;
	@Autowired
	UserService userService;
	

	@RequestMapping(value = "/main_center", method = RequestMethod.GET)
	public String main_center() {
		System.out.println("main_center");

		return "main/main_center";
	}

	@RequestMapping(value = "/main_header", method = RequestMethod.GET)
	public String main_left() {
		System.out.println("main_header");

		return "main/main_header";
	}
	
	@RequestMapping(value = "/main_nav", method = RequestMethod.GET)
	public String main_nav() {
		System.out.println("main_nav");

		return "main/main_nav";
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main(HttpServletResponse resppose,HttpServletRequest request,ModelMap model) {
		super.addMenuParams(request, model);
		LinkedHashMap map ;
		List<LinkedHashMap> mapList = new ArrayList<LinkedHashMap>();
		String currentUserName = request.getUserPrincipal().getName();
	  	User user = userService.findByUserName(currentUserName);	
	  	Set<Plan> planConcern = user.getPlans();
	  	model.addAttribute("plansNumber",planConcern.size());
	  	for(Plan temp:planConcern)
		{
			map = new LinkedHashMap();
			map.put("plan",temp);
			map.put("isconcerned",true);
			mapList.add(map);
		}
		model.addAttribute("mapList", mapList);//返回规划
		model.addAttribute("listType","concern");
		return "plan/user/list";
	}

	/**
	 * 准备导航栏数据：json格式
	 * @param resp
	 * @throws IOException
	 */
	@RequestMapping(value = "/menuPrepared", method = RequestMethod.POST)
	@ResponseBody
	public void menuPrepared(HttpServletResponse resp) throws IOException {
		String menuToJson = menuItemService.menuToJson();
		resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(menuToJson);		
	}	
}
