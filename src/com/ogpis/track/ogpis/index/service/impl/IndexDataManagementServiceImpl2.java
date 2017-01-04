package com.ogpis.track.ogpis.index.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.dao.IndexDataManagementDao2;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement2;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.index.service.IndexDataManagementService2;

@Service
public class IndexDataManagementServiceImpl2 extends BaseServiceImpl<IndexDataManagement2, String> implements IndexDataManagementService2{

	@Autowired
	protected void setIndexDataManagementDao(IndexDataManagementDao2 indexDataManagement) {
		setBaseDao(indexDataManagement);
	}

	protected IndexDataManagementDao2 getIndexDataManagementDao() {
		return (IndexDataManagementDao2) this.baseDao;
	}

	@Override
	public List<IndexDataManagement2> findByIndexId(String indexId) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findByIndexId(indexId);
	}

	@Override
	public List<IndexDataManagement2> sumTheIndex(String id, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findByIndexId(id,startTime,endTime);
	}

	@Override
	public List<IndexDataManagement2> findHistoryData(String id, Date startTime, int i) {
		// TODO Auto-generated method stub
		return getIndexDataManagementDao().findHistoryData(id,startTime,i);
	}
	
}
