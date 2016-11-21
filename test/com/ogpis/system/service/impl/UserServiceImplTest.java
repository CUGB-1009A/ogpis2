package com.ogpis.system.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.system.entity.User;
import com.ogpis.system.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
//用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
//用于指定配置文件所在的位置
public class UserServiceImplTest {

	@Autowired
	private UserService userService;
	
	@Test
	public void testSave() {
		User user = new User();
		user.setLoginId("test");
		userService.save(user);
	}

}
