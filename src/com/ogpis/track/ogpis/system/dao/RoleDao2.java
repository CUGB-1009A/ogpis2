package com.ogpis.track.ogpis.system.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.system.entity.Role2;

public interface RoleDao2 extends BaseDao<Role2, String> {

	public List<Role2> getList();

}
