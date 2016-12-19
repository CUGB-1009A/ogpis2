package com.ogpis.plan.dao;

import java.util.List;

import com.ogpis.plan.entity.IndexManagement;

public interface IndexManagementDao {
	public List<IndexManagement> findAllIndexByPrority(String type);
	public IndexManagement save(IndexManagement indexManagement);
	public IndexManagement update(IndexManagement indexManagement);
	public IndexManagement findById(String id);
}
