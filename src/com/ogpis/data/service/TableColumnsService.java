package com.ogpis.data.service;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.TableColumns;

public interface TableColumnsService {

	Pagination getTableColumnsByTableId(String id ,int cpn, Integer pageSize);

	TableColumns findById(String id);

	void save(TableColumns tableColumn);
	
	TableColumns getColumnsById(String tableColumnsId);

}
