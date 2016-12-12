package com.ogpis.forecast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.entity.SelfDataCollection;
import com.ogpis.forecast.service.SelfDataCollectionService;
import com.ogpis.forecast.service.SelfDataService;

@Controller
public class DataCollectionOperate {
	
	@Autowired 
	private SelfDataCollectionService selfDataCollectionService;
	@Autowired 
	private SelfDataService selfDataService;
	
	@RequestMapping(value = "/dataShow/originDataShow")
	public void originDataShow(HttpServletRequest request, ModelMap model) {

	}
	
	@RequestMapping(value = "/dataShow/selfDataShow")
	public void selfDataShow(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		String id = request.getParameter("id");
		StringBuilder result = new StringBuilder();
		result.append("{\"historyData\":[");
		SelfDataCollection selfDataCollection = selfDataCollectionService.findById(id);
		List<SelfData> selfDataList = selfDataCollection.getOrderedSelfData();
		for(SelfData temp:selfDataList){
			result.append("{\"year\":"+temp.getYear()+",\"value\":"+temp.getData()+"},");
		}
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value = "/dataShow/dataShare")
	public void dataShare(HttpServletRequest request, ModelMap model , HttpServletResponse response) {
		String id = request.getParameter("id");
		SelfDataCollection selfDataCollection = selfDataCollectionService.findById(id);
		selfDataCollection.setShared(true);
		selfDataCollectionService.save(selfDataCollection);
		String result = "{\"selfDataCollectionId\":\""+selfDataCollection.getId()+"\",\"selfDataCollectionName\":\""+selfDataCollection.getDataCollectionName()+"\"}";
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/dataShow/dataDisshare")
	public void dataDisshare(HttpServletRequest request, ModelMap model , HttpServletResponse response) {
		String id = request.getParameter("id");
		SelfDataCollection selfDataCollection = selfDataCollectionService.findById(id);
		selfDataCollection.setShared(false);
		selfDataCollectionService.save(selfDataCollection);
		String result = "{\"selfDataCollectionId\":\""+selfDataCollection.getId()+"\",\"selfDataCollectionName\":\""+selfDataCollection.getDataCollectionName()+"\"}";
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping(value = "/dataShow/deleteUnshared")
	public void deleteUnshared(HttpServletRequest request, ModelMap model , HttpServletResponse response) {
		String id = request.getParameter("id");
		SelfDataCollection selfDataCollection = selfDataCollectionService.findById(id);
		List<SelfData> selfDataList = selfDataCollection.getSelfData();
		selfDataService.delete(selfDataList);
		selfDataCollectionService.deleteSelfDataCollection(selfDataCollection);
		String result = "{\"selfDataCollectionId\":\""+selfDataCollection.getId()+"\",\"selfDataCollectionName\":\""+selfDataCollection.getDataCollectionName()+"\"}";
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
