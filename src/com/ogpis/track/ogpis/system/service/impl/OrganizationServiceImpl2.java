package com.ogpis.track.ogpis.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.OrganizationDao2;
import com.ogpis.track.ogpis.system.entity.Organization2;
import com.ogpis.track.ogpis.system.entity.User2;
import com.ogpis.track.ogpis.system.service.OrganizationService2;

@Service
public class OrganizationServiceImpl2 extends BaseServiceImpl<Organization2, String> implements OrganizationService2 {

	@Autowired
	protected void setOrganizationDao(OrganizationDao2 organizationDao) {
		setBaseDao(organizationDao);
	}

}
