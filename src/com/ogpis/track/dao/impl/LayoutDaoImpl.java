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
		String hql="From Layout";
		return (List<Layout>)this.find(hql);
	}

	@Override
	protected Class<Layout> getEntityClass() {
		// TODO Auto-generated method stub
		return Layout.class;
	}

}
