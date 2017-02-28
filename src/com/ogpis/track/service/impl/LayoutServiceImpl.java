package com.ogpis.track.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.track.dao.LayoutDao;
import com.ogpis.track.entity.Layout;
import com.ogpis.track.service.LayoutService;
import com.ogpis.track.tools.RelationType;
import com.ogpis.track.tools.SafeJson;

@Service
@Transactional
public class LayoutServiceImpl implements LayoutService{
	@Autowired
	private LayoutDao layoutDao;
	@Override
	public String find(String json) {
		// TODO Auto-generated method stub
		List<Layout> result = null;
		SafeJson param=new SafeJson(json);
		String planId=param.getString("id");
		String field=param.getString("field");
		String relation=RelationType.map(param.getString("relation"));
		Object value=param.get("value");
		if(relation==null||relation=="")
			result=layoutDao.findByPlanId(planId);
		else{
			if(relation.equals("like")||relation.equals("not like")){
				value="%"+value+"%";
			}
			
			result=layoutDao.findByCondition(planId,field,relation,value);
		}
		return JSONArray.fromObject(result).toString();
	}
}
