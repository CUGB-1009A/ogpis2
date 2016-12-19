package com.ogpis.plan.service;

import java.util.List;

import com.ogpis.plan.entity.IndexManagement;

public interface IndexManagementService  {
	List<IndexManagement> findAllIndexByPriority(String type);
	public IndexManagement save(IndexManagement indexManagement);
	public IndexManagement update(IndexManagement indexManagement);
	public IndexManagement findById(String id);
	
}
