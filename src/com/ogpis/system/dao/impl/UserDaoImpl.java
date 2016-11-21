package com.ogpis.system.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.demo.entity.Demo;
import com.ogpis.system.dao.UserDao;
import com.ogpis.system.entity.User;

@Repository
public class UserDaoImpl extends HibernateBaseDao<User, String> implements
		UserDao {

	@Override
	public User save(User user) {
		getSession().save(user);
		return user;
	}
	
	@Override
	public User findById(String id) {
		User entity = get(id);
		return entity;
	}
	
	@Override
	public User findByUserName(String username) {
		String hql = "from User where name=?";
		User user = (User) this.findUnique(hql, username);
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		String hql = "from User where deleted=false";
		return super.find(hql, null);
	}
	
	@Override
	protected Class<User> getEntityClass() {
		return User.class;
	}

}
