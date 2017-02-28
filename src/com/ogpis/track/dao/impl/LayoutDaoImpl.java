package com.ogpis.track.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.sf.json.JSONObject;

import com.ogpis.base.common.hibernate3.HibernateBaseDao;
import com.ogpis.track.dao.LayoutDao;
import com.ogpis.track.entity.Layout;
@Repository
public class LayoutDaoImpl extends HibernateBaseDao<Layout, String> implements LayoutDao{

	@SuppressWarnings("unchecked")
	@Override
	public List<Layout> find(JSONObject params) {
		// TODO Auto-generated method stub  "select x,y," + params.getString("index")+ 
//		String hql ="from Layout where company='" + params.getString("company")
//				+ "' and year=" + params.getInt("year");
		String hql="From Layout where delete=false";
		return (List<Layout>)this.find(hql);
	}

	@Override
	protected Class<Layout> getEntityClass() {
		// TODO Auto-generated method stub
		return Layout.class;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Layout> findByPlanId(String planId) {
		// TODO Auto-generated method stub
		String hql="From Layout where planId=?";
		return  (List<Layout>) this.find(hql,planId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Layout> findByCondition(String planId,String field,String relation,Object value) {
		// TODO Auto-generated method stub
		String hql="From Layout where planId =? and "+field+relation+"?";
		return  (List<Layout>) this.find(hql,planId,value);
	}

}
