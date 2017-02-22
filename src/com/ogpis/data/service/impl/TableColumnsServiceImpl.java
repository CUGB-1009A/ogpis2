package com.ogpis.data.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.dao.TableColumnsDao;
import com.ogpis.data.entity.TableColumns;
import com.ogpis.data.service.TableColumnsService;

@Service
@Transactional
public class TableColumnsServiceImpl implements TableColumnsService{
	
	@Autowired 
	private TableColumnsDao tableColumnsDao;

	@Override
	public Pagination getTableColumnsByTableId(String id ,int cpn, Integer pageSize) {
		return tableColumnsDao.getTableColumnsByTableId(id, cpn, pageSize);
	}

	@Override
	public TableColumns findById(String id) {
		return tableColumnsDao.findById(id);
	}

	@Override
	public void save(TableColumns tableColumn) {
		tableColumnsDao.save(tableColumn);
	}

}
