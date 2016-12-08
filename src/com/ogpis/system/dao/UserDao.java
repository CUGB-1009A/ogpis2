package com.ogpis.system.dao;

import java.util.List;

import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.demo.entity.Demo;
import com.ogpis.system.entity.User;

public interface UserDao {

	public User save(User user);

	public User updateByUpdater(Updater<User> updater);

	public User findById(String id);

	public User findByUserName(String username);

	public List<User> getAllUsers();

	public Pagination getUserList(int pageNo, int pageSize);

	public int countUserList();

}
