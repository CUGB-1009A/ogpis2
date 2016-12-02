package com.ogpis.track.action;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSON;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.track.tools.TempTools;

@Controller
@RequestMapping(value = "/track")
public class TrackAction {
	
	@RequestMapping(value = "/index")
	public String index(HttpServletRequest request,ModelMap model){
		return "track/planTrack";
	}
	
	@ResponseBody
	@RequestMapping(value = "/json")
	public String demo1(HttpServletRequest request, ModelMap model) {
		System.out.println("track");
		String xml=TempTools.loadFile();
		JSONObject json=TempTools.parseXml(xml);
		return json.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/xml")
	public String demo2(HttpServletRequest request, ModelMap model) {
		System.out.println("track");
		String xml=TempTools.loadFile();
		return xml;
	}
	
	@ResponseBody
	@RequestMapping(value = "/test")
	public String demo3(HttpServletRequest request, ModelMap model) {
		System.out.println("test");
		model.addAttribute("test", "hhel");
		return "";
	}
}
