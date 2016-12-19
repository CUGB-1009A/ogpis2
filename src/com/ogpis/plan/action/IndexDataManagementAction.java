package com.ogpis.plan.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.plan.entity.IndexDataManagement;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.PlanType;
import com.ogpis.plan.service.IndexDataManagementService;
import com.ogpis.plan.service.IndexManagementService;

@Controller
@RequestMapping("/indexData")
public class IndexDataManagementAction {
	
	@Autowired
	IndexManagementService indexManagementService;
	@Autowired
	IndexDataManagementService indexDataManagementService;
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request,ModelMap model,String id, String type){
		List<IndexManagement> indexList=indexManagementService.findAllIndexByPriority(type);
		if(indexList.size()==0){
			model.addAttribute("id", id);
			model.addAttribute("type", type);
			return "plan/indexData/list";
		}
		List<IndexDataManagement> indexDataList;
		if(id.equals("0")){
			indexDataList=indexList.get(0).getOrderedIndexData();
			id=indexList.get(0).getId();
		}else{
			indexDataList=indexManagementService.findById(id).getOrderedIndexData();
		}
			model.addAttribute("id", id);
			model.addAttribute("type", type);
			model.addAttribute("indexDataList", indexDataList);
			model.addAttribute("indexList", indexList);
			return "plan/indexData/list";			
		
	}
	
	@RequestMapping("/addIndexData")
	public void addIndexData(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws ParseException, IOException{
		String indexId=request.getParameter("id");
		String collectedTime=request.getParameter("collectedTime");
		String finishedWorkload=request.getParameter("finishedWorkload");
		boolean hasThisYearRecord=false;
		String result="";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		//判断该指标是否已经存在该年份的记录
		List<IndexDataManagement> indexDataAll=indexDataManagementService.findByIndexId(indexId);
		for(IndexDataManagement temp:indexDataAll){
			if(temp.getCollectedTime().toString().substring(0,4).equals(collectedTime.substring(0,4)))
				hasThisYearRecord=true;
		}
		if(!hasThisYearRecord){
			IndexDataManagement indexData=new IndexDataManagement();
			IndexManagement index=indexManagementService.findById(indexId);
			indexData.setCollectedTime(sdf.parse(collectedTime));
			indexData.setFinishedWorkload(Float.parseFloat(finishedWorkload));
			indexData.setIndex(index);
			indexDataManagementService.save(indexData);
			result="{\"result\":\"success\"}";
		}else
			result="{\"result\":\"failed\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(result);		
	}
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException{
		String id=request.getParameter("id");
		indexDataManagementService.delete(id);
		String result="{\"result\":\"success\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(result);	
	}
	@RequestMapping("/save")
	public void save(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws IOException{
		String id=request.getParameter("id");
		String value=request.getParameter("value");
		IndexDataManagement indexDataManagement=indexDataManagementService.findOneById(id);
		indexDataManagement.setFinishedWorkload(Float.parseFloat(value));
		indexDataManagementService.update(indexDataManagement);
		String result="{\"result\":\"success\"}";
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(result);	
		
	}
}
