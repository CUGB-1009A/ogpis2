package com.ogpis.data.service;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.DataSource;

public interface DataSourceService {

	Pagination getAllDataSource(int cpn, Integer pageSize);

	DataSource findById(String id);

	List<DataSource> findAll();

}
