package com.ogpis.track.ogpis.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.system.dao.UserDao2;
import com.ogpis.track.ogpis.system.entity.User2;
import com.ogpis.track.ogpis.system.service.UserService2;

@Service
public class UserServiceImpl2 extends BaseServiceImpl<User2, String> implements
		UserService2 {
	@Autowired
	protected void setUserDao(UserDao2 userDao) {
		setBaseDao(userDao);
	}

	protected UserDao2 getUserDao() {
		return (UserDao2) this.baseDao;
	}

	@Override
	public List<User2> getAllUsers() {
		return (List<User2>) getUserDao().getAllUsers();
	}

	@Override
	public IPageList<User2> getAllUsers(int pageNo, int pageSize) {
		return (IPageList<User2> ) getUserDao().getAllUsers(pageNo,pageSize);
	}
	
	@Override
	public User2 findByUserName(String userName){
		return getUserDao().findByUserName(userName);
	}

	@Override
	public List<User2> findUserByName(String name) {
		// TODO Auto-generated method stub
		return getUserDao().findUserByName(name);
	}
}
