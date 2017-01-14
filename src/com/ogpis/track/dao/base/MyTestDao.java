package com.ogpis.track.dao.base;

import com.ogpis.track.entity.TestEntity;

public interface MyTestDao {
	public TestEntity getObj();
	public void insert(TestEntity entity);
	public void delete(Integer id);
	public void update(TestEntity entity);
	public TestEntity findById(Integer id);
	public String findByParams(String params);
}
