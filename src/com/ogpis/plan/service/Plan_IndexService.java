package com.ogpis.plan.service;


import java.util.List;

import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;


public interface Plan_IndexService  {
	
	Plan_Index add(Plan plan,IndexManagement index,float targetValue);
	Plan_Index findByP_I(String planId,String indexId);
	void batchAdd(Plan plan,List<IndexManagement> indexs);
	List<Plan_Index> findByTypeAndMineType(String planType,String mineType);
	Plan_Index findById(String id);
	Plan_Index update(Plan_Index bean);
	void delete(Plan_Index plan_Index);
	
}
