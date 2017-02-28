package com.ogpis.data.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.data.service.SubjectService;

@Controller
public class InterfaceTableAction extends BaseAction {

	@Autowired
	private InterfaceTableService interfaceTableService;
	@Autowired
	private SubjectService subjectService;

	@RequestMapping(value = "/interfaceList")
	@ResponseBody
	public void dimensionList(@RequestParam("page") Integer pageNumber,
			@RequestParam("rows") Integer pageSize, HttpServletResponse response)
			throws IOException {
		Pagination pagination = interfaceTableService.getAllInterface(
				SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		System.out.println(this.toJsonTableData(pagination, null, true));
		response.getWriter()
				.write(this.toJsonTableData(pagination, null, true));
	}

	@RequestMapping(value = "/interfaceTable/add")
	@ResponseBody
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String interfaceNameCN = request.getParameter("interfaceNameCN");
		String interfaceNameEN = request.getParameter("interfaceNameEN");
		String interfaceDescription = request
				.getParameter("interfaceDescription");
		String subjectIds = request.getParameter("subjectIds");
		String isLocal = request.getParameter("isLocal");
		System.out.println(interfaceNameCN + interfaceNameEN
				+ interfaceDescription + subjectIds + isLocal);
		InterfaceTable interfaceTable = new InterfaceTable();
		interfaceTable.setLocal(isLocal.equals("true"));
		interfaceTable.setName_CN(interfaceNameCN);
		interfaceTable.setName_EN(interfaceNameEN);
		interfaceTable.setDeleted(false);
		interfaceTable.setDescription(interfaceDescription);
		interfaceTableService.save(interfaceTable);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		response.getWriter().write("{\"result\":\"success\"}");
	}

	@RequestMapping(value = "/interfaceTable/getInterfaceBysubject")
	@ResponseBody
	public void getInterfaceBysubject(String id,
			HttpServletRequest request, HttpServletResponse response)
			throws IOException {
			List<InterfaceTable> list=subjectService.findById(id).getInterfaceTables();
			String[] filter=new String[]{"modifiedTime","createTime","dataSource","tableColumns"};
			JSONArray array=JSONArray.fromObject(list,getJsonConfig(filter));
			responseJson(response, array.toString());
	}
	@RequestMapping(value = "/interfaceTable/getColumnsById")
	@ResponseBody
	public void getColumnsById(String interfaceId, HttpServletResponse response)
			throws IOException {
			List<TableColumns> list=interfaceTableService.getColumnsById(interfaceId);
			JSONArray array=JSONArray.fromObject(list,getJsonConfig(null));
			responseJson(response, array.toString());
	}
}
