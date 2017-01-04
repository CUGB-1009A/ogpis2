package com.ogpis.track.ogpis.document.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.service.impl.BaseServiceImpl;
import com.ogpis.track.ogpis.document.dao.PlanDocumentDao;
import com.ogpis.track.ogpis.document.entity.PlanDocument;
import com.ogpis.track.ogpis.document.service.PlanDocumentService;

@Service
public class PlanDocumentServiceImpl extends BaseServiceImpl<PlanDocument, String> 
implements PlanDocumentService{
	
	@Autowired
	protected void setPlanDocumentDao(PlanDocumentDao planDocument) {
		setBaseDao(planDocument);
	}

	protected PlanDocumentDao getPlanDocumentDao() {
		return (PlanDocumentDao) this.baseDao;
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		getPlanDocumentDao().updateAll(idList);
		
	}

	@Override
	public IPageList<PlanDocument> getPlanDocuments(int pageNo, int pageSize) {
		return getPlanDocumentDao().getPlanDocuments(pageNo, pageSize);
	}

	@Override
	public IPageList<PlanDocument> getDeletedDocuments(int pageNo, int pageSize) {
		return getPlanDocumentDao().getDeletedDocuments(pageNo, pageSize);
	}

	@Override
	public void removeAllDocument(ArrayList<String> idList) {
		getPlanDocumentDao().removeAllDocument(idList);
	}

	@Override
	public IPageList<PlanDocument> getDocumentsByPlan(String selectCondition, String inputValue, String selectValue,
			int pageNo, int pageSize) {

		return getPlanDocumentDao().getDocumentsByPlan(selectCondition, inputValue,selectValue,pageNo,pageSize);
	}

	@Override
	public IPageList<PlanDocument> getTrashDocumentsCondition(String condition, int pageNo, int pageSize) {

		return getPlanDocumentDao().getDocumentsByPlan(condition,pageNo,pageSize);
	}

	@Override
	public IPageList<PlanDocument> getOnePlanDocument(int pageNo, int pageSize, String id) {

		return getPlanDocumentDao().getOnePlanDocument(pageNo,pageSize,id);
	}

	@Override
	public List<PlanDocument> findByIds(ArrayList idList) {
		// TODO Auto-generated method stub
		return getPlanDocumentDao().findByIds(idList);
	}

}
