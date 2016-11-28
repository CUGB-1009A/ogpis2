package com.ogpis.system.dao;

import java.util.List;

import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.demo.entity.Demo;
import com.ogpis.system.entity.Role;

public interface RoleDao {

	public Role save(Role role);

	public Role updateByUpdater(Updater<Role> updater);

	public Role findById(String id);

	public List<Role> getList();

	public Pagination getRoleList(int pageNo, int pageSize);

	public void deleteById(String id);
}
