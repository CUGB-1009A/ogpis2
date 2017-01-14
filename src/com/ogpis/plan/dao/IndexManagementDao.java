package com.ogpis.plan.dao;

import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.plan.entity.IndexManagement;

public interface IndexManagementDao {
	public List<IndexManagement> findAllIndexByPrority(String type);
	public IndexManagement save(IndexManagement indexManagement);
	public IndexManagement update(IndexManagement indexManagement);
	public IndexManagement findById(String id);
	List<IndexManagement> findByIds(String[] ids);
	public Pagination getAllIndexs(int pageNo,int pageSize,String planType);
}
