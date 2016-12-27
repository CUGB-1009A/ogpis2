package com.ogpis.system.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.base.common.page.Pagination;
import com.ogpis.base.common.page.SimplePage;
import com.ogpis.system.service.RoleService;
import com.ogpis.system.service.UserService;

@Controller
@RequestMapping("/system/role")
public class RoleAction extends BaseAction {

	private static Logger logger = Logger.getLogger(UserAction.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list() {
		return "system/role/list";
	}

	@RequestMapping(value = "/getData")
	@ResponseBody
	public Object getData(@RequestParam("page") Integer pageNumber,
			@RequestParam("rows") Integer pageSize) throws UnsupportedEncodingException {
		Pagination pagination = roleService.getRoleList(
				SimplePage.cpn(pageNumber), pageSize);
		return this.toJsonTableData(pagination, null, true);
	}

	@RequestMapping(value = "/delete")
	@ResponseBody
	public Object delete(String id) {
		try {
			roleService.deleteById(id);
		} catch (Exception e) {
			return "fail";
		}
		return "success";
	}

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
}
