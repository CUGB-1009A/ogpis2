package com.ogpis.data.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.data.service.SubjectService;

@Controller
public class InterfaceTableAction extends BaseAction{
	
	@Autowired
	private InterfaceTableService interfaceTableService;
	@Autowired
	private SubjectService subjectService;
	
	@RequestMapping(value = "/interfaceList")
	@ResponseBody
	public void dimensionList(@RequestParam("page") Integer pageNumber,
				@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		Pagination pagination = interfaceTableService.getAllInterface(SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    System.out.println(this.toJsonTableData(pagination, null, true));
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
		}
	
	
	@RequestMapping(value = "/interfaceTable/getInterfaceBysubject")
	@ResponseBody
	public void getInterfaceBysubject(HttpServletRequest request,HttpServletResponse response) throws IOException{
		StringBuilder result = new StringBuilder();
		String id = request.getParameter("id");
		Subject subject = subjectService.findByIds(id).get(0);
		List<InterfaceTable> interfaceTables = subject.getInterfaceTables();
		if(interfaceTables.size()==0)
			result.append("{\"status\":\"noInterfaceTable\",\"errInfo\":\"该主题下没有接口表\"}");	
		else
			{
			List<Field> fields = interfaceTables.get(0).getField();
			if(fields.size()==0)
				{
					result.append("{\"status\":\"noField\",\"errInfo\":\"该接口表下没有维度\",\"interfaceTable\":[");	
					for(InterfaceTable temp1 : interfaceTables){
						result.append("{\"id\":\""+temp1.getId()+"\",\"name\":\""+temp1.getName()+"\"},");
						result.deleteCharAt(result.length()-1);
						result.append("]}");
					}
				}
			else
				{
					result.append("{\"status\":\"success\",\"errInfo\":\"成功\",\"interfaceTable\":[");
					for(InterfaceTable temp1 : interfaceTables){
						result.append("{\"id\":\""+temp1.getId()+"\",\"name\":\""+temp1.getName()+"\"},");
					}
					result.deleteCharAt(result.length()-1);
					result.append("],\"fields\":[");
					for(Field temp2 : fields){
							result.append("{\"id\":\""+temp2.getId()+"\",\"name\":\""+temp2.getValue()+"\"},");
					}
					result.deleteCharAt(result.length()-1);
					result.append("]}");
				}
			}
		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(result.toString());
	}
}
