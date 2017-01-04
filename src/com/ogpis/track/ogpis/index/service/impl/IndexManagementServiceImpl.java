package com.ogpis.track.ogpis.index.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.dao.IndexManagementDao;
import com.ogpis.track.ogpis.index.entity.IndexManagement;
import com.ogpis.track.ogpis.index.service.IndexManagementService;

@Service
public class IndexManagementServiceImpl extends
		BaseServiceImpl<IndexManagement, String> implements
		IndexManagementService {

	@Autowired
	protected void setIndexManagementDao(IndexManagementDao indexManagement) {
		setBaseDao(indexManagement);
	}

	protected IndexManagementDao getIndexManagementDao() {
		return (IndexManagementDao) this.baseDao;
	}

	@Override
	public IPageList<IndexManagement> getOnePlanIndexs(int pageNo,
			int pageSize, String id) {

		return getIndexManagementDao().getOnePlanIndexs(pageNo, pageSize, id);
	}

	@Override
	public List<IndexManagement> getOnePlanIndexs(String id) {
		return getIndexManagementDao().getOnePlanIndexs(id);
	}

	@Override
	public List<IndexManagement> findAll() {
		return getIndexManagementDao().findAll();
	}

	@Override
	public List<IndexManagement> findAllIndexByPriority(String type) {

		return getIndexManagementDao().findAllIndexByPriority(type);
	}

	@Override
	public List<IndexManagement> findByMineType(String mineType) {
		// TODO Auto-generated method stub
		return getIndexManagementDao().findByMineType(mineType);
	}

	@Override
	public List<IndexManagement> findByIds(String[] ids){
		return getIndexManagementDao().findByIds(ids);
	}
}
