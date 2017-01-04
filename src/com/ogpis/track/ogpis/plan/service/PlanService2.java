package com.ogpis.track.ogpis.plan.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.document.entity.PlanDocument;
import com.ogpis.track.ogpis.plan.entity.Plan2;

public interface PlanService2 extends BaseService<Plan2, String>{

	IPageList<Plan2> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition);

	void updateAll(ArrayList<String> idList);

	List<Plan2> getAllPlans();

	List<Plan2> getPlansByType(String type);

	List<Plan2> findAll(boolean isManager, String type, String condition);

}