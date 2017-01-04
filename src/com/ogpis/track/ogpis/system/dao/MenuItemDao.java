package com.ogpis.track.ogpis.system.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.system.entity.MenuItem;

public interface MenuItemDao extends BaseDao<MenuItem, String> {

	List<MenuItem> findTopMenu();

	List<MenuItem> findByParentId(String id);
	
	List<MenuItem> findAllChild();

	void updateAll(List<String> list);

	String menuToJson();

	IPageList<MenuItem> getByParentId(String id, int pageNo, int pageSize);
}
