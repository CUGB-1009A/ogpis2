package com.ogpis.track.ogpis.system.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.system.dao.DictionaryDao2;
import com.ogpis.track.ogpis.system.entity.Dictionary2;

@Repository
public class DictionaryDaoImpl2 extends BaseDaoImpl<Dictionary2, String>
		implements DictionaryDao2 {

	@Override
	protected Class<Dictionary2> getEntityClass() {
		return Dictionary2.class;
	}

}
