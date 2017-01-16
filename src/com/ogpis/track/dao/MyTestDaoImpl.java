package com.ogpis.track.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.data.entity.DataCache;
import com.ogpis.track.dao.base.MyTestDao;
import com.ogpis.track.entity.TestEntity;

@Repository
@Transactional
public class MyTestDaoImpl extends HibernateBaseDao<TestEntity, Integer>
		implements MyTestDao {
	@Override
	public TestEntity getObj() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected Class<TestEntity> getEntityClass() {
		// TODO Auto-generated method stub
		return TestEntity.class;
	}

	public void insert(TestEntity entity) {
		getSession().save(entity);
	}

	public void delete(Integer id) {
		TestEntity entity = findById(id);
		getSession().delete(entity);
	}

	public void update(TestEntity entity) {
		getSession().saveOrUpdate(entity);
	}

	public TestEntity findById(Integer id) {
		// TODO Auto-generated method stub
		return get(id);
	}

	public String findByParams(String params) {
		// TODO Auto-generated method stub
		String hql = "From DataCache where params=?";
		DataCache entity=findOne(hql,params);
		if(entity==null)
			return null;
		else
			return entity.getResult();
	}

	private DataCache findOne(String hql, Object... values) {
		return (DataCache) createQuery(hql, values).uniqueResult();
	}
}
