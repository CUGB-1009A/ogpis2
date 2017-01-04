package com.ogpis.track.ogpis.plan.dao;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.plan.entity.Plan2;


public interface PlanDao2 extends BaseDao<Plan2, String>   {

	IPageList<Plan2> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition);

	void updateAll(ArrayList<String> idList);

	List<Plan2> getAllPlans();

	List<Plan2> getPlansByType(String type);

	List<Plan2> findAll(boolean isManager, String type, String condition);

}
