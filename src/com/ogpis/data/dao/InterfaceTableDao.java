package com.ogpis.data.dao;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.TableColumns;

public interface InterfaceTableDao {

	Pagination getAllInterface(int cpn, Integer pageSize);

	InterfaceTable findById(String id);

	InterfaceTable save(InterfaceTable interfaceTable);

	List<TableColumns> getColumnsById(String interfaceId);

	List<TableColumns> getColumnsByIds(String interfaceIds);

}
