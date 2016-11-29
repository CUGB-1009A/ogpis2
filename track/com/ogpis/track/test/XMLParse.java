package com.ogpis.track.test;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.json.JSONObject;

public class XMLParse {
	// 获取输入流
	public static InputStream loadXmlFile(String path) {
		if (path == "" || path == null)
			path = "./resources/data.xml";
		return XMLParse.class.getClassLoader().getResourceAsStream(path);
	}

	// 获取xml文档树
	public static Document createXmlDoucment(InputStream in) {
		SAXReader reader = new SAXReader();
		Document document = null;
		try {
			document = reader.read(in);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return document;
	}

	// 生成json
	public static JSONObject parseXmlDocument(Document document) {
		StringBuilder jsonBuilder = new StringBuilder();
		Element rootElemnt = document.getRootElement();
		if (rootElemnt != null) {
			jsonBuilder.append("{");
			parseElement(jsonBuilder, rootElemnt, false);
			jsonBuilder.append("}");
		}
//		System.out.println(jsonBuilder.toString());
		return new JSONObject(jsonBuilder.toString());
	}

	private static void parseElement(StringBuilder jsonBuilder, Element element,Boolean array) {
		String key = element.getName();
		if (!array)
			jsonBuilder.append("\"" + key + "\":");
		@SuppressWarnings("unchecked")
		List<Element> nodeList = element.elements();
		int size = nodeList.size();
		if (size > 0) {
			jsonBuilder.append("{");
			parseElements(jsonBuilder, nodeList);
			jsonBuilder.append("}");
		} else {
			String value = element.getText();
			if (value == "")
				value = null;
			jsonBuilder.append("\"" + value + "\"");
		}
	}

	private static void parseElements(StringBuilder jsonBuilder,List<Element> nodeList) {
		int size = nodeList.size();
		Map<String, Integer> arrayMap =classifyElements(nodeList);
		int arraySize = arrayMap.keySet().size();
		//当对元素统计分组发现，元素少于实际元素，则一定有数组类型
		if (arraySize < size) {
			Iterator<Entry<String, Integer>> it = arrayMap.entrySet().iterator();
			while (it.hasNext()) {
				Entry<String, Integer> entry = it.next();
				int value=entry.getValue();
				//当元素统计中，元素个数大于1，说明该元素是数组元素
				if (value > 1) {
					String key = entry.getKey();
					//对于数组元素，要提取公共的元素名称，提前添加到字符串中
					jsonBuilder.append("\"" + key + "\":[");
					for (int i = 0,k=0; i < size; ++i) {
						if (nodeList.get(i).getName() == key) {
							//数组元素要传参false，保证在解析数组成员是不再重复添加元素名称
							parseElement(jsonBuilder, nodeList.get(i), true);
							if (i < size - 1&&k<value-1)
								jsonBuilder.append(",");
							++k;
						}
					}
					jsonBuilder.append("]");
				}
				//当元素统计中，元素个数等于1，说明该元素不是数组元素
				else {
					for (int i = 0; i < size; ++i) {
						String key = entry.getKey();
						if (nodeList.get(i).getName() == key) {
							parseElement(jsonBuilder, nodeList.get(i), false);
							break;
						}
					}
				}
				if (it.hasNext())
					jsonBuilder.append(",");
			}
		} 
		//当对元素统计分组发现，元素等于实际元素，则一定没有数组类型
		else {
			for (int i = 0; i < size; ++i) {
				parseElement(jsonBuilder, nodeList.get(i), false);
				if (i < size - 1)
					jsonBuilder.append(",");
			}
		}
	}
	//对elements中重复的元素进行统计分组
	private static Map<String, Integer> classifyElements(List<Element> nodeList){
		int size = nodeList.size();
		Map<String, Integer> arrayMap = new HashMap<String, Integer>();
		for (int i = 0; i < size; ++i) {
			String name = nodeList.get(i).getName();
			if (!arrayMap.containsKey(name))
				arrayMap.put(name, 1);
			else {
				Integer value = arrayMap.get(name);
				arrayMap.put(name, value + 1);
			}
		}
		return arrayMap;
	}
}
