package com.ogpis.system.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.Updater;
import com.ogpis.system.dao.UserDao;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Override
	public User save(User user) {
		return userDao.save(user);
	}

	@Override
	public User update(User user) {
		Updater<User> updater = new Updater<User>(user);
		user = userDao.updateByUpdater(updater);
		return user;
	}

	@Override
	public User findById(String id) {
		return userDao.findById(id);
	}
	
	@Override
	public User findByUserName(String username) {
		return userDao.findByUserName(username);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Autowired
	private UserDao userDao;

	
}
