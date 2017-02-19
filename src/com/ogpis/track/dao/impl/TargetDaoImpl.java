package com.ogpis.track.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.sf.json.JSONObject;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.track.dao.TargetDao;
import com.ogpis.track.entity.Target;
@Repository
public class TargetDaoImpl extends HibernateBaseDao<Target, String> implements TargetDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Target> find(JSONObject params) {
		// TODO Auto-generated method stub
		String hql="from Target";
		return (List<Target>)this.find(hql);
	}

	@Override
	protected Class<Target> getEntityClass() {
		// TODO Auto-generated method stub
		return Target.class;
	}

}
