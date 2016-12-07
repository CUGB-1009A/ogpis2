package com.ogpis.plan.dao;

import java.util.List;

import com.ogpis.plan.entity.IndexManagement;

public interface IndexManagementDao {
	List<IndexManagement> findAllIndexByPrority(String type);
}
