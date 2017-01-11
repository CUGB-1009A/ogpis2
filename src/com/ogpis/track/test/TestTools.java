package com.ogpis.track.test;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.ogpis.track.dao.MyTestDaoImpl;
import com.ogpis.track.dao.base.MyTestDao;
import com.ogpis.track.entity.TestEntity;
import com.ogpis.track.entity.TrackUser;
import com.ogpis.track.tools.TempTools;
import com.ogpis.track.webservice.WebServiceParam;
import com.ogpis.track.webservice.WebServiceParams;

import org.dom4j.Document;
import org.json.JSONObject;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.ApplicationContext;

public class TestTools {

	@Ignore
	@Test
	public void test() throws FileNotFoundException {
		String xml = TempTools.loadFile();
		JSONObject obj = TempTools.parseXml(xml);
		System.out.println(obj.toString());
	}

	@Ignore
	@Test
	public void test2() {
		InputStream in = XMLParse.loadXmlFile(null);
		Document document = XMLParse.createXmlDoucment(in);
		org.json.JSONObject json = XMLParse.parseXmlDocument(document);
		System.out.println(json.toString());
	}
	@Ignore
	@Test
	public void test3() throws InterruptedException {
		WebServiceParam param = new WebServiceParam();
		param.setColumsName("zwx");
		param.setRelation("=");
		param.setValues("lllas");
		List<WebServiceParam> array=new ArrayList<WebServiceParam>();
		array.add(param);
		array.add(param);
		array.add(param);
		WebServiceParams params = new WebServiceParams(array);
		params.add(param);
		System.out.println(params.toString());
	}
	@Test
	public void testDao(){
		TrackUser user=new TrackUser();
		user.setName("zwx");
		user.setPassword("asd123");
		TestEntity entity=new TestEntity();
		entity.setParams("test");
		entity.setResult("hello");
		/*entity.setUser(user);*/
		/*ApplicationContext context=new XML*/
		MyTestDao dao=new MyTestDaoImpl();
		dao.insert(entity);
	}
}
