package com.ogpis.demo.service.impl;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.demo.entity.Demo;
import com.ogpis.demo.service.DemoService;
import com.ogpis.forecast.service.DataCollectionService;
import com.ogpis.track.dao.base.MyTestDao;
import com.ogpis.track.dao.base.TrackUserDao;
import com.ogpis.track.webservice.WebServiceParam;
import com.ogpis.track.webservice.WebServiceParams;
import com.ogpis.track.webservice.data.DataService;

@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class DemoServiceImplTest {

	@Autowired
	private DemoService demoService;
	@Autowired
	private MyTestDao dao;
	@Autowired
	private TrackUserDao userDao;
	@Autowired
	private DataService dataService;
	@Autowired
	private DataCollectionService dataCollectionService;
	@Ignore
	@Test
	public void testhaha(){

	}

	private Logger logger = LoggerFactory.getLogger(DemoServiceImplTest.class);
	@Ignore
	@Test
	public void testSave() {
		Demo demo = new Demo();
		demo.setField1("test");
		demoService.save(demo);
	}
	@Ignore
	@Test
	public void testFindById() {
		String id = "3e15e266-57f2-46b8-abe3-18e2e245c635";
		logger.info("dsf");
		//Demo demo = demoService.findById(id);
		//System.out.println(demo.getId());
		
	}
	@Ignore
	@Test
	public void testUpdate() {
		String id = "3e15e266-57f2-46b8-abe3-18e2e245c635";
		Demo demo = demoService.findById(id);
		demo.setField1("111");
		demoService.update(demo);
	}
	@Test
	public void testDao(){
		/*TrackUser user=new TrackUser();
		user.setName("zwx2");
		user.setPassword("asd1233");
		userDao.insert(user);
		TestEntity entity=new TestEntity();
		entity.setParams("test");
		entity.setResult("hello");
		entity.setUser(user);
		System.out.println(123);
		dao.insert(entity);
		System.out.println(456);*/
		/*TestEntity entity=dao.findById(1);
		System.out.println(entity.getUser().getName());*/
		String params="{\"tableName\":\"test\";\"paramList\":[{\"columsName\":\"zwxasd\",\"relation\":\"=\",\"values\":\"23453325\"}]}";
		/*String tableName="test";
		dataService.getData(tableName, params);*/
		JSONObject obj=JSONObject.fromObject(params);
		Map<String, Class> classMap = new HashMap<String, Class>();
		classMap.put("paramList", WebServiceParam.class);
		WebServiceParams serviceParam=(WebServiceParams) JSONObject.toBean(obj, WebServiceParams.class, classMap);
		System.out.println(serviceParam.getParamList().get(0).getColumsName());
	}
}
