package com.ogpis.track.tools;

import java.util.Iterator;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class MyJsonParse {
	@SuppressWarnings({ "unchecked", "unused" })
	private static JSONArray parseToChartData(JSONArray jsonObj,
			JSONObject model, String... field) {
		System.out.println(jsonObj.toString());
		JSONArray resultObj = new JSONArray();
		resultObj.add(new JSONObject());
		/* resultObj.put("数据", new JSONArray()); */
		Integer size = jsonObj.size();
		for (int i = 0; i < size; ++i) {
			JSONObject obj = jsonObj.getJSONObject(i);
			if (field == null)
				field = new String[] { (String) obj.keys().next() };
			Object keyValue = obj.get(field[0]);
			Iterator<String> it = model.keys();

			for (int j = 0; j < resultObj.size(); ++j) {
				Object tempObj0 = resultObj.get(j);
				if (tempObj0 == null) {
					tempObj0 = new JSONObject();
					resultObj.add(tempObj0);
				}
				JSONObject tempObj = (JSONObject) resultObj.get(j);

				if (tempObj.get(field[0]) == null) {
					tempObj.put(field[0], new JSONArray());
					/* tempObj.getJSONArray(field[0]).add(keyValue); */
				}
				if (!tempObj.getJSONArray(field[0]).contains(keyValue)) {
					while (it.hasNext()) {
						String key = it.next();
						Object item = obj.get(key);

						if (tempObj.get(key) == null) {
							tempObj.put(key, new JSONArray());
						}
						JSONArray array = tempObj.getJSONArray(key);
						if (item == null)
							array.add(null);
						else
							array.add(item);
					}
					break;
				} else if (j == resultObj.size() - 1) {
					resultObj.add(new JSONObject());
				}
			}
		}
		return resultObj;
	}

	@SuppressWarnings("finally")
	public static String parseJsonToTable(Object jsons) {
		StringBuilder builder = new StringBuilder();
		try {
			builder.append("{");
			if (jsons != null) {
				JSONArray array = JSONArray.fromObject(jsons);
				int size = array.size();
				builder.append("\"total\":" + size + ",");
				builder.append("\"rows\":" + array.toString());
			} else {
				builder.append("\"total\":0,rows:[]");
			}
			builder.append("}");
		} catch (Exception e) {
			e.printStackTrace();
			builder.delete(0, builder.length())
					.append("{\"status\":\"error\"}");
		} finally {
			return builder.toString();
		}
	}

	@SuppressWarnings("finally")
	public static String parseJsonToEChart(Object jsons,EChartParams params) {
		JSONObject resultJson=new JSONObject();
		try {
			if (jsons != null) {
				JSONArray array = JSONArray.fromObject(jsons);
				int size = array.size();
				JSONArray xData=new JSONArray();
				JSONArray seiresData=new JSONArray();
				String xAxisName=params.getxAxisName();
				String yAxisName=params.getyAxisName();
				for(int i=0;i<size;i++){
					JSONObject tempObject=array.getJSONObject(i);
					xData.add(tempObject.getString(xAxisName));
					seiresData.add(tempObject.getDouble(yAxisName));
				}
				JSONObject xAxis=new JSONObject();
				xAxis.put("xName", params.getxAxisUnit());
				xAxis.put("xData", xData);
				resultJson.put("xAxis", xAxis);
				JSONObject yAxis=new JSONObject();
				yAxis.put("yName", params.getyAxisUnit());
				resultJson.put("yAxis", yAxis);
				resultJson.put("seiresData", seiresData);
			} else {
				JSONObject xAxis=new JSONObject();
				xAxis.put("xName", params.getxAxisUnit());
				xAxis.put("xData", "[]");
				resultJson.put("xAxis", xAxis);
				JSONObject yAxis=new JSONObject();
				yAxis.put("yName", params.getyAxisUnit());
				resultJson.put("yAxis", yAxis);
				resultJson.put("seiresData", "[]");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultJson.clear();
			resultJson.put("status", "error");
		} finally {
			return resultJson.toString();
		}
	}
	
	public static EChartParams getEChartParams(JSONObject jsonObj){
		String xAxisName=jsonObj.getString("xAxisName");
		String xAxisUnit=jsonObj.getString("xAxisUnit");
		String yAxisName=jsonObj.getString("yAxisName");
		String yAxisUnit=jsonObj.getString("yAxisUnit");
		return new EChartParams(xAxisName,xAxisUnit,yAxisName,yAxisUnit);
	}
}
