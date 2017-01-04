package com.ogpis.track.ogpis.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.OrganizationDao;
import com.ogpis.track.ogpis.system.entity.Organization;
import com.ogpis.track.ogpis.system.entity.User;
import com.ogpis.track.ogpis.system.service.OrganizationService;

@Service
public class OrganizationServiceImpl extends BaseServiceImpl<Organization, String> implements OrganizationService {

	@Autowired
	protected void setOrganizationDao(OrganizationDao organizationDao) {
		setBaseDao(organizationDao);
	}

}
