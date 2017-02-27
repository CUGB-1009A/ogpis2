package com.ogpis.track.dao;

import java.util.List;

import com.ogpis.track.entity.Target;

import net.sf.json.JSONObject;

public interface TargetDao {

	List<Target> find(JSONObject params);

}
