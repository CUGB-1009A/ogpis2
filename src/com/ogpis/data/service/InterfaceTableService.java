package com.ogpis.data.service;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.InterfaceTable;

public interface InterfaceTableService {

	Pagination getAllInterface(int cpn, Integer pageSize);

	InterfaceTable findById(String id);

}
