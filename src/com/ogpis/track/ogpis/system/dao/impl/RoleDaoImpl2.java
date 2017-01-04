package com.ogpis.track.ogpis.system.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.system.dao.RoleDao2;
import com.ogpis.track.ogpis.system.entity.Role2;

@Repository
public class RoleDaoImpl2 extends BaseDaoImpl<Role2, String> implements RoleDao2 {

	@Override
	@SuppressWarnings("unchecked")
	public List<Role2> getList() {
		return (List<Role2>) this.queryByHql("from Role where deleted=false order by priority",
				null);
	}

	@Override
	protected Class<Role2> getEntityClass() {
		return Role2.class;
	}
}
