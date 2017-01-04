package com.ogpis.track.ogpis.system.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.system.entity.MenuItem2;
import com.ogpis.track.ogpis.system.service.MenuItemService2;


@Controller
public class MenuAction2 {
	
	@Autowired
	private MenuItemService2 MenuItemService;
	@SuppressWarnings("rawtypes")
	private ArrayList list=new ArrayList();
	
	/*
	 * 列表导航栏--菜单管理--按钮的入口，和下级菜单的响应
	 */
	@RequestMapping(value = "/menu2/list")
	public String list(String pageId,HttpServletRequest request,String pageNo,String id) {
		IPageList<MenuItem2> menus = MenuItemService.getByParentId(id,Integer.parseInt(pageNo),6);
		request.setAttribute("pageId", id);
		request.setAttribute("menus", menus);	
		request.setAttribute("pageNo", pageNo);
		if(id!="")
			{ 
				MenuItem2 menuItemtemp = MenuItemService.findById(id).getFather();
				if(menuItemtemp==null) 
					request.setAttribute("backId", "");
				else
					request.setAttribute("backId", menuItemtemp.getId());
			}
		return "menu/menuList";
	}
	
	
	/*
	 * 列表导航栏--菜单管理--按钮的入口，和下级菜单的响应
	 */
	@RequestMapping(value = "/menu2/fenye")
	public String fenye(String pageId,HttpServletRequest request,String pageNo) {
		IPageList<MenuItem2> menus = MenuItemService.getByParentId(pageId,Integer.parseInt(pageNo),6);
		request.setAttribute("pageId",pageId);
		request.setAttribute("menus", menus);	
		request.setAttribute("pageNo", pageNo);
		if(pageId!="")
			{ 
				MenuItem2 menuItemtemp = MenuItemService.findById(pageId).getFather();
				if(menuItemtemp==null) 
					request.setAttribute("backId", "");
				else
					request.setAttribute("backId", menuItemtemp.getId());
			}
		return "menu/menuList";
	}
	

	/*
	 * 到添加或修改页面(共用一个界面)，id==""则为新建,同时设置flag=1，id！=""则为修改（同时准备回显数据）
	 */
	@RequestMapping(value = "menu/toAddMenuUI", method = RequestMethod.GET)
	public String toAddMenuUI(String id,String add,String pageId,HttpServletRequest req,String pageNo) {
	
		if(add.equals("1"))//新建
		{
			req.setAttribute("flag", 1);
		}	       		
		else//修改
		{
			MenuItem2 menuItem = MenuItemService.findById(id);
			req.setAttribute("menuItem",menuItem);//回显数据
			req.setAttribute("flag", 2);	
		}
		req.setAttribute("pageId", pageId);
		req.setAttribute("pageNo", pageNo);	
		return "menu/menuUI";
	}
	
	@RequestMapping(value = "menu/save", method = RequestMethod.GET)
	public String save(String pageId,String id,HttpServletRequest request,MenuItem2 menuItem,String pageNo) 
	{		
		if(request.getParameter("flag").equals("1"))//新建一个菜单
		    {
				if(pageId=="")//首页新建，回到此菜单下的最后一页
					menuItem.setFather(null);
				else
					menuItem.setFather(MenuItemService.findById(pageId));	
				
				MenuItemService.save(menuItem);
		    }
		else//修改一个菜单
			{
				MenuItem2 menuItem_old = MenuItemService.findById(id);
				menuItem_old.setName(menuItem.getName());
				menuItem_old.setDescription(menuItem.getDescription());
				menuItem_old.setPriority(menuItem.getPriority());
				menuItem_old.setUrl(menuItem.getUrl());
				MenuItemService.update(menuItem_old);	
			}
		IPageList<MenuItem2> menus  = MenuItemService.getByParentId(pageId, Integer.parseInt(pageNo),6);
		if(pageId!="")
			{ 
				MenuItem2 menuItemtemp = MenuItemService.findById(pageId).getFather();
				if(menuItemtemp==null) 
					request.setAttribute("backId", "");
				else
				{
					request.setAttribute("backId", menuItemtemp.getId());
				}					
			}
		request.setAttribute("menus", menus);
		request.setAttribute("pageNo", pageNo);
		request.setAttribute("pageId", pageId);
		return "menu/menuList";
	}
	
	/*
	 * 软删除，设置deleted为true，同时删除所有子目录（也是软删除）
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/menu2/deleteMenu", method = RequestMethod.GET)
	public String deleteMenu(HttpServletRequest request,String pageId,String id,String pageNo) {		
		/*
		 * 批量软删除本节点及其下的所有节点
		 */
		MenuItem2 menuItem = MenuItemService.findById(id);
		deleteAllMenu(menuItem);
		MenuItemService.updateAll(list);
		IPageList<MenuItem2> menus = MenuItemService.getByParentId(pageId, Integer.parseInt(pageNo),6);
		request.setAttribute("pageNo", pageNo);
		if(menus.getItemCount()%6==0&&menus.getPageCount()==Integer.parseInt(pageNo)-1)
		{
			menus = MenuItemService.getByParentId(pageId, Integer.parseInt(pageNo)-1,6);			
		    request.setAttribute("pageNo", Integer.parseInt(pageNo)-1);
		}
		request.setAttribute("menus", menus);		
		request.setAttribute("pageId", pageId);
		request.setAttribute("id", pageId);
			if(pageId!="")
				{ 
					MenuItem2 menuItemtemp = MenuItemService.findById(pageId).getFather();
					if(menuItemtemp==null) 
						request.setAttribute("backId", "");
					else
						request.setAttribute("backId", menuItemtemp.getId());
				}
		return "menu/menuList";
	}

	@RequestMapping(value = "menu/previousMenu", method = RequestMethod.GET)
	public String previousMenu(String pageId,HttpServletRequest req,String pageNo) {	
		IPageList<MenuItem2> menus = MenuItemService.getByParentId(pageId, Integer.valueOf(pageNo),6);
		req.setAttribute("pageNo", pageNo);	   
	    req.setAttribute("pageId", pageId);
		if(pageId!="")
			{ 
				MenuItem2 menuItem = MenuItemService.findById(pageId).getFather();
				if(menuItem==null) 
					req.setAttribute("backId", "");
				else
					req.setAttribute("backId", menuItem.getId());
			}
		    
		req.setAttribute("menus", menus);
		return "menu/menuList";
	}
	
	/*
	 * 删除本节点及下所有子节点
	 */
	@SuppressWarnings("unchecked")
	private void deleteAllMenu(MenuItem2 menuItem)
	{
		if(menuItem.getChildren().size()==0)
		{
			list.add("\'"+menuItem.getId()+"\'");
		}		
		else
		{	
			list.add("\'"+menuItem.getId()+"\'");
			for(MenuItem2 temp:menuItem.getChildren())
			{				
				deleteAllMenu(temp);
			}
		}
      }

		@RequestMapping(value = "menu/editToList", method = RequestMethod.GET)
		public String editToList(String pageId,HttpServletRequest req,String pageNo) {
			IPageList<MenuItem2> menus = MenuItemService.getByParentId(pageId, Integer.parseInt(pageNo),6);
			req.setAttribute("pageNo", pageNo);		
			req.setAttribute("menus", menus);
			req.setAttribute("pageId", pageId);
			if(pageId!="")
				{ 
					MenuItem2 menuItem = MenuItemService.findById(pageId).getFather();
					if(menuItem==null) 
						req.setAttribute("backId", "");
					else
						req.setAttribute("backId", menuItem.getId());
				}
			return "menu/menuList";			
			}

}
