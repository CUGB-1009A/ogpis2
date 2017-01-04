package com.ogpis.track.ogpis.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.MenuItemDao2;
import com.ogpis.track.ogpis.system.entity.MenuItem2;
import com.ogpis.track.ogpis.system.service.MenuItemService2;

@Service
public class MenuItemServiceImpl2 extends BaseServiceImpl<MenuItem2, String>
		implements MenuItemService2 {
	
	@Autowired
	private MenuItemDao2 MenuItemDao;


	@Autowired
	protected void setMenuItemDao(MenuItemDao2 menuItemDao) {
		setBaseDao(menuItemDao);
	}

	@Override
	public List<MenuItem2> findTopMenu() {
		return MenuItemDao.findTopMenu();
	}

	@Override
	public List<MenuItem2> findByParentId(String id) {
		// TODO Auto-generated method stub
		return MenuItemDao.findByParentId(id);
	}
	

	@Override
	public void updateAll(List<String> list) {
		// TODO Auto-generated method stub
		MenuItemDao.updateAll(list);
	}
	
	@Override
	public String menuToJson() {
		return MenuItemDao.menuToJson();
	}

	@Override
	public IPageList<MenuItem2> getByParentId(String id, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return (IPageList<MenuItem2> ) MenuItemDao.getByParentId(id,pageNo,pageSize);
	}
}
