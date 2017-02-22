package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.InterfaceTableDao;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.service.InterfaceTableService;

@Service
@Transactional
public class InterfaceTableServiceImpl implements InterfaceTableService {

	@Autowired
	private InterfaceTableDao interfaceTableDao;
	
	@Override
	public Pagination getAllInterface(int cpn, Integer pageSize) {
		return interfaceTableDao.getAllInterface(cpn,pageSize);
	}

	@Override
	public InterfaceTable findById(String id) {
		return interfaceTableDao.findById(id);
	}

	@Override
	public InterfaceTable save(InterfaceTable interfaceTable) {
		return interfaceTableDao.save(interfaceTable);
	}

}
