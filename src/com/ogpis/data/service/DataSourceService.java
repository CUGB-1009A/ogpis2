package com.ogpis.data.service;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.DataSource;

public interface DataSourceService {

	Pagination getAllDataSource(int cpn, Integer pageSize);

	DataSource findById(String id);

}
