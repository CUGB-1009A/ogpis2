package com.ogpis.system.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.ogpis.system.entity.User;
import com.ogpis.system.service.RoleService;
import com.ogpis.system.service.UserService;

@Controller
@RequestMapping("/system/user")
public class UserAction extends BaseAction {

	private static Logger logger = Logger.getLogger(UserAction.class);

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(HttpServletRequest request, ModelMap model) {
		return "system/user/list";
	}

	@RequestMapping(value = "/getData")
	@ResponseBody
	public void getData(@RequestParam("page") Integer pageNumber,
			@RequestParam("rows") Integer pageSize,HttpServletResponse response) throws IOException{
		System.out.println("pageNumber:" + pageNumber);
		System.out.println("pageSize:" + pageSize);
		Pagination pagination = userService.getUserList(
				SimplePage.cpn(pageNumber), pageSize);
		response.setContentType("application/json");
	    response.setCharacterEncoding("utf-8");
	    response.getWriter().write(this.toJsonTableData(pagination, null, true));
	}

	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
}
