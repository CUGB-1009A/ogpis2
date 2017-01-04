package com.ogpis.track.ogpis.international.dao;

import com.ogpis.track.ogpis.base.dao.BaseDao;
//import com.ogpis.track.ogpis.base.BaseDao;
import com.ogpis.track.ogpis.international.entity.International2;

public interface InternationalDao2 extends BaseDao<International2,String>{

	International2 findByCompanyName(String companyName);

}
