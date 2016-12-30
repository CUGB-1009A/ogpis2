package com.ogpis.data.dao;

import com.ogpis.base.common.page.Pagination;

public interface InterfaceTableDao {

	Pagination getAllInterface(int cpn, Integer pageSize);

}
