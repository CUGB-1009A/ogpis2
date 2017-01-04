package com.ogpis.track.ogpis.index.service;

import java.util.Date;
import java.util.List;

import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement;

public interface IndexDataManagementService extends BaseService<IndexDataManagement,String>{

	List<IndexDataManagement> findByIndexId(String indexId);

	List<IndexDataManagement> sumTheIndex(String id, Date startTime, Date endTime);

	List<IndexDataManagement> findHistoryData(String id, Date startTime, int i);


}
