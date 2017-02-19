package com.ogpis.track.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.track.service.LayoutService;
import com.ogpis.track.service.TargetService;

@Controller
@RequestMapping(value = "/space")
public class OliGasSpaceAction {
	@Autowired
	private TargetService targetService;
	@Autowired
	private LayoutService layoutService;
	
	@ResponseBody
	@RequestMapping(value = "/target")
	public void target(String json, HttpServletResponse response) {
		String result = targetService.find(json);
		responseJson(result, response);
	}

	@ResponseBody
	@RequestMapping(value = "/layout")
	public void layout(String json, HttpServletResponse response) {
		String result = layoutService.find(json);
		responseJson(result, response);
	}

	public void responseJson(String result, HttpServletResponse response) {
		response.setContentType("json/application;charset=utf-8");
		try {
			response.getWriter().write(result.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
