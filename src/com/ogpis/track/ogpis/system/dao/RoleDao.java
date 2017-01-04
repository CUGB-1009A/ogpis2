package com.ogpis.track.ogpis.system.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.system.entity.Role;

public interface RoleDao extends BaseDao<Role, String> {

	public List<Role> getList();

}
