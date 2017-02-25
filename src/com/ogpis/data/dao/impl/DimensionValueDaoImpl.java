package com.ogpis.data.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.DimensionValueDao;
import com.ogpis.data.entity.DimensionValue;

@Repository
public class DimensionValueDaoImpl extends HibernateBaseDao<DimensionValue, String> implements DimensionValueDao{

	@Override
	protected Class<DimensionValue> getEntityClass() {
		return DimensionValue.class;
	}

	@Override
	public void save(DimensionValue dimensionValue) {
		getSession().merge(dimensionValue);
	}

	@Override
	public void delete(List<DimensionValue> dimensionValuesOld) {
		for(DimensionValue temp : dimensionValuesOld){
			getSession().delete(temp);
		}
	}

	@Override
	public List<DimensionValue> getByDimensionId(String dimensionId) {
		// TODO Auto-generated method stub
		String hql="From DimensionValue where dimension.id=?";
		return this.find(hql, dimensionId);
	}

	@Override
	public DimensionValue getById(String dimensionValueId) {
		// TODO Auto-generated method stub
		String hql="From DimensionValue where id=?";
		return (DimensionValue) this.findUnique(hql, dimensionValueId);
	}

	@Override
	public DimensionValue findById(String id) {
		return super.get(id);
	}

}
