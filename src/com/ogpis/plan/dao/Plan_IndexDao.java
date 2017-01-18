package com.ogpis.plan.dao;

import java.util.List;

import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;

public interface Plan_IndexDao {
	Plan_Index add(Plan plan,IndexManagement index,float targetValue);
	Plan_Index findByP_I(String planId,String indexId);
	void batchAdd(Plan plan,List<IndexManagement> indexs);
	List<Plan_Index> findByPlanTypeAndMineType(String planType,String mineType);
	Plan_Index findById(String id);
	Plan_Index update(Plan_Index bean);
}
