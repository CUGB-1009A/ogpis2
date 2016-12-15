package com.ogpis.forecast.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.forecast.HistoryData;
import com.ogpis.forecast.entity.DataCollection;
import com.ogpis.forecast.entity.SelfData;
import com.ogpis.forecast.service.DataCollectionService;
import com.ogpis.forecast.service.SelfDataService;

@Controller
public class DataCollectionOperate {
	
	@Autowired 
	private DataCollectionService dataCollectionService;
	@Autowired 
	private SelfDataService selfDataService;
	
	@RequestMapping(value = "/dataShow/dataShow")
	public void dataShow(HttpServletRequest request, ModelMap model,HttpServletResponse response) {
		String id = request.getParameter("id");
		DataCollection dataCollection = dataCollectionService.findById(id);
		StringBuilder result = new StringBuilder();
		if(dataCollection.isOrigin()){
			result.append(HistoryData.historyData);
		}
		else{
			result.append("{\"historyData\":[");
			List<SelfData> selfDataList = dataCollection.getOrderedSelfData();
			for(SelfData temp:selfDataList){
				result.append("{\"year\":"+temp.getYear()+",\"value\":"+temp.getData()+"},");
			}
			result.deleteCharAt(result.length()-1);
			result.append("]}");
			System.out.println(result.toString());
			response.setContentType("application/json");
		    response.setCharacterEncoding("utf-8");
		}    
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/dataShow/dataShare")
	public void dataShare(HttpServletRequest request, ModelMap model , HttpServletResponse response) {
		String id = request.getParameter("id");
		DataCollection dataCollection = dataCollectionService.findById(id);
		dataCollection.setShared(true);
		dataCollectionService.save(dataCollection);
		String result = "{\"dataCollectionId\":\""+dataCollection.getId()+"\",\"dataCollectionName\":\""+dataCollection.getDataCollectionName()+"\"}";
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
		DataCollection dataCollection = dataCollectionService.findById(id);
		dataCollection.setShared(false);
		dataCollectionService.save(dataCollection);
		String result = "{\"dataCollectionId\":\""+dataCollection.getId()+"\",\"dataCollectionName\":\""+dataCollection.getDataCollectionName()+"\"}";
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
		DataCollection dataCollection = dataCollectionService.findById(id);
		List<SelfData> selfDataList = dataCollection.getSelfData();
		selfDataService.delete(selfDataList);
		dataCollectionService.delete(dataCollection);
		String result = "{\"dataCollectionId\":\""+dataCollection.getId()+"\",\"selfDataCollectionName\":\""+dataCollection.getDataCollectionName()+"\"}";
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
