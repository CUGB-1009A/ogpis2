package com.ogpis.data.dao;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.TableColumns;

public interface TableColumnsDao {

	Pagination getTableColumnsByTableId(String id ,int cpn, Integer pageSize);

	TableColumns findById(String id);

	void save(TableColumns tableColumn);

}
