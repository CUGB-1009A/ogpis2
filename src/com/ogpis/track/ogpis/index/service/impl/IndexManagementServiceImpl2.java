package com.ogpis.track.ogpis.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.dao.IndexManagementDao2;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.index.service.IndexManagementService2;

@Service
public class IndexManagementServiceImpl2 extends
		BaseServiceImpl<IndexManagement2, String> implements
		IndexManagementService2 {

	@Autowired
	protected void setIndexManagementDao(IndexManagementDao2 indexManagement) {
		setBaseDao(indexManagement);
	}

	protected IndexManagementDao2 getIndexManagementDao() {
		return (IndexManagementDao2) this.baseDao;
	}

	@Override
	public IPageList<IndexManagement2> getOnePlanIndexs(int pageNo,
			int pageSize, String id) {

		return getIndexManagementDao().getOnePlanIndexs(pageNo, pageSize, id);
	}

	@Override
	public List<IndexManagement2> getOnePlanIndexs(String id) {
		return getIndexManagementDao().getOnePlanIndexs(id);
	}

	@Override
	public List<IndexManagement2> findAll() {
		return getIndexManagementDao().findAll();
	}

	@Override
	public List<IndexManagement2> findAllIndexByPriority(String type) {

		return getIndexManagementDao().findAllIndexByPriority(type);
	}

	@Override
	public List<IndexManagement2> findByMineType(String mineType) {
		// TODO Auto-generated method stub
		return getIndexManagementDao().findByMineType(mineType);
	}

	@Override
	public List<IndexManagement2> findByIds(String[] ids){
		return getIndexManagementDao().findByIds(ids);
	}
}
