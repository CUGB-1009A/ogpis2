package com.ogpis.track.ogpis.index.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.dao.IndexDataManagementDao;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement;
import com.ogpis.track.ogpis.index.entity.IndexManagement;
import com.ogpis.track.ogpis.index.service.IndexDataManagementService;

@Service
public class IndexDataManagementServiceImpl extends BaseServiceImpl<IndexDataManagement, String> implements IndexDataManagementService{

	@Autowired
	protected void setIndexDataManagementDao(IndexDataManagementDao indexDataManagement) {
		setBaseDao(indexDataManagement);
	}

	protected IndexDataManagementDao getIndexDataManagementDao() {
		return (IndexDataManagementDao) this.baseDao;
	}

	@Override
	public List<IndexDataManagement> findByIndexId(String indexId) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findByIndexId(indexId);
	}

	@Override
	public List<IndexDataManagement> sumTheIndex(String id, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findByIndexId(id,startTime,endTime);
	}

	@Override
	public List<IndexDataManagement> findHistoryData(String id, Date startTime, int i) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findHistoryData(id,startTime,i);
	}
	
}
