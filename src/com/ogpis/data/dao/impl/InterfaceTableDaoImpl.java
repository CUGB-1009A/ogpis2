package com.ogpis.data.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.InterfaceTableDao;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.TableColumns;

@Repository
public class InterfaceTableDaoImpl extends HibernateBaseDao<InterfaceTable, String> implements InterfaceTableDao{

	@Override
	protected Class<InterfaceTable> getEntityClass() {
		return InterfaceTable.class;
	}

	@Override
	public Pagination getAllInterface(int cpn, Integer pageSize) {
		Finder f = Finder.create("select bean from InterfaceTable bean where bean.deleted=false");
		return find(f,cpn,pageSize);
	}

	@Override
	public InterfaceTable findById(String id) {
		return super.get(id);
	}

	@Override
	public InterfaceTable save(InterfaceTable interfaceTable) {
		getSession().save(interfaceTable);
		return interfaceTable;
	}

	@Override
	public List<TableColumns> getColumnsById(String interfaceId) {
		// TODO Auto-generated method stub
		String hql="From TableColumns where table.id=?";
		return this.find(hql, interfaceId);
	}

	@Override
	public List<TableColumns> getColumnsByIds(String interfaceIds) {
		// TODO Auto-generated method stub
		String hql="From TableColumns where table.id in "+interfaceIds;
		return this.find(hql);
	}
 
}
