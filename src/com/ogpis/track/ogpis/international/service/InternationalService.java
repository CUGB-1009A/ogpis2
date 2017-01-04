package com.ogpis.track.ogpis.international.service;

import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.international.entity.International;

public interface InternationalService extends BaseService<International,String>{

	International findByCompanyName(String companyName);

}
