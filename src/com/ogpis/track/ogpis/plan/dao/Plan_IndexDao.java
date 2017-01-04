package com.ogpis.track.ogpis.plan.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.index.entity.IndexManagement;
import com.ogpis.track.ogpis.plan.entity.Plan;
import com.ogpis.track.ogpis.plan.entity.Plan_Index;

public interface Plan_IndexDao extends BaseDao<Plan_Index, String> {

	Plan_Index add(Plan plan, IndexManagement index, float targetValue);

	Plan_Index findByP_I(String planId, String indexId);

	void batchAdd(Plan plan, List<IndexManagement> indexs);

	List<Plan_Index> findByPlanTypeAndMineType(String planType, String mineType);

}
