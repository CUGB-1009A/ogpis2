package com.ogpis.track.ogpis.system.service;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.system.entity.User2;

public interface UserService2 extends BaseService<User2, String> {
	//
	// public String addUser(User user);
	//
	// public void deleteUser(String id);
	//
	// public User getUserById(String id);

	public List<User2> getAllUsers();

	public IPageList<User2> getAllUsers(int pageNo, int pageSize);

	public User2 findByUserName(String userName);

	public List<User2> findUserByName(String name);
}
