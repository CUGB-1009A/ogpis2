package com.ogpis.track.ogpis.document.dao;

import java.util.ArrayList;
import java.util.List;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.dao.BaseDao;
import com.ogpis.track.ogpis.document.entity.PlanDocument2;

public interface PlanDocumentDao extends BaseDao<PlanDocument2,String> {

	void updateAll(ArrayList<String> idList);

	IPageList<PlanDocument2> getPlanDocuments(int pageNo, int pageSize);

	IPageList<PlanDocument2> getDeletedDocuments(int pageNo, int pageSize);

	void removeAllDocument(ArrayList<String> idList);

	IPageList<PlanDocument2> getDocumentsByPlan(String selectCondition, String inputValue, String selectValue,
			int pageNo, int pageSize);

	IPageList<PlanDocument2> getDocumentsByPlan(String condition, int pageNo, int pageSize);

	IPageList<PlanDocument2> getOnePlanDocument(int pageNo, int pageSize, String id);

	List<PlanDocument2> findByIds(ArrayList idList);

}
