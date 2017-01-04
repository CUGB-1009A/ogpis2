package com.ogpis.track.ogpis.system.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.common.paging.PageListUtil;
import com.ogpis.track.ogpis.base.dao.impl.BaseDaoImpl;
import com.ogpis.track.ogpis.system.dao.MenuItemDao;
import com.ogpis.track.ogpis.system.entity.MenuItem;


@Repository
public class MenuItemDaoImpl extends BaseDaoImpl<MenuItem, String> implements
		MenuItemDao {

	@Override
	protected Class<MenuItem> getEntityClass() {
		return MenuItem.class;
	}

	@SuppressWarnings("unchecked")
	@Override
	/*
	 * 进入菜单管理时，显示所有的一级菜单
	*/
	public List<MenuItem> findTopMenu() {
		return (List<MenuItem>) this.queryByHql("from MenuItem where deleted=false and father.id is null order by priority ASC",
				null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<MenuItem> findByParentId(String id) {		
		String hql = "from MenuItem where deleted=false and father.id="+"\'"+id+"\'"+" order by priority ASC";
		return (List<MenuItem>) this.queryByHql(hql,
				null);
	}

	@Override
	public void updateAll(List<String> list) {
		// TODO Auto-generated method stub
		String temp="";
		for(int i=0;i<list.size();i++)
		{
			temp+=list.get(i)+",";
		}
		temp=temp.substring(0, temp.length()-1);
		String hql = "update MenuItem as m set m.deleted=true where m.id in ("+temp+")";
		this.getHibernateTemplate().bulkUpdate(hql,null);
	}
	

	@Override
	public String menuToJson() {
		// TODO Auto-generated method stub
		List<MenuItem> menuTop = findTopMenu();
		List<MenuItem> menuAllChild = findAllChild();
		//表示通过数据库查询出来的顶级菜单为空
		if(menuTop.size()==0)
			return "{\"state\":\"empty\"}";
		else
		{
			String menu_json = "[";
			for(MenuItem temp:menuTop)
			{
				menu_json+=oneMenuToJson(temp,menuAllChild);
				menu_json+=",";		
			}
			 menu_json=menu_json.substring(0, menu_json.length()-1);
			menu_json+="]";
			return menu_json;
		}
	}
	
	/**
	 * 将temp下的所有菜单写成json
	 * @param temp 
	 * @return
	 */
	public String oneMenuToJson(MenuItem temp ,List<MenuItem> menuAllChild) 
	{
		  List<MenuItem> tempChild = new ArrayList<MenuItem>();
		  for(int i=0;i<menuAllChild.size();i++)
		  {
			  if(temp.getId().equals(menuAllChild.get(i).getFather().getId()))
			  {
				  tempChild.add(menuAllChild.get(i));  
			  }				 
		  }
			  
	  String menu_json="";
      if(tempChild.size()==0)
    	  menu_json+="{\"name\":\""+temp.getName()+"\",\"ID\":\""+temp.getId()+"\",\"url\":\""+temp.getUrl()+"\"}";
      else
      {  
		  menu_json+="{\"name\":\""+temp.getName()+"\",\"ID\":\""+temp.getId()+"\",\"submenu\":[";   	  
    	  for(MenuItem subTemp:tempChild)
    	  {	
    		  if(subTemp.getDeleted()==false)
    		  {
        		  menu_json+=oneMenuToJson(subTemp,menuAllChild);
        		  menu_json+=",";  
    		  }  		  
    	  } 
      	   menu_json=menu_json.substring(0, menu_json.length()-1);
      	   menu_json+="]}"; 
      }
	   	   return menu_json;
	}
    /*
     * 查找所有deleted=false的菜单
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<MenuItem> findAllChild() {	
			String hql = "from MenuItem where deleted=false and father.id is not null order by priority ASC ";
			return (List<MenuItem>) this.queryByHql(hql,
					null);
	}

	@SuppressWarnings("unchecked")
	@Override
	public IPageList<MenuItem> getByParentId(String id, int pageNo, int pageSize) {

		int first = (pageNo - 1) * pageSize;
		List<MenuItem> items;
		int count;
		if(id=="")
		{
			System.out.println("1234567890");
		items = this.queryByHql("from MenuItem where deleted=false and father.id is null order by priority ASC", null, first, pageSize);
		count = Integer.parseInt(this.findUnique("select count(*) from MenuItem where deleted=false and father.id is null", null).toString());			
		}
		else
		{
			System.out.println(123457);
			items = this.queryByHql("from MenuItem where deleted=false and father.id=\'"+id+"\' order by priority ASC", null, first, pageSize);
			count = Integer.parseInt(this.findUnique("select count(*) from MenuItem where deleted=false and father.id=\'"+id+"\'", null).toString());				
		}
		System.out.println("count: " + count);
		return PageListUtil.getPageList(count, pageNo, items, pageSize);
	}

}
