package com.ogpis.plan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.plan.dao.IndexManagementDao;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.service.IndexManagementService;

@Service
public class IndexManagementServiceImpl implements IndexManagementService {
	
	@Autowired
	private IndexManagementDao indexManagementDao;

	@Override
	public List<IndexManagement> findAllIndexByPriority(String type) {
		
		return indexManagementDao.findAllIndexByPrority(type);
	}

	@Override
	public IndexManagement save(IndexManagement indexManagement) {
		// TODO Auto-generated method stub
		return indexManagementDao.save(indexManagement);
	}

	@Override
	public IndexManagement update(IndexManagement indexManagement) {
		// TODO Auto-generated method stub
		return indexManagementDao.update(indexManagement);
	}

	@Override
	public IndexManagement findById(String id) {
		
		return indexManagementDao.findById(id);
	}

}
