package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DataCacheDao;
import com.ogpis.data.entity.DataCache;

@Repository
public class DataCacheDaoImpl extends HibernateBaseDao<DataCache, String> implements DataCacheDao{

	@Override
	protected Class<DataCache> getEntityClass() {
		return DataCache.class;
	}

}
