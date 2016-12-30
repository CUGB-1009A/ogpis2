package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.FieldDao;
import com.ogpis.data.service.FieldService;

@Service
@Transactional
public class FieldServiceImpl implements FieldService{

	@Autowired 
	private FieldDao fieldDao;
}
