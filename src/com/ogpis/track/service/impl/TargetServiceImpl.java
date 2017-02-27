package com.ogpis.track.service.impl;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.track.dao.TargetDao;
import com.ogpis.track.entity.Target;
import com.ogpis.track.service.TargetService;

@Service
@Transactional
public class TargetServiceImpl implements TargetService{
	@Autowired
	private TargetDao targetDao;
	@Override
	public String find(String json) {
		// TODO Auto-generated method stub
		JSONObject params=JSONObject.fromObject(json);
		List<Target> result=targetDao.find(params);
		System.out.println(JSONArray.fromObject(result).toString());
		return JSONArray.fromObject(result).toString();
	}

}
