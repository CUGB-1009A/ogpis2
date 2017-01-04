package com.ogpis.track.ogpis.plan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.index.entity.IndexManagement;
import com.ogpis.track.ogpis.plan.dao.Plan_IndexDao;
import com.ogpis.track.ogpis.plan.entity.Plan;
import com.ogpis.track.ogpis.plan.entity.Plan_Index;

@Repository
public class Plan_IndexDaoImpl extends BaseDaoImpl<Plan_Index, String>
		implements Plan_IndexDao {

	@Override
	protected Class<Plan_Index> getEntityClass() {
		// TODO Auto-generated method stub
		return Plan_Index.class;
	}

	@Override
	public Plan_Index add(Plan plan, IndexManagement index, float targetValue) {
		Plan_Index p_i = new Plan_Index();
		p_i.setPlan(plan);
		p_i.setIndex(index);
		p_i.setTargetValue(targetValue);
		return super.save(p_i);
	}

	@Override
	public void batchAdd(Plan plan, List<IndexManagement> indexs) {
		List<Plan_Index> plan_Indexs = new ArrayList();
		//去重
		for (IndexManagement index : indexs) {
			Plan_Index p_i = new Plan_Index();
			p_i.setPlan(plan);
			p_i.setIndex(index);
			plan_Indexs.add(p_i);
		}
		this.batchSave(plan_Indexs);
	}

	@Override
	public Plan_Index findByP_I(String planId, String indexId) {
		String hql = "from Plan_Index where plan.id=? and index.id=?";
		Plan_Index plan_index = (Plan_Index) this.findUnique(hql, planId,
				indexId);
		return plan_index;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Plan_Index> findByPlanTypeAndMineType(String planType, String mineType) {
		List<Plan_Index> items = this 
 				.queryByHql( 
 						"from Plan_Index where deleted=false plan.planType='"+planType+"' and index.mineType='"+mineType+"' order by index.indexType", 
 						null); 
		return items; 
	}
}
