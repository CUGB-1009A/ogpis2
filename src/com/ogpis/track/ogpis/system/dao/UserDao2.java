package com.ogpis.track.ogpis.system.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.system.entity.User2;

public interface UserDao2 extends BaseDao<User2, String> {

	public List<User2> getAllUsers();

	public IPageList<User2> getAllUsers(int pageNo, int pageSize);

	public User2 findByUserName(String userName);

	public List<User2> findUserByName(String name);

//	public String saveUser(User user);
//	
//	public User getUserById(String id);
//
//	public void deleteUser(String id);
}
