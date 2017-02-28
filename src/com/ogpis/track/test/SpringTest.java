package com.ogpis.track.test;

import java.util.List;

import net.sf.json.JsonConfig;

import org.json.JSONArray;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ogpis.track.dao.LayoutDao;
import com.ogpis.track.entity.Layout;
import com.ogpis.track.service.LayoutService;
import com.ogpis.track.service.TargetService;
import com.ogpis.track.webservice.data.DataService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:config/application-context.xml" })
public class SpringTest extends AbstractJUnit4SpringContextTests {
	@Autowired
	private DataService dataService;
	@Autowired
	private LayoutService layoutService;
	@Autowired
	private TargetService targetService;
	@Ignore
	@Test
	public void test() {
		String params = "{\"tableName\":\"test\";\"paramList\":[{\"columsName\":\"zwxasd\",\"relation\":\"=\",\"values\":\"23453325\"}]}";
		dataService.getData(params);
		System.out.println("ok");
	}
	@Autowired
	private LayoutDao layoutDao;
	@Test
	public void test2(){
//		List<Layout> layouts=layoutDao.findByCondition("", "", "", "");
		List<Layout> layouts=layoutDao.findByPlanId("1");
		System.out.println(new JSONArray(layouts).toString());
	}
}
