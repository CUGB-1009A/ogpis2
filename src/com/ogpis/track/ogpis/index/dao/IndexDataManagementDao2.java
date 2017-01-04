package com.ogpis.track.ogpis.index.dao;

import java.util.Date;
import java.util.List;


import com.ogpis.track.ogpis.base.dao.BaseDao;
//import com.ogpis.track.ogpis.base.BaseDao;
import com.ogpis.track.ogpis.index.entity.IndexDataManagement2;

public interface IndexDataManagementDao2 extends BaseDao<IndexDataManagement2 , String> {

	List<IndexDataManagement2> findByIndexId(String indexId);

	List<IndexDataManagement2> findByIndexId(String id, Date startTime, Date endTime);

	List<IndexDataManagement2> findHistoryData(String id, Date startTime, int i);

}
