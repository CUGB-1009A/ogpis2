package com.ogpis.forecast.dao.impl;

import java.util.List;
import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.forecast.dao.ModelInfoDao;
import com.ogpis.forecast.entity.ModelInfo;

@Repository
public class ModelInfoDaoImpl extends HibernateBaseDao<ModelInfo, String> implements ModelInfoDao{

	@Override
	public ModelInfo findById(String modelId) {
		ModelInfo entity = get(modelId);
		return entity;
	}

	@Override
	protected Class<ModelInfo> getEntityClass() {
		return ModelInfo.class;
	}

	@Override
	public List<ModelInfo> findAll() {
		String hql = "From ModelInfo where deleted=false";
		@SuppressWarnings("unchecked")
		List<ModelInfo> modelInfoList = this.find(hql, null);
		return modelInfoList;
	}

	@Override
	public Pagination getAllModel(int cpn, Integer pageSize) {
		Finder f = Finder.create("select bean from ModelInfo bean where bean.deleted=false");
		return find(f,cpn,pageSize);
	}

}
