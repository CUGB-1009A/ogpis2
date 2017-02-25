package com.ogpis.demo.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
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

import com.ogpis.data.entity.DataSource;
import com.ogpis.data.entity.Dimension;
import com.ogpis.data.entity.InterfaceTable;
import com.ogpis.data.entity.Subject;
import com.ogpis.data.service.DataSourceService;
import com.ogpis.data.service.DimensionService;
import com.ogpis.data.service.InterfaceTableService;
import com.ogpis.data.service.SubjectService;
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
	@Ignore
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
	private SubjectService service;
	@Ignore
	@Test
	public void SubjectService(){
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.setExcludes(new String[]{"dataSource","forecastType","interfaceTables"}); // 过滤不需输出的属性

		/*List<Subject> list=service.findAll();
		JSONArray obj=JSONArray.fromObject(list,jsonConfig);*/
		/*JSONArray array=JSONArray.fromObject(service.findAll());*/
		Subject sb=service.findById("2");
		JSONObject obj=JSONObject.fromObject(sb,jsonConfig);
		System.out.println(obj.toString());
		List<InterfaceTable> list=sb.getInterfaceTables();
		System.out.println(list.size());
		
	}
	@Autowired
	private InterfaceTableService service2;
	@Ignore
	@Test
	public void testInterfaceTable(){
		JsonConfig jsonConfig = new JsonConfig();
//		jsonConfig.setIgnoreDefaultExcludes(false);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
//		jsonConfig.setExcludes(new String[]{"dataSource","forecastType","interfaceTables"}); // 过滤不需输出的属性

		/*List<Subject> list=service.findAll();
		JSONArray obj=JSONArray.fromObject(list,jsonConfig);*/
		/*JSONArray array=JSONArray.fromObject(service.findAll());*/
		InterfaceTable t=service2.findById("1");
		System.out.println(t.getName_CN());
		JSONObject obj=JSONObject.fromObject(t,jsonConfig);
		System.out.println(obj.toString());
		/*List<InterfaceTable> list=t.getInterfaceTables();*/
		/*System.out.println(list.size());*/
	}
	@Autowired
	private DataSourceService service3;
	@Ignore
	@Test
	public void testDataSourceSerice(){
		DataSource ds1=service3.findById("370459c4-2042-4427-9803-5fd9e30a4c6c");
		/*DataSource ds2=service3.findById("b988bec4-2335-47e4-8964-32e6a5bb284f");*/
		List<DataSource> list=new ArrayList<DataSource>();
		list.add(service3.findById("d0bc7291-6710-48fc-b6b5-9018572e382f"));
		list.add(service3.findById("df53f224-1c3c-4823-9d06-52cfdae2293c"));
		ds1.setChildren(list);
		String result=service3.updateDataSource(ds1);
		System.out.println(result);
	}
	
	@Autowired
	private DimensionService service4;
	@Test
	public void test23(){
		
	}
}
