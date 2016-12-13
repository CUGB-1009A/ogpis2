package com.ogpis.plan.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.plan.dao.IndexDataManagementDao;
import com.ogpis.plan.entity.IndexDataManagement;
import com.ogpis.plan.service.IndexDataManagementService;

@Service
public class IndexDataManagementServiceImpl implements IndexDataManagementService {
	
	@Autowired
	private IndexDataManagementDao indexDataManagementDao; 
	@Override
	public List<IndexDataManagement> findByIndexId(String indexId) {
		
		return indexDataManagementDao.findByIndexId(indexId);
	}
	@Override
	public IndexDataManagement findOneById(String indexId) {
		
		return indexDataManagementDao.findOneByIndexId(indexId);
	}

	@Override
	public List<IndexDataManagement> sumTheIndex(String id, Date startTime, Date endTime) {
		
		return indexDataManagementDao.findByIndexId(id, startTime, endTime);
	}

	@Override
	public List<IndexDataManagement> findHistoryData(String id, Date startTime, int i) {
		
		return indexDataManagementDao.findHistoryData(id, startTime, i);
	}

	@Override
	public IndexDataManagement save(IndexDataManagement indexDataManagement) {
		return indexDataManagementDao.save(indexDataManagement);
	}

	@Override
	public IndexDataManagement update(IndexDataManagement indexDataManagement) {
		return indexDataManagementDao.update(indexDataManagement);
	}

	@Override
	public void delete(String id) {
		 indexDataManagementDao.delete(id);
		
	}

}
