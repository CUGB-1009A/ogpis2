package com.ogpis.system.service.impl;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.system.entity.Role;
import com.ogpis.system.service.RoleService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class RoleServiceImplTest {

	@Autowired
	private RoleService roleService;

	@Test
	public void testSave() {
		for (int i = 1; i < 15; i++) {
			Role role = new Role();
			role.setName("testRole" + i);
			role.setPriority(i);
			roleService.save(role);
		}
	}
	
	@Test
	public void testDelete() {
		String id = "13bdbf00-6886-47c8-8448-9458a7af5122";
		roleService.deleteById(id);
	}
}
