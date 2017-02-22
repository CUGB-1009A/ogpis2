package com.ogpis.demo.service.impl;


import java.util.HashMap;
import java.util.Map;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.service.DimensionService;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.demo.entity.Demo;
import com.ogpis.demo.service.DemoService;
import com.ogpis.track.webservice.WebServiceParam;
import com.ogpis.track.webservice.WebServiceParams;



@RunWith(SpringJUnit4ClassRunner.class)
// 用于配置spring中测试的环境
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
// 用于指定配置文件所在的位置
public class DemoServiceImplTest {

	@Autowired
	private DemoService demoService;

	@Autowired
	private DimensionService dimensionService;
	


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
	
	@Autowired
	private InterfaceTableService service2;
	@Test
	public void testInterfaceTable(){
		JsonConfig jsonConfig = new JsonConfig();
//		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
//		jsonConfig.setExcludes(new String[]{"dataSource","forecastType","interfaceTables"}); // 过滤不需输出的属性

		/*List<Subject> list=service.findAll();
		JSONArray obj=JSONArray.fromObject(list,jsonConfig);*/
		/*JSONArray array=JSONArray.fromObject(service.findAll());*/
		InterfaceTable t=service2.findById("1ddf4371-add5-4a72-b231-559f5a8eef41");
		System.out.println(t.getName_CN());
		JSONObject obj=JSONObject.fromObject(t,jsonConfig);
		System.out.println(obj.toString());
		/*List<InterfaceTable> list=t.getInterfaceTables();*/
		/*System.out.println(list.size());*/
	}

}
