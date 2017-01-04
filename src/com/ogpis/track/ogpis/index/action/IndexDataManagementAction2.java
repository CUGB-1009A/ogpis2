package com.ogpis.track.ogpis.index.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.track.ogpis.base.action.BaseAction;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement2;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.index.service.IndexDataManagementService2;
import com.ogpis.track.ogpis.index.service.IndexManagementService2;

@Controller
public class IndexDataManagementAction2 extends BaseAction{
	
	@Autowired
	private IndexDataManagementService2 indexDataManagementService;
	
	@Autowired
	private IndexManagementService2 indexManagementService;
	
	//只显示一个指标项(通过id判断显示哪个)，通过下来列表来选择显示哪个指标项
	@RequestMapping(value = "/indexData2/list")
	public String list(HttpServletRequest request, ModelMap model,String id,String type){
		super.addMenuParams(request, model);
		List<IndexManagement2> indexList = indexManagementService.findAllIndexByPriority(type);
		if(indexList.size()==0)
			{
			model.addAttribute("id",id);
			model.addAttribute("type",type);
			return "indexData/list";
			}
		List<IndexDataManagement2> indexDataList ;
		if(id.equals("0"))
			 {
				indexDataList = indexList.get(0).getOrderedIndexData();
				id = indexList.get(0).getId();
			 }
		else
			indexDataList = indexManagementService.findById(id).getOrderedIndexData();
		model.addAttribute("id",id);
		model.addAttribute("type",type);
		model.addAttribute("indexDataList",indexDataList);
		model.addAttribute("indexList",indexList);
		return "indexData/list";		
	}
	
	@RequestMapping(value = "/indexData2/save")
	public void save(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws IOException{
		String id = request.getParameter("id");
		String value = request.getParameter("value");
		IndexDataManagement2 indexData = indexDataManagementService.findById(id);
		indexData.setFinishedWorkload(Float.parseFloat(value));
		indexDataManagementService.update(indexData);
		String result = "{\"result\":\"success\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);
	}
	
	@RequestMapping(value = "/indexData2/delete")
	public void delete(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws IOException{
		String id = request.getParameter("id");
		indexDataManagementService.delete(id);
		String result = "{\"result\":\"success\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);
	}
	
	@RequestMapping(value = "/indexData2/addIndexData")
	public void addIndexData(HttpServletRequest request, HttpServletResponse resp,ModelMap model) throws ParseException, IOException{
		String indexId = request.getParameter("id");
		String collectedTime = request.getParameter("collectedTime");
		String finishedWorkload = request.getParameter("finishedWorkload");
		boolean hasThisYearRecord = false ;
		String result = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//先判断该指标是否已经存在该年份的记录
		List<IndexDataManagement2> indexDataAll = indexDataManagementService.findByIndexId(indexId);
		for(IndexDataManagement2 temp : indexDataAll)
		{
			if(temp.getCollectedTime().toString().substring(0, 4).equals(collectedTime.substring(0, 4)))
				hasThisYearRecord = true;
		}
		if(!hasThisYearRecord)
		{
			IndexDataManagement2 indexData = new IndexDataManagement2();
			IndexManagement2 index = indexManagementService.findById(indexId);
			indexData.setCollectedTime(sdf.parse(collectedTime));
			indexData.setFinishedWorkload(Float.parseFloat(finishedWorkload));
			indexData.setIndex(index);
			indexDataManagementService.save(indexData);
			result = "{\"result\":\"success\"}";
		}
		else
			result = "{\"result\":\"failed\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(result);
			
	}
	
	@RequestMapping(value = "/indexData2/add")
	public void add(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws ParseException, IOException {	
		String planId = request.getParameter("planId");
		String type = request.getParameter("type");
		String indexIds = request.getParameter("indexIds");
		String indexValues = request.getParameter("indexValues");
		String collectTime = request.getParameter("collectTime");
		System.out.println(collectTime);
		IndexManagement2 indexManagement ;
		IndexDataManagement2 indexDataManagement = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String[] tempId = indexIds.split(";");
		String[] tempValue = indexValues.split(";");
		System.out.println("总共改了多少个指标记录"+tempId.length);
		for(int i=0;i<tempId.length;i++)
		{
			indexDataManagement = new IndexDataManagement2();
			System.out.println(tempId[i]);
			indexIds = indexIds.substring(indexIds.indexOf(";")+1,indexIds.length());
			indexManagement = indexManagementService.findById(tempId[i]);
			indexDataManagement = new IndexDataManagement2();
			indexDataManagement.setIndex(indexManagement);
			indexDataManagement.setFinishedWorkload(Float.parseFloat(tempValue[i]));
			indexDataManagement.setCollectedTime(sdf.parse(collectTime));
			indexDataManagementService.save(indexDataManagement);
		}
		String success = "{\"planId\":\""+planId+"\",\"flag\":\"4\","+"\"type\":\""+type+"\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(success);	
	}
	
	@RequestMapping(value = "/indexData2/edit")
	public void edit(HttpServletRequest request,HttpServletResponse resp, ModelMap model) throws ParseException, IOException {	
		String planId = request.getParameter("planId");
		String type = request.getParameter("type");
		String indexIds = request.getParameter("indexIds");
		String indexValues = request.getParameter("indexValues");
		IndexDataManagement2 indexDataManagement = null;
		String[] tempId = indexIds.split(";");
		String[] tempValue = indexValues.split(";");
		System.out.println("============="+tempValue.length);
		for(int i=0;i<tempId.length;++i)
		{
			indexDataManagement = indexDataManagementService.findById(tempId[i]);
			indexIds = indexIds.substring(indexIds.indexOf(";")+1,indexIds.length());
			indexDataManagement.setFinishedWorkload(Float.parseFloat(tempValue[i]));
			indexDataManagementService.update(indexDataManagement);
		}

		String success = "{\"planId\":\""+planId+"\",\"flag\":\"4\","+"\"type\":\""+type+"\"}";
		resp.setContentType("application/json");
	    resp.setCharacterEncoding("utf-8");
		resp.getWriter().write(success);	
	}

}
