package com.ogpis.track.ogpis.system.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ogpis.track.ogpis.system.entity.MenuItem;
import com.ogpis.track.ogpis.system.service.MenuItemService;
import com.ogpis.track.ogpis.system.service.UserService;

@Controller
public class TestAction {

	@Autowired
	private MenuItemService menuItemService;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test() {
//		System.out.println("test");
//		String fatherId = "ecb1518b-dacc-46b4-be20-22bdce664c70";
//		MenuItem menuItemFather = menuItemService.findById(fatherId);
//		System.out.println("menuItemFather.getChildren().size(): "
//				+ menuItemFather.getChildren().size());

		return "test";
	}
	
	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String test1() {
		System.out.println("test");
		String id = "5cf9abf6-55c3-4e97-9d93-a54ac82c0671";
		MenuItem menuItem = menuItemService.findById(id);
		System.out.println("menuItem.getFather().getChildren(): "
				+ menuItem.getFather().getChildren());

		return "test";
		//master分支提交修改
		//master分支提交修改2
		//master分支提交修改3
	}

}
