package com.ogpis.system.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.system.dao.RoleDao;
import com.ogpis.system.dao.UserDao;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {

	@Override
	public Role save(Role role) {
		return roleDao.save(role);
	}
	
	@Override
	public Role save(Role role, Set<String> perms) {
		role.setPerms(perms);
		roleDao.save(role);
		return role;
	}

	@Override
	public Role update(Role role) {
		Updater<Role> updater = new Updater<Role>(role);
		role = roleDao.updateByUpdater(updater);
		return role;
	}
	
	@Override
	public Role update(Role role, Set<String> perms) {
		role.setPerms(perms);
		this.update(role);
		return role;
	}
	
	@Override
	public void deleteMembers(Role role, String[] userIds) {
		if (userIds != null) {
			User user;
			for (String uid : userIds) {
				user = userDao.findById(uid);
				role.deleteFromUsers(user);
			}
		}
		System.out.println(role.getUsers().size());
		this.update(role);
	}
	

	@Override
	public List<Role> getList() {
		return roleDao.getList();
	}


	@Autowired
	private RoleDao roleDao;

	@Autowired
	private UserDao userDao;

}
