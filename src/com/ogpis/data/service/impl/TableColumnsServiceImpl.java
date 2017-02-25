package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.data.dao.TableColumnsDao;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.TableColumnsService;
@Service
@Transactional
public class TableColumnsServiceImpl implements TableColumnsService{
	@Autowired
	private TableColumnsDao tableColumnsDao;
	@Override
	public TableColumns getColumnsById(String tableColumnsId) {
		// TODO Auto-generated method stub
		return tableColumnsDao.getColumnsById(tableColumnsId);
	}

}
