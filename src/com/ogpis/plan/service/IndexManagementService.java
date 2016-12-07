package com.ogpis.plan.service;

import java.util.List;

import com.ogpis.plan.entity.IndexManagement;

public interface IndexManagementService {
	List<IndexManagement> findAllIndexByPriority(String type);
}
