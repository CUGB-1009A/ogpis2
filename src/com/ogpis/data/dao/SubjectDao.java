package com.ogpis.data.dao;

import java.util.List;

import com.ogpis.data.entity.Subject;

public interface SubjectDao {

	List<Subject> findAll();

	List<Subject> findByIds(String ids);

	Subject findById(String id);

}
