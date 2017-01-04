package com.ogpis.track.ogpis.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.system.dao.OrganizationDao2;
import com.ogpis.track.ogpis.system.entity.Organization2;

@Repository
public class OrganizationDaoImpl2 extends BaseDaoImpl<Organization2, String>
		implements OrganizationDao2 {

	@Override
	protected Class<Organization2> getEntityClass() {
		return Organization2.class;
	}
}
