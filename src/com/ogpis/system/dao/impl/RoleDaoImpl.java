package com.ogpis.system.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.system.dao.RoleDao;
import com.ogpis.system.entity.Role;

@Repository
public class RoleDaoImpl extends HibernateBaseDao<Role, String> implements
		RoleDao {

	@Override
	public Role save(Role role) {
		getSession().save(role);
		return role;
	}

	@Override
	public Role findById(String id) {
		Role entity = get(id);
		return entity;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<Role> getList() {
		String hql = "from Role where deleted=false order by priority";
		return find(hql, null);
	}
	
	@Override
	public Pagination getRoleList(int pageNo, int pageSize) {
		Finder f = Finder.create("select bean from Role bean ");
		f.append(" order by bean.priority asc");
		return find(f,pageNo,pageSize);
	}
	
	@Override
	public void deleteById(String id) {
		Role entity = get(id);
		getSession().delete(entity);
	}

	@Override
	protected Class<Role> getEntityClass() {
		return Role.class;
	}

	

	

}
