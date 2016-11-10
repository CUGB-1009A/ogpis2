package com.ogpis.demo.service.impl;

import static org.junit.Assert.fail;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.demo.entity.Demo;
import com.ogpis.demo.service.DemoService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class DemoServiceImplTest {

	@Autowired
	private DemoService demoService;

	@Test
	public void testSave() {
		Demo demo = new Demo();
		demo.setField1("test");
		demoService.save(demo);
	}

	@Test
	public void testFindById() {
		String id = "3e15e266-57f2-46b8-abe3-18e2e245c635";
		Demo demo = demoService.findById(id);
		System.out.println(demo.getId());
	}
	
	@Test
	public void testUpdate() {
		String id = "3e15e266-57f2-46b8-abe3-18e2e245c635";
		Demo demo = demoService.findById(id);
		demo.setField1("111");
		demoService.update(demo);
	}

}
