package com.ogpis.track.ogpis.plan.dao;

import java.util.List;

import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.plan.entity.Plan_Index2;

public interface Plan_IndexDao2 extends BaseDao<Plan_Index2, String> {

	Plan_Index2 add(Plan2 plan, IndexManagement2 index, float targetValue);

	Plan_Index2 findByP_I(String planId, String indexId);

	void batchAdd(Plan2 plan, List<IndexManagement2> indexs);

	List<Plan_Index2> findByPlanTypeAndMineType(String planType, String mineType);

}
