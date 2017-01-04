package com.ogpis.track.ogpis.international.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.dao.IndexManagementDao;
import com.ogpis.track.ogpis.international.dao.InternationalDao;
import com.ogpis.track.ogpis.international.entity.International;
import com.ogpis.track.ogpis.international.service.InternationalService;

@Service
public class InternationalServiceImpl extends BaseServiceImpl<International,String>
implements InternationalService{
	
	@Autowired
	protected void setInternationalDao(InternationalDao international) {
		setBaseDao(international);
	}

	protected InternationalDao getInternationaltDao() {
		return (InternationalDao) this.baseDao;
	}


	@Override
	public International findByCompanyName(String companyName) {
		// TODO Auto-generated method stub
		return getInternationaltDao().findByCompanyName(companyName);
	}
	

}
