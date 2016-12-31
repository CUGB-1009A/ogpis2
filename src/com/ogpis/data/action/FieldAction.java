package com.ogpis.data.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.data.entity.Field;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.FieldService;
import com.ogpis.data.service.InterfaceTableService;

@Controller
public class FieldAction extends BaseAction {
	
	@Autowired
	private FieldService fieldService;
	@Autowired
	private InterfaceTableService interfaceTableService;
	
	@RequestMapping(value = "/field/getFieldByInterface")
	@ResponseBody
	public void getFieldByInterface(HttpServletRequest request,HttpServletResponse response) throws IOException{
		StringBuilder result = new StringBuilder();
		String id = request.getParameter("id");
		InterfaceTable interfaceTable = interfaceTableService.findById(id);
		List<Field> fields = interfaceTable.getField();
		if(fields.size()==0)
			{
				result.append("{\"status\":\"noField\",\"errInfo\":\"该接口表下没有维度\"}");	
			}
		else
			{
				result.append("{\"status\":\"success\",\"errInfo\":\"成功\",\"fields\":[");
				for(Field temp2 : fields){
						result.append("{\"id\":\""+temp2.getId()+"\",\"name\":\""+temp2.getValue()+"\"},");
				}
				result.deleteCharAt(result.length()-1);
				result.append("]}");
			}

		System.out.println(result.toString());
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(result.toString());
	}
}
