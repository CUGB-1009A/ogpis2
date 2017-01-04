package com.ogpis.track.ogpis.plan.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.common.paging.PageListUtil;
import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.plan.dao.PlanDao;
import com.ogpis.track.ogpis.plan.entity.Plan;


@Repository
public class PlanDaoImpl extends BaseDaoImpl<Plan, String>
		implements PlanDao {

	@Override
	protected Class<Plan> getEntityClass() {
		// TODO Auto-generated method stub
		return Plan.class;
	}

	@Override
	public IPageList<Plan> getPlans(boolean isManager,int pageNo, int pageSize, String type, String condition) {
		// TODO Auto-generated method stub
		int first = (pageNo - 1) * pageSize;
        String hql="";
        if(isManager)//管理员查看所有规划
        {
	        if(condition=="")//查询对应type的所有规划
	        	hql = "from Plan where deleted=false and planType='"+type+"' order by createTime desc";	
	        else
	        	hql = "from Plan where deleted=false and planType='"+type+"' and (planName like '%"+condition+"%' or planCode like '%"+condition+"%' or releaseUnit like '%"+condition+"%') order by createTime desc";
        }
        else//普通用户查看已发布规划
        {
        	 if(condition=="")//查询对应type已经发布的所有规划
 	        	hql = "from Plan where deleted=false and released=true and planType='"+type+"' order by createTime desc";	
 	         else
 	        	hql = "from Plan where deleted=false and released=true and planType='"+type+"' and (planName like '%"+condition+"%' or planCode like '%"+condition+"%' or releaseUnit like '%"+condition+"%') order by createTime desc";
         
        }
        	List<Plan> items = this.queryByHql(hql,null, first, pageSize);
		int count = Integer.parseInt(this.findUnique(
				"select count(*) "+hql, null)
				.toString());
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

	@Override
	public void updateAll(ArrayList<String> idList) {
		// TODO Auto-generated method stub
		String temp="";
		System.out.println(idList.toString());
		for(int i=0;i<idList.size();i++)
		{
			temp+=idList.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql = "update Plan as m set m.deleted=true where m.id in ("+temp+")";
		System.out.println(temp);
		this.getHibernateTemplate().bulkUpdate(hql,null);
		
	}

	@Override
	public List<Plan> getAllPlans() {
		@SuppressWarnings("unchecked") 
		List<Plan> items = this 
 				.queryByHql( 
 						"from Plan where deleted=false order by createTime desc", 
 						null); 
		return items; 
	}

	@Override
	public List<Plan> getPlansByType(String type) {
		
		@SuppressWarnings("unchecked") 
		List<Plan> items = this 
 				.queryByHql( 
 						"from Plan where deleted=false and planType='"+type+"' order by createTime desc", 
 						null); 
		return items; 
	}

	public List<Plan> findAll(boolean isManager, String type, String condition) {
		// TODO Auto-generated method stub
        String hql="";
        if(isManager)//管理员查看所有规划
        {
	        if(condition=="")//查询所有规划
	        	hql = "from Plan where deleted=false order by released,releaseDate desc";	
	        else
	        	hql = "from Plan where deleted=false and (planName like '%"+condition+"%' or planCode like '%"+condition+"%' or releaseUnit like '%"+condition+"%') order by released,releaseDate desc";
        }
        else//普通用户查看已发布规划
        {
        	 if(condition=="")//查询对应type已经发布的所有规划
 	        	hql = "from Plan where deleted=false and released=true and planType='"+type+"' order by releaseDate desc";	
 	         else
 	        	hql = "from Plan where deleted=false and released=true and planType='"+type+"' and (planName like '%"+condition+"%' or planCode like '%"+condition+"%' or releaseUnit like '%"+condition+"%') order by releaseDate desc";
         
        }
        	List<Plan> items = this.queryByHql(hql,null);
		return items;
	}

}
