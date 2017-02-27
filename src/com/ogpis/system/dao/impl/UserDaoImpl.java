package com.ogpis.system.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.ogpis.base.common.hibernate3.Finder;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.base.common.page.Pagination;
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
	
	@SuppressWarnings("unchecked")
	@Override
	public List<User> getAllUsers() {
		String hql = "from User where deleted=false";
		return super.find(hql, null);
	}

	@Override
	public Pagination getUserList(int pageNo,int pageSize){
		Finder f = Finder.create("select bean from User bean ");
		f.append(" where bean.deleted=false");
		f.append(" order by bean.id asc");
		return find(f,pageNo,pageSize);
	}
	
	@Override
	public int countUserList() {
		String hql = "select count(*) from User bean where bean.deleted=false";
		Query query = getSession().createQuery(hql);
		return ((Number) query.iterate().next()).intValue();
	}
	
	@Override
	protected Class<User> getEntityClass() {
		return User.class;
	}

	@Override
	public User update(User user) {
		getSession().merge(user);
		return user;
	}

}
