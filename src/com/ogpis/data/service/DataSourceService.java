package com.ogpis.data.service;

import com.ogpis.base.common.page.Pagination;

public interface DataSourceService {

	Pagination getAllDataSource(int cpn, Integer pageSize);

}
