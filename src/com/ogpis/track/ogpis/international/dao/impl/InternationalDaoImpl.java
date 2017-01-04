package com.ogpis.track.ogpis.international.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.international.dao.InternationalDao;
import com.ogpis.track.ogpis.international.entity.International;

@Repository
public class InternationalDaoImpl extends BaseDaoImpl<International , String> implements InternationalDao {

	@Override
	protected Class<International> getEntityClass() {
		return International.class;
	}

	@Override
	public International findByCompanyName(String companyName) {
		String hql = "from International where deleted=false and companyName=?";
		International international = (International) this.findUnique(hql,companyName);
		return international;
	}
}
