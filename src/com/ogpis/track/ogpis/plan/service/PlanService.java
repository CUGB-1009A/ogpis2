package com.ogpis.track.ogpis.plan.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.document.entity.PlanDocument;
import com.ogpis.track.ogpis.plan.entity.Plan;

public interface PlanService extends BaseService<Plan, String>{

	IPageList<Plan> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition);

	void updateAll(ArrayList<String> idList);

	List<Plan> getAllPlans();

	List<Plan> getPlansByType(String type);

	List<Plan> findAll(boolean isManager, String type, String condition);

}
