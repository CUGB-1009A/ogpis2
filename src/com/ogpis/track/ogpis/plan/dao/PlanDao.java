package com.ogpis.track.ogpis.plan.dao;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.plan.entity.Plan;


public interface PlanDao extends BaseDao<Plan, String>   {

	IPageList<Plan> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition);

	void updateAll(ArrayList<String> idList);

	List<Plan> getAllPlans();

	List<Plan> getPlansByType(String type);

	List<Plan> findAll(boolean isManager, String type, String condition);

}
