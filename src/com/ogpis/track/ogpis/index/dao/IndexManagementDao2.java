package com.ogpis.track.ogpis.index.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;

public interface IndexManagementDao2 extends BaseDao< IndexManagement2,String> {

	IPageList<IndexManagement2> getOnePlanIndexs(int pageNo, int pageSize, String id);

	List<IndexManagement2> getOnePlanIndexs(String id);

	List<IndexManagement2> findAll();

	List<IndexManagement2> findAllIndexByPriority(String type);

	List<IndexManagement2> findByMineType(String mineType);
	
	List<IndexManagement2> findByIds(String[] ids);

}
