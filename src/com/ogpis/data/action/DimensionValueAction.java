package com.ogpis.data.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ogpis.base.action.BaseAction;
import com.ogpis.data.entity.DimensionValue;
import com.ogpis.data.service.DimensionValueService;

@Controller
public class DimensionValueAction extends BaseAction{
	@Autowired
	private DimensionValueService dimensionValueService;
	@RequestMapping(value = "/dimensionValue/getByDimensionId")
	public void getByDimensionId(String dimensionId,HttpServletResponse response) {
		System.out.println(dimensionId);
		List<DimensionValue> list=dimensionValueService.getByDimensionId(dimensionId);
		System.out.println("++++++++++++"+list.size());
		String[] filters=new String[]{"modifiedTime","createTime","orderdDimensionValue"};
		JSONArray array = JSONArray.fromObject(list, getJsonConfig(filters));
		responseJson(response, array.toString());
	}
}
