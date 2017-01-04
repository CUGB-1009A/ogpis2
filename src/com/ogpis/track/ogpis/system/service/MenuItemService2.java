package com.ogpis.track.ogpis.system.service;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.system.entity.MenuItem2;

public interface MenuItemService2 extends BaseService<MenuItem2, String> {

	List<MenuItem2> findTopMenu();

	List<MenuItem2> findByParentId(String id);

	void updateAll(List<String> list);

	String menuToJson();

	IPageList<MenuItem2> getByParentId(String id, int pageNo, int pageSize);
	
}
