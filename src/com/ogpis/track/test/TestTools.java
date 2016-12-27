package com.ogpis.track.test;

import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import com.ogpis.track.service.WebServiceParam;
import com.ogpis.track.service.WebServiceParams;
import com.ogpis.track.tools.TempTools;

import org.dom4j.Document;
import org.json.JSONObject;
import org.junit.Ignore;
import org.junit.Test;

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

	@Test
	public void test3() throws InterruptedException {
		/*WebServiceParam param = new WebServiceParam();
		param.setColumsName("zwx");
		param.setRelation("=");
		param.setValues("lllas");
		List<WebServiceParam> array=new ArrayList<WebServiceParam>();
		array.add(param);
		array.add(param);
		array.add(param);
		WebServiceParams params = new WebServiceParams(array);
		params.add(param);
		System.out.println(params.toString());*/
		testFX(new Double[][]{{2233.0}});
		synchronized (this) {
			this.notify();
		}
		
	}
	
	private static <T> void testFX(T[][] obj){
		System.out.println(obj[0][0]);
	}
}
