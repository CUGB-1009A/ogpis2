package com.ogpis.track.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.track.tools.TempTools;

@Controller
@RequestMapping(value = "/track")
public class TrackAction {

	@RequestMapping(value = "/indexTrackContents")
	public String indexTrackContents(HttpServletRequest request, ModelMap model) {
		return "track/indexTrackContents";
	}

	@RequestMapping(value = "/indexTrack")
	public String indexTrack(HttpServletRequest request, ModelMap model) {
		return "track/indexTrack";
	}

	@RequestMapping(value = "/targetTrackContents")
	public String targetTrackContents(HttpServletRequest request, ModelMap model) {
		return "track/targetTrackContents";
	}

	@RequestMapping(value = "/targetTrack")
	public String targetTrack(HttpServletRequest request, ModelMap model) {
		return "track/targetTrack";
	}

	@RequestMapping(value = "/layoutTrackContents")
	public String layoutTrackContents(HttpServletRequest request, ModelMap model) {
		return "track/layoutTrackContents";
	}

	@RequestMapping(value = "/layoutTrack")
	public String layoutTrack(HttpServletRequest request, ModelMap model) {
		return "track/layoutTrack";
	}

	@RequestMapping(value = "/DataSource")
	public String DataSource(HttpServletRequest request, ModelMap model) {
		return "track/DataSource";
	}

	@RequestMapping(value = "/test2")
	public String test2(HttpServletRequest request, ModelMap model) {
		return "track/TestMap";
	}

	@RequestMapping(value = "/plan/list")
	public String list(HttpServletRequest request, ModelMap model) {
		return "track/list_temp";
	}

	@ResponseBody
	@RequestMapping(value = "/json")
	public void demo1(HttpServletRequest request,HttpServletResponse response,
			ModelMap model) throws JSONException, IOException {
		String xml = TempTools.loadFile();
		JSONObject json = TempTools.parseXml(xml);
		System.out.println(json.toString());
		response.setContentType("json/application;charset=utf-8");
		response.getWriter().write(
				json.getJSONObject("Root").getJSONArray("Record").toString());
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
