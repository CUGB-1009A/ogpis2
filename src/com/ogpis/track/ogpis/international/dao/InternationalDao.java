package com.ogpis.track.ogpis.international.dao;

import com.ogpis.track.ogpis.base.dao.BaseDao;
//import com.ogpis.track.ogpis.base.BaseDao;
import com.ogpis.track.ogpis.international.entity.International;

public interface InternationalDao extends BaseDao<International,String>{

	International findByCompanyName(String companyName);

}
