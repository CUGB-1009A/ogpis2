package com.ogpis.track.ogpis.system.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.common.paging.PageListUtil;
import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.system.dao.UserDao2;
import com.ogpis.track.ogpis.system.entity.User2;

@Repository
public class UserDaoImpl2 extends BaseDaoImpl<User2, String> implements UserDao2 {
	public User2 saveUser(User2 user) {
		return save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User2> getAllUsers() {
		return (List<User2>) this.queryByHql("from User where deleted=false",
				null);
	}

	@Override
	public IPageList<User2> getAllUsers(int pageNo, int pageSize) {
		int first = (pageNo - 1) * pageSize;
		List<User2> items = this.queryByHql(
				"from User where deleted=false order by createTime desc", null,
				first, pageSize);
		// int count = this.queryByHql("select count(*) from User where
		// deleted=false", null).indexOf(0);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from User where deleted=false", null)
				.toString());
		System.out.println("count: " + count);
		// http://www.cnblogs.com/mabaishui/archive/2009/10/16/1584510.html
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public User2 findByUserName(String userName) {
		String hql = "from User2 where name=?";
		User2 user = (User2) this.findUnique(hql, userName);
		return user;
	}

	@Override
	protected Class<User2> getEntityClass() {
		return User2.class;
	}

	@Override
	public List<User2> findUserByName(String name) {
		// TODO Auto-generated method stub
		 List<User2> users = this.queryByHql(
				"from User where deleted=false and name='"+name+"' order by createTime desc", null
				);
		 return users;
	}
}
