package com.ogpis.data.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;
import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.dao.SubjectDao;
import com.ogpis.data.entity.Subject;
import com.ogpis.forecast.entity.DataCollection;

@Repository
public class SubjectDaoImpl extends HibernateBaseDao<Subject, String> implements SubjectDao{

	@Override
	protected Class<Subject> getEntityClass() {
		return Subject.class;
	}

	@Override
	public List<Subject> findAll() {
		String hql = "From Subject where deleted=false order by priority asc";
		List<Subject> subjects = this.find(hql, null);
		return subjects;
	}

	@Override
	public List<Subject> findByIds(String ids) {
		String hql = "From Subject where deleted=false and id in ("+ids+")";
		List<Subject> subjects = this.find(hql, null);
		return subjects;
	}

}
