package com.ogpis.track.ogpis.system.service;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.system.entity.MenuItem;

public interface MenuItemService extends BaseService<MenuItem, String> {

	List<MenuItem> findTopMenu();

	List<MenuItem> findByParentId(String id);

	void updateAll(List<String> list);

	String menuToJson();

	IPageList<MenuItem> getByParentId(String id, int pageNo, int pageSize);
	
}
