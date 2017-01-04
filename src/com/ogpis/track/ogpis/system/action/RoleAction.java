package com.ogpis.track.ogpis.system.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.ogpis.track.ogpis.system.entity.Role;
import com.ogpis.track.ogpis.system.entity.User;
import com.ogpis.track.ogpis.system.service.RoleService;

@Controller
public class RoleAction   extends BaseAction{

	@Autowired
	private RoleService roleService;

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/role/list")
	public String list(HttpServletRequest request, ModelMap model) {
		super.addMenuParams(request, model);
		List<Role> roles = roleService.getList();
		model.addAttribute("roles", roles);
		return "system/role/list";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/role/add")
	public String add() {
		return "system/role/edit";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/role/edit")
	public String edit(HttpServletRequest request, ModelMap model, String id) {
		Role role = this.roleService.findById(id);
		model.addAttribute("role", role);
		return "system/role/edit";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/role/save")
	public String save(Role role, String[] perms, String id, boolean isAdd,
			HttpServletRequest request, ModelMap model) {
		Role bean = null;
		if (isAdd) {
			bean = new Role();
			// bean.setPassword(user.getPassword());
		} else {
			bean = this.roleService.findById(id);
		}
		bean.setName(role.getName());
		bean.setPriority(role.getPriority());
		bean.setIsSuper(role.getIsSuper());
		if (isAdd) {
			roleService.save(bean,Role.splitPerms(perms));
		} else {
			roleService.update(bean,Role.splitPerms(perms));
		}
		return "redirect:list";
	}

	@RequiresPermissions(value={"system:management"})
	@RequestMapping(value = "/system/role/delete")
	public String delete(HttpServletRequest request, ModelMap model, String id) {
		this.roleService.batchMarkDelete(new String[] { id });
		return list(request, model);
	}

}
