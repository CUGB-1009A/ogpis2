package com.ogpis.data.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.data.service.InterfaceTableService;

@Controller
public class InterfaceTableAction extends BaseAction{
	
	@Autowired
	private InterfaceTableService interfaceTableService;
	
	@RequestMapping(value = "/interfaceList")
	@ResponseBody
	public void dimensionList(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		Pagination pagination = interfaceTableService.getAllInterface(SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
		}
}
