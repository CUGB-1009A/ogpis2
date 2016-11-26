package com.ogpis.system.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ogpis.base.action.BaseAction;
import com.ogpis.system.entity.User;
import com.ogpis.system.service.RoleService;
import com.ogpis.system.service.UserService;

@Controller
@RequestMapping("/system/user")
public class UserAction extends BaseAction {

	private static Logger logger = Logger.getLogger(UserAction.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, ModelMap model) {
		List<User> users = userService.getAllUsers();
		model.addAttribute("users", users);
		return "system/user/list";
	}

	@RequestMapping(value = "/getData")
	@ResponseBody
	public Object getData() {
		List<User> users = userService.getAllUsers();
		return this.toJsonTableData(users, null, true);
	}

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
}
