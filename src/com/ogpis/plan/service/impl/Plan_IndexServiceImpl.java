package com.ogpis.plan.service.impl;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ogpis.plan.dao.Plan_IndexDao;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.Plan_Index;
import com.ogpis.plan.service.Plan_IndexService;

@Service
public class Plan_IndexServiceImpl implements Plan_IndexService {

	@Autowired
	private Plan_IndexDao plan_IndexDao;

	@Override
	public Plan_Index add(Plan plan, IndexManagement index, float targetValue) {
		return plan_IndexDao.add(plan, index, targetValue);
	}

	@Override
	public Plan_Index findByP_I(String planId, String indexId) {
		return plan_IndexDao.findByP_I(planId, indexId);
	}

	@Override
	public void batchAdd(Plan plan, List<IndexManagement> indexs) {
		List<IndexManagement> addIndexs=new ArrayList<IndexManagement>();
		for(IndexManagement index:indexs){
			if(!plan.getIndexIds().contains(index.getId())){
				addIndexs.add(index);
			}
		}
		plan_IndexDao.batchAdd(plan, addIndexs);
	}

	@Override
	public List<Plan_Index> findByTypeAndMineType(String planType, String mineType) {
		return plan_IndexDao.findByPlanTypeAndMineType(planType, mineType);
	}

	@Override
	public Plan_Index findById(String id) {
		return plan_IndexDao.findById(id);
	}

	@Override
	public Plan_Index update(Plan_Index bean) {
		return plan_IndexDao.update(bean);
	}

	@Override
	public void delete(Plan_Index plan_Index) {
		plan_IndexDao.delete(plan_Index);
		
	}
	
	
}
