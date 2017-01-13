package com.ogpis.data.dao;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.DataSource;

public interface DataSourceDao {

	Pagination getAllDataSource(int cpn, Integer pageSize);

	DataSource findById(String id);

}
