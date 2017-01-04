package com.ogpis.track.ogpis.system.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.system.entity.MenuItem2;

public interface MenuItemDao2 extends BaseDao<MenuItem2, String> {

	List<MenuItem2> findTopMenu();

	List<MenuItem2> findByParentId(String id);
	
	List<MenuItem2> findAllChild();

	void updateAll(List<String> list);

	String menuToJson();

	IPageList<MenuItem2> getByParentId(String id, int pageNo, int pageSize);
}
