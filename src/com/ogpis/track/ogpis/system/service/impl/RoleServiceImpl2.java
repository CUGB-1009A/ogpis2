package com.ogpis.track.ogpis.system.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.RoleDao2;
import com.ogpis.track.ogpis.system.entity.Role2;
import com.ogpis.track.ogpis.system.entity.User2;
import com.ogpis.track.ogpis.system.service.RoleService2;
import com.ogpis.track.ogpis.system.service.UserService2;

@Service
public class RoleServiceImpl2 extends BaseServiceImpl<Role2, String> implements
		RoleService2 {

	@Autowired
	protected void setUserDao(RoleDao2 roleDao) {
		setBaseDao(roleDao);
	}

	protected RoleDao2 getRoleDao() {
		return (RoleDao2) this.baseDao;
	}
	
	@Override
	public Role2 save(Role2 role,Set<String> perms){
		role.setPerms(perms);
		this.getRoleDao().save(role);
		return role;
	}
	
	@Override
	public Role2 update(Role2 role,Set<String> perms){
		role.setPerms(perms);
		this.getRoleDao().update(role);
		return role;
	}

	@Override
	public List<Role2> getList() {
		return (List<Role2>) getRoleDao().getList();
	}

	@Override
	public void deleteMembers(Role2 role, String[] userIds) {
		if (userIds != null) {
			User2 user;
			for (String uid : userIds) {
				user = userService.findById(uid);
				role.deleteFromUsers(user);
			}
		}
		System.out.println(role.getUsers().size());
		getRoleDao().update(role);
	}

	@Autowired
	private UserService2 userService;

}
