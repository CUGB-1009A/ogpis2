package com.ogpis.track.webservice;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

public class WebServiceParams {
	private String tableName;
	private List<WebServiceParam> paramList=new ArrayList<WebServiceParam>();;
	
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public WebServiceParams(List<WebServiceParam> paramList) {
		this.paramList = paramList;
	}

	public WebServiceParams(WebServiceParam param) {
		paramList = new ArrayList<WebServiceParam>();
		paramList.add(param);
	}

	@SuppressWarnings("unchecked")
	public WebServiceParams(String params) {
		try {
			JSONArray paramArray = JSONArray.fromObject(params);
			paramList = (ArrayList<WebServiceParam>) JSONArray.toList(
					paramArray, WebServiceParam.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public WebServiceParams() {

	}

	public List<WebServiceParam> getParamList() {
		return paramList;
	}

	public void setParamList(List<WebServiceParam> paramList) {
		this.paramList = paramList;
	}

	@SuppressWarnings("finally")
	public Boolean add(WebServiceParam param) {
		Boolean result = true;
		try {
			if (paramList.equals(null))
				paramList = new ArrayList<WebServiceParam>();
			paramList.add(param);
		} catch (Exception e) {
			e.printStackTrace();
			result = false;
		} finally {
			return result;
		}
	}

	@SuppressWarnings("finally")
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		try {
			if (!paramList.equals(null) && paramList.size() > 0) {
				builder.append("[");
				int size = paramList.size();
				for (int i = 0; i < size; ++i) {
					builder.append(paramList.get(i).toString());
					if (i < size - 1) {
						builder.append(",");
					}
				}
				builder.append("]");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			return builder.toString();
		}
	}
}
