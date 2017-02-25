package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.TableColumnsDao;
import com.ogpis.data.entity.TableColumns;
@Repository
public class TableColumnsDaoImpl extends HibernateBaseDao<TableColumns,String> implements TableColumnsDao{

	@Override
	public TableColumns getColumnsById(String tableColumnsId) {
		// TODO Auto-generated method stub
		String hql="From TableColumns where id = ?";
		return (TableColumns) this.findUnique(hql, tableColumnsId);
	}

	@Override
	protected Class<TableColumns> getEntityClass() {
		// TODO Auto-generated method stub
		return TableColumns.class;
	}

}
