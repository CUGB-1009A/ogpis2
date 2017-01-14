package com.ogpis.plan.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.base.common.page.Pagination;
import com.ogpis.plan.dao.PlanDao;
import com.ogpis.plan.dao.PlanDocumentDao;
import com.ogpis.plan.entity.Plan;
import com.ogpis.plan.entity.PlanDocument;
import com.ogpis.plan.service.PlanDocumentService;
import com.ogpis.plan.service.PlanService;

@Service
public class PlanDocumentServiceImpl implements PlanDocumentService {

	@Autowired
	PlanDocumentDao planDocumentDao;
	
	@Override
	public void updateAll(ArrayList<String> idList) {
		planDocumentDao.updateAll(idList);
		
	}

	@Override
	public Pagination getPlanDocuments(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return planDocumentDao.getPlanDocuments(pageNo, pageSize);
	}

	@Override
	public Pagination getDeletedDocuments(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return planDocumentDao.getDeletedDocuments(pageNo, pageSize);
	}

	@Override
	public void removeAllDocument(ArrayList<String> idList) {
		planDocumentDao.removeAllDocument(idList);
		
	}

	@Override
	public Pagination getDocumentsByPlan(String selectCondition, String inputValue, String selectValue, int pageNo,
			int pageSize) {
		return planDocumentDao.getDocumentsByPlan(selectCondition, inputValue, selectValue, pageNo, pageSize);
	}

	@Override
	public Pagination getDocumentsByPlan(String condition, int pageNo, int pageSize) {
		return planDocumentDao.getDocumentsByPlan(condition, pageNo, pageSize);
	}

	@Override
	public Pagination getOnePlanDocument(int pageNo, int pageSize, String id) {
		return planDocumentDao.getOnePlanDocument(pageNo, pageSize, id);
	}

	@Override
	public List<PlanDocument> findByIds(ArrayList idList) {
		return planDocumentDao.findByIds(idList);
	}

	@Override
	public PlanDocument save(PlanDocument planDocument) {
		// TODO Auto-generated method stub
		System.out.println("service");
		return planDocumentDao.save(planDocument);
	}

	@Override
	public PlanDocument update(PlanDocument planDocument) {
		// TODO Auto-generated method stub
		return planDocumentDao.update(planDocument);
	}

}
