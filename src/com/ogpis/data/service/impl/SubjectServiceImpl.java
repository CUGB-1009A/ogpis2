package com.ogpis.data.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.SubjectDao;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.SubjectService;

@Service
@Transactional
public class SubjectServiceImpl implements SubjectService{
	
	@Autowired
	private SubjectDao subjectDao;

	@Override
	public List<Subject> findAll() {
		return subjectDao.findAll();
	}

	@Override
	public List<Subject> findByIds(String ids) {
		return subjectDao.findByIds(ids);
	}

}
