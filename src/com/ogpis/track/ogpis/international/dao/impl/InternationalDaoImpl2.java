package com.ogpis.track.ogpis.international.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.international.dao.InternationalDao2;
import com.ogpis.track.ogpis.international.entity.International2;

@Repository
public class InternationalDaoImpl2 extends BaseDaoImpl<International2 , String> implements InternationalDao2 {

	@Override
	protected Class<International2> getEntityClass() {
		return International2.class;
	}

	@Override
	public International2 findByCompanyName(String companyName) {
		String hql = "from International where deleted=false and companyName=?";
		International2 international = (International2) this.findUnique(hql,companyName);
		return international;
	}
}
