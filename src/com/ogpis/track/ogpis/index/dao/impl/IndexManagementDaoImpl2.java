package com.ogpis.track.ogpis.index.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.common.paging.PageListUtil;
import com.ogpis.track.ogpis.base.common.utils.StringUtil;
import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.index.dao.IndexManagementDao2;
import com.ogpis.track.ogpis.index.entity.IndexManagement2;

@Repository
public class IndexManagementDaoImpl2 extends
		BaseDaoImpl<IndexManagement2, String> implements IndexManagementDao2 {

	@Override
	protected Class<IndexManagement2> getEntityClass() {
		return IndexManagement2.class;
	}

	@Override
	public IPageList<IndexManagement2> getOnePlanIndexs(int pageNo,
			int pageSize, String id) {

		int first = (pageNo - 1) * pageSize;
		List<IndexManagement2> items = this.queryByHql(
				"from IndexManagement m where m.plan.id='" + id
						+ "' order by createTime desc", null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) from IndexManagement m where m.plan.id='" + id
						+ "'", null).toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public List<IndexManagement2> getOnePlanIndexs(String id) {

		List<IndexManagement2> items = this.queryByHql(
				"from IndexManagement m where m.plan.id='" + id
						+ "' order by indexType asc", null);
		return items;
	}

	@Override
	public List<IndexManagement2> findAll() {
		List<IndexManagement2> items = this.queryByHql(
				"from IndexManagement m where deleted=false", null);
		return items;
	}

	@Override
	public List<IndexManagement2> findAllIndexByPriority(String type) {
		// TODO Auto-generated method stub
		List<IndexManagement2> items = this.queryByHql(
				"from IndexManagement m where m.deleted=false and m.type ='"
						+ type + "' order by priority asc", null);
		return items;
	}

	@Override
	public List<IndexManagement2> findByMineType(String mineType) {
		// TODO Auto-generated method stub
		List<IndexManagement2> items = this
				.queryByHql(
						"from IndexManagement m where m.deleted=false and m.type='QG' and m.mineType ='"
								+ mineType + "' order by indexType asc", null);
		return items;
	}

	@Override
	public List<IndexManagement2> findByIds(String[] ids) {
		List<IndexManagement2> items = this.queryByHql(
				"from IndexManagement m where m.deleted=false and m.id in ("
						+ StringUtil.toIdString(ids) + ") order by indexType asc", null);
		return items;
	}
	
}
