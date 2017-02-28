package com.ogpis.track.dao;

import java.util.List;

import com.ogpis.track.entity.Layout;

import net.sf.json.JSONObject;

public interface LayoutDao {

	List<Layout> find(JSONObject params);
	List<Layout> findByPlanId(String planId);
	List<Layout> findByCondition(String planId,String field,String relation,Object value);
}
