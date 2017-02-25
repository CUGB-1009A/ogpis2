package com.ogpis.data.dao;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.DataSource;

public interface DataSourceDao {

	Pagination getAllDataSource(int cpn, Integer pageSize);

	DataSource findById(String id);

	List<DataSource> findAll();

	String addDataSource(DataSource dataSource);

	List<DataSource> findRealDSBySujectId(String subjectId);

	String updateDataSource(DataSource dataSource);

	List<DataSource> findByIds(String dataSourceIds);

}
