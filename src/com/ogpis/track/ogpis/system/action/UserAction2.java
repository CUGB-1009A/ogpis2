package com.ogpis.track.ogpis.system.action;

import java.io.IOException;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.track.ogpis.base.action.BaseAction;
import com.ogpis.track.ogpis.base.common.paging.IPageList;
import com.ogpis.track.ogpis.base.common.paging.PageListUtil;
import com.ogpis.track.ogpis.system.entity.Role2;
import com.ogpis.track.ogpis.system.entity.User2;
import com.ogpis.track.ogpis.system.service.RoleService2;
import com.ogpis.track.ogpis.system.service.UserService2;

@Controller
public class UserAction2 extends BaseAction {

	@Autowired
	private UserService2 userService;
	@Autowired
	private RoleService2 roleService;

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/user2/list")
	public String list(HttpServletRequest request, ModelMap model) {
		super.addMenuParams(request, model);
		int pageNo = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_NO_NAME, PageListUtil.DEFAULT_PAGE_NO);
		int pageSize = ServletRequestUtils.getIntParameter(request,
				PageListUtil.PAGE_SIZE_NAME, PageListUtil.DEFAULT_PAGE_SIZE);
		IPageList<User2> users = userService.getAllUsers(pageNo, pageSize);
		model.addAttribute("users", users);
		return "system/user2/list";
	}

	@RequestMapping(value = "/system/user2/view", method = RequestMethod.GET)
	public String view(HttpServletRequest request, ModelMap model, String id) {
		User2 user = this.userService.findById(id);
		model.addAttribute("user", user);
		return "system/user2/view";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/user2/add", method = RequestMethod.GET)
	public String add(HttpServletRequest request,ModelMap model) {
		String same = request.getParameter("same");
		model.addAttribute("same", same);
		return "system/user2/edit";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/user2/edit", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		String same = request.getParameter("same");
		User2 user = this.userService.findById(id);
		List<Role2> roleList = roleService.getList();
		Set<Role2> userRoleList = user.getRoles();
		model.addAttribute("user", user);
		model.addAttribute("roleList", roleList);
		model.addAttribute("userRoleList", userRoleList);
		System.out.println(same);
		model.addAttribute("same", same);
		return "system/user2/edit";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/user2/save", method = RequestMethod.GET)
	public String save(HttpServletRequest request, ModelMap model, User2 user,
			String id, String[] roleIds, boolean isAdd) {
		List<User2> temp ;
		temp = userService.findUserByName(user.getName());
		User2 bean = null;
		if (isAdd) {
			bean = new User2();
			bean.setPassword(user.getPassword());
			
			if(temp.size()>0)//该用户名存在
			{
				return "redirect:add?same=0";
			}
		} else {
			bean = this.userService.findById(id);
			if(!bean.getName().equals(user.getName())&&temp.size()>0)
			{
				return "redirect:edit?id="+id+"&&same=0";
			}
		}
		bean.setLoginId(user.getLoginId());
		bean.setName(user.getName());
		// 更新角色
		bean.getRoles().clear();// 先清空角色
		if (roleIds != null) {
			for (String rid : roleIds) {
				System.out.println("rid: "+rid);
				bean.addToRoles(roleService.findById(rid));
			}
		}

		if (isAdd) {
			userService.save(bean);
		} else {
			userService.update(bean);
		}
		return "redirect:list";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/user2/delete")
	public String delete(HttpServletRequest request, ModelMap model, String id) {
		System.out.println("delete");
		System.out.println("id: " + id);
		this.userService.batchMarkDelete(new String[] { id });
		return list(request, model);
	}
	
	@RequestMapping(value = "/system/user2/changePassword")
	public void changePassword(HttpServletRequest request, HttpServletResponse response , ModelMap model) throws IOException {
		 String password = request.getParameter("password");
		 String currentUserName = request.getUserPrincipal().getName();
		 User2 user = userService.findByUserName(currentUserName);
		 user.setPassword(password);
		 userService.update(user);
	 	 String result = "{\"result\":\"success\"}";
	 	 response.setContentType("application/json");
	 	 response.setCharacterEncoding("utf-8");
	 	 response.getWriter().write(result);
	}

}
