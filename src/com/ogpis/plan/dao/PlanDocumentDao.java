package com.ogpis.plan.dao;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.plan.entity.IndexManagement;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.PlanDocument;

public interface PlanDocumentDao {
	void updateAll(ArrayList<String> idList);
	Pagination getPlanDocuments(int pageNo,int pageSize);
	Pagination getDeletedDocuments(int pageNo,int pageSize);
	void removeAllDocument(ArrayList<String> idList);
	Pagination getDocumentsByPlan(String selectCondition,String inputValue,String selectValue,
			int pageNo,int pageSize);
	Pagination getDocumentsByPlan(String condition,int pageNo,int pageSize);
	Pagination getOnePlanDocument(int pageNo,int pageSize,String id);
	List<PlanDocument> findByIds(ArrayList idList);
	
	PlanDocument save(PlanDocument planDocument);
	PlanDocument update(PlanDocument planDocument);
}
