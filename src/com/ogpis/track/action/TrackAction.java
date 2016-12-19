package com.ogpis.track.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
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
	public String index(HttpServletRequest request, ModelMap model) {
		return "track/planTrack";
	}
	
	@RequestMapping(value = "/index1")
	public String index1(HttpServletRequest request, ModelMap model) {
		return "track/planTrack1";
	}
	
	@RequestMapping(value = "/index0")
	public String index0(HttpServletRequest request, ModelMap model) {
		return "track/planTrack0";
	}
	
	@RequestMapping(value = "/DataSource")
	public String DataSource(HttpServletRequest request, ModelMap model) {
		return "track/DataSource";
	}

	@ResponseBody
	@RequestMapping(value = "/json")
	public void demo1(HttpServletRequest request, HttpServletResponse response,
			ModelMap model) throws JSONException, IOException {
		System.out.println("track");
		String xml = TempTools.loadFile();
		JSONObject json = TempTools.parseXml(xml);
		System.out.println(json.toString());
		response.setContentType("json/application;charset=utf-8");
		response.getWriter().write(json.getJSONObject("Root").getJSONArray("Record").toString());
		/* return json.getJSONObject("Root").toString(); */
	}

	@ResponseBody
	@RequestMapping(value = "/xml")
	public String demo2(HttpServletRequest request, ModelMap model) {
		System.out.println("track");
		String xml = TempTools.loadFile();
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