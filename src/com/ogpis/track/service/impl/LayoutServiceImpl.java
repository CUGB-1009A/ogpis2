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

@Service
@Transactional
public class LayoutServiceImpl implements LayoutService{
	@Autowired
	private LayoutDao layoutDao;
	@Override
	public String find(String json) {
		// TODO Auto-generated method stub
		JSONObject params=JSONObject.fromObject(json);
		List<Layout> result=layoutDao.find(params);
		return JSONArray.fromObject(result).toString();
	}

}
