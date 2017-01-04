package com.ogpis.track.ogpis.plan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;
import com.ogpis.track.ogpis.plan.dao.Plan_IndexDao2;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.plan.entity.Plan_Index2;

@Repository
public class Plan_IndexDaoImpl2 extends BaseDaoImpl<Plan_Index2, String>
		implements Plan_IndexDao2 {

	@Override
	protected Class<Plan_Index2> getEntityClass() {
		// TODO Auto-generated method stub
		return Plan_Index2.class;
	}

	@Override
	public Plan_Index2 add(Plan2 plan, IndexManagement2 index, float targetValue) {
		Plan_Index2 p_i = new Plan_Index2();
		p_i.setPlan(plan);
		p_i.setIndex(index);
		p_i.setTargetValue(targetValue);
		return super.save(p_i);
	}

	@Override
	public void batchAdd(Plan2 plan, List<IndexManagement2> indexs) {
		List<Plan_Index2> plan_Indexs = new ArrayList();
		//去重
		for (IndexManagement2 index : indexs) {
			Plan_Index2 p_i = new Plan_Index2();
			p_i.setPlan(plan);
			p_i.setIndex(index);
			plan_Indexs.add(p_i);
		}
		this.batchSave(plan_Indexs);
	}

	@Override
	public Plan_Index2 findByP_I(String planId, String indexId) {
		String hql = "from Plan_Index where plan.id=? and index.id=?";
		Plan_Index2 plan_index = (Plan_Index2) this.findUnique(hql, planId,
				indexId);
		return plan_index;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Plan_Index2> findByPlanTypeAndMineType(String planType, String mineType) {
		List<Plan_Index2> items = this 
 				.queryByHql( 
 						"from Plan_Index where deleted=false plan.planType='"+planType+"' and index.mineType='"+mineType+"' order by index.indexType", 
 						null); 
		return items; 
	}
}
