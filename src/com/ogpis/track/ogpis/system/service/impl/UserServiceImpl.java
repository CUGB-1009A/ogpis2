package com.ogpis.track.ogpis.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.UserDao;
import com.ogpis.track.ogpis.system.entity.User;
import com.ogpis.track.ogpis.system.service.UserService;

@Service
public class UserServiceImpl extends BaseServiceImpl<User, String> implements
		UserService {
	@Autowired
	protected void setUserDao(UserDao userDao) {
		setBaseDao(userDao);
	}

	protected UserDao getUserDao() {
		return (UserDao) this.baseDao;
	}

	@Override
	public List<User> getAllUsers() {
		return (List<User>) getUserDao().getAllUsers();
	}

	@Override
	public IPageList<User> getAllUsers(int pageNo, int pageSize) {
		return (IPageList<User> ) getUserDao().getAllUsers(pageNo,pageSize);
	}
	
	@Override
	public User findByUserName(String userName){
		return getUserDao().findByUserName(userName);
	}

	@Override
	public List<User> findUserByName(String name) {
		// TODO Auto-generated method stub
		return getUserDao().findUserByName(name);
	}
}
