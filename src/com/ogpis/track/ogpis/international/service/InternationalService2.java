package com.ogpis.track.ogpis.international.service;

import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.international.entity.International2;

public interface InternationalService2 extends BaseService<International2,String>{

	International2 findByCompanyName(String companyName);

}
