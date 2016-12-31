package com.ogpis.data.dao;

import com.ogpis.base.common.page.Pagination;

public interface DataSourceDao {

	Pagination getAllDataSource(int cpn, Integer pageSize);

}
