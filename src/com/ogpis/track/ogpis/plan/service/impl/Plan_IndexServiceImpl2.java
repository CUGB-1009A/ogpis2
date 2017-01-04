package com.ogpis.track.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.plan.dao.PlanDao2;
import com.ogpis.track.ogpis.plan.dao.Plan_IndexDao2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.plan.entity.Plan_Index2;
import com.ogpis.track.ogpis.plan.service.Plan_IndexService2;

@Service
public class Plan_IndexServiceImpl2 extends BaseServiceImpl<Plan_Index2, String>
		implements Plan_IndexService2 {

	@Autowired
	protected void setPlan_IndexDao(Plan_IndexDao2 plan_IndexDao) {
		setBaseDao(plan_IndexDao);
	}

	protected Plan_IndexDao2 getPlan_IndexDao() {
		return (Plan_IndexDao2) this.baseDao;
	}

	@Override
	public Plan_Index2 add(Plan2 plan, IndexManagement2 index, float targetValue) {
		return getPlan_IndexDao().add(plan, index, targetValue);
	}

	@Override
	public Plan_Index2 findByP_I(String planId, String indexId) {
		return getPlan_IndexDao().findByP_I(planId, indexId);
	}

	@Override
	public void batchAdd(Plan2 plan, List<IndexManagement2> indexs) {
		List<IndexManagement2> addIndexs = new ArrayList<IndexManagement2>();
		for (IndexManagement2 index : indexs) {
			if (!plan.getIndexIds().contains(index.getId())) {
				addIndexs.add(index);
			}
		}
		System.out.println("---indexs size:" + indexs.size());
		System.out.println("---addIndexs size:" + addIndexs.size());
		getPlan_IndexDao().batchAdd(plan, addIndexs);
	}

	@Override
	public List<Plan_Index2> findByPlanTypeAndMineType(String planType,
			String mineType) {
		// TODO Auto-generated method stub
		return getPlan_IndexDao().findByPlanTypeAndMineType(planType, mineType);
	}
}
