package com.ogpis.data.dao.impl;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.TableColumnsDao;
import com.ogpis.data.entity.TableColumns;

@Repository
public class TableColumnsDaoImpl extends HibernateBaseDao<TableColumns, String> implements TableColumnsDao{

	@Override
	protected Class<TableColumns> getEntityClass() {
		return TableColumns.class;
	}

	@Override
	public Pagination getTableColumnsByTableId(String id ,int cpn, Integer pageSize) {
		String sql = "select bean from TableColumns bean where bean.deleted=false and bean.tableId='"+id+"'";
		System.out.println(sql);
		Finder f = Finder.create(sql);
		return find(f,cpn,pageSize);
	}

	@Override
	public TableColumns findById(String id) {
		return super.get(id);
	}

	@Override
	public void save(TableColumns tableColumn) {
		getSession().merge(tableColumn);
	}
	
	@Override
	public TableColumns getColumnsById(String tableColumnsId) {
		// TODO Auto-generated method stub
		String hql="From TableColumns where id = ?";
		return (TableColumns) this.findUnique(hql, tableColumnsId);
	}

}
