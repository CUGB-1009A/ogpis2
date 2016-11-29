package com.ogpis.track.test;

import java.io.FileNotFoundException;
import java.io.InputStream;
import com.ogpis.track.tools.TempTools;
import net.sf.json.JSON;
import org.dom4j.Document;
import org.junit.Ignore;
import org.junit.Test;

public class TestTools {

	@Ignore
	@Test
	public void test() throws FileNotFoundException {
		String xml=TempTools.loadFile();
		JSON obj=TempTools.parseXml(xml);
		System.out.println(obj.toString());
	}
	
	@Test
	public void test2()
	{
		InputStream in=XMLParse.loadXmlFile(null);
		Document document=XMLParse.createXmlDoucment(in);
		org.json.JSONObject json=XMLParse.parseXmlDocument(document);
		System.out.println(json.toString());
	}
}
