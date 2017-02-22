package com.ogpis.data.dao;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.InterfaceTable;

public interface InterfaceTableDao {

	Pagination getAllInterface(int cpn, Integer pageSize);

	InterfaceTable findById(String id);

	InterfaceTable save(InterfaceTable interfaceTable);

}
