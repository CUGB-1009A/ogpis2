package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ogpis.data.dao.DimensionValueDao;
import com.ogpis.data.service.DimensionValueService;

@Service
@Transactional
public class DimensionValueServiceImpl implements DimensionValueService{
	
	@Autowired 
	private DimensionValueDao dimensionValueDao;
	

}
