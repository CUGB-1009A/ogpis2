package com.ogpis.data.service;

import java.util.List;

import com.ogpis.data.entity.Subject;

public interface SubjectService {

	List<Subject> findAll();

	List<Subject> findByIds(String ids);
	
	Subject findById(String id);
	
	
}
