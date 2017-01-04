package com.ogpis.track.ogpis.international.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.dao.IndexManagementDao2;
import com.ogpis.track.ogpis.international.dao.InternationalDao2;
import com.ogpis.track.ogpis.international.entity.International2;
import com.ogpis.track.ogpis.international.service.InternationalService2;

@Service
public class InternationalServiceImpl2 extends BaseServiceImpl<International2,String>
implements InternationalService2{
	
	@Autowired
	protected void setInternationalDao(InternationalDao2 international) {
		setBaseDao(international);
	}

	protected InternationalDao2 getInternationaltDao() {
		return (InternationalDao2) this.baseDao;
	}


	@Override
	public International2 findByCompanyName(String companyName) {
		// TODO Auto-generated method stub
		return getInternationaltDao().findByCompanyName(companyName);
	}
	

}
