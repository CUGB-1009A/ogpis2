package com.ogpis.data.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.DimensionService;

@Controller
public class DimensionAction {
	
	@Autowired
	private DimensionService dimensionService;
	
	@RequestMapping(value = "/haha1")
	public String demo(HttpServletRequest request, ModelMap model) {
		Dimension dimension =  dimensionService.findById("1");
		System.out.println(dimension.getName());
		List<Subject> subjects = dimension.getSubject();
		for(Subject subject : subjects){
			System.out.println(subject.getPriority()+":"+subject.getName());
	
		}
		return "data/test";
	}
}