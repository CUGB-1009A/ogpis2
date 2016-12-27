package com.ogpis.plan.service;

import java.util.Date;
import java.util.List;

import com.ogpis.plan.entity.IndexDataManagement;

public interface IndexDataManagementService  {
	List<IndexDataManagement> findByIndexId(String indexId);
	IndexDataManagement findOneById(String indexId);
	List<IndexDataManagement> sumTheIndex(String id,Date startTime,Date endTime);
	List<IndexDataManagement> findHistoryData(String id,Date startTime,int i);

	public IndexDataManagement save(IndexDataManagement indexDataManagement);
	public IndexDataManagement update(IndexDataManagement indexDataManagement);
	public void delete(String id);
	
}
