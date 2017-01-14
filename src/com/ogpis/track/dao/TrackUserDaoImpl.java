package com.ogpis.track.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.track.dao.base.TrackUserDao;
import com.ogpis.track.entity.TrackUser;
@Repository
@Transactional
public class TrackUserDaoImpl extends HibernateBaseDao<TrackUser,Integer> implements TrackUserDao{

	@Override
	public void insert(TrackUser user) {
		// TODO Auto-generated method stub
		getSession().save(user);
	}

	@Override
	protected Class<TrackUser> getEntityClass() {
		// TODO Auto-generated method stub
		return null;
	}

}
