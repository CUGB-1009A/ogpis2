package com.ogpis.track.ogpis.index.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.index.entity.IndexManagement;

public interface IndexManagementDao extends BaseDao< IndexManagement,String> {

	IPageList<IndexManagement> getOnePlanIndexs(int pageNo, int pageSize, String id);

	List<IndexManagement> getOnePlanIndexs(String id);

	List<IndexManagement> findAll();

	List<IndexManagement> findAllIndexByPriority(String type);

	List<IndexManagement> findByMineType(String mineType);
	
	List<IndexManagement> findByIds(String[] ids);

}
