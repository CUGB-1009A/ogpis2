package com.ogpis.track.ogpis.system.service;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.system.entity.User;

public interface UserService extends BaseService<User, String> {
	//
	// public String addUser(User user);
	//
	// public void deleteUser(String id);
	//
	// public User getUserById(String id);

	public List<User> getAllUsers();

	public IPageList<User> getAllUsers(int pageNo, int pageSize);

	public User findByUserName(String userName);

	public List<User> findUserByName(String name);
}
