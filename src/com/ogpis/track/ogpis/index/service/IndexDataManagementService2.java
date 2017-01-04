package com.ogpis.track.ogpis.index.service;

import java.util.Date;
import java.util.List;

import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement2;

public interface IndexDataManagementService2 extends BaseService<IndexDataManagement2,String>{

	List<IndexDataManagement2> findByIndexId(String indexId);

	List<IndexDataManagement2> sumTheIndex(String id, Date startTime, Date endTime);

	List<IndexDataManagement2> findHistoryData(String id, Date startTime, int i);


}
