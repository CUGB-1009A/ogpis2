package com.ogpis.data.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.InterfaceTableDao;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;

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
		getSession().merge(interfaceTable);
		return interfaceTable;
	}

	@Override
	public List<InterfaceTable> findByIds(String ids) {
		String hql = "From InterfaceTable where deleted=false and id in ("+ids+")";
		List<InterfaceTable> interfaceTables = this.find(hql, null);
		return interfaceTables;
	}

	@Override
	public void delete(List<InterfaceTable> interfaceTables) {
		for(InterfaceTable temp : interfaceTables){
			temp.setDeleted(true);
			getSession().merge(temp);
		}
	}

}
