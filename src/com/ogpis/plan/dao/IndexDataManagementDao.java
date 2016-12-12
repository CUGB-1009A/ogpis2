package com.ogpis.plan.dao;

import java.util.Date;
import java.util.List;

import com.ogpis.plan.entity.IndexDataManagement;

public interface IndexDataManagementDao {
	List<IndexDataManagement> findByIndexId(String indexId);
	List<IndexDataManagement> findByIndexId(String id,Date startTime,Date endTime);
	List<IndexDataManagement> findHistoryData(String id,Date startTime,int i);
	

	public IndexDataManagement save(IndexDataManagement indexDataManagement);
	public IndexDataManagement update(IndexDataManagement indexDataManagement);
}
