package com.ogpis.data.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.DataSourceDao;
import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Subject;
@Repository
public class DataSourceDaoImpl extends HibernateBaseDao<DataSource, String> implements DataSourceDao{

	@Override
	protected Class<DataSource> getEntityClass() {
		return DataSource.class;
	}

	@Override
	public Pagination getAllDataSource(int cpn, Integer pageSize) {
		Finder f = Finder.create("select bean from DataSource bean where bean.deleted=false");
		return find(f,cpn,pageSize);
	}

	@Override
	public DataSource findById(String id) {
		return super.get(id);
	}

	@Override
	public List<DataSource> findAll() {
		String hql = "From DataSource where deleted=false and parentId is null";
		List<DataSource> dataSources = this.find(hql, null);
		return dataSources;
	}

	@Override
	public String addDataSource(DataSource dataSource) {
		// TODO Auto-generated method stub
		getSession().save(dataSource);
		return "success";
	}

	@Override
	public List<DataSource> findRealDSBySujectId(String subjectId) {
		// TODO Auto-generated method stub
		String hql = "From DataSource where (dimensionName is null or dimensionName='')  and (dimensionValue is null or dimensionValue='') and subject.id=?";
		List<DataSource> dataSources = this.find(hql, subjectId);
		return dataSources;
	}

	@Override
	public String updateDataSource(DataSource dataSource) {
		// TODO Auto-generated method stub
		getSession().update(dataSource);
		return "success";
	}

	@Override
	public List<DataSource> findByIds(String dataSourceIds) {
		// TODO Auto-generated method stub
		String hql = "From DataSource where id in "+dataSourceIds;
		List<DataSource> dataSources = this.find(hql, null);
		return dataSources;
	}
	
}
