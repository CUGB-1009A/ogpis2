package com.ogpis.track.webservice;

import java.util.ArrayList;
import java.util.List;

public class WebServiceParams {
	private List<WebServiceParam> paramList;

	public WebServiceParams(List<WebServiceParam> paramList) {
		this.paramList = paramList;
	}

	public WebServiceParams(WebServiceParam param) {
		paramList=new ArrayList<WebServiceParam>();
		paramList.add(param);
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
			if(paramList.equals(null))
				paramList=new ArrayList<WebServiceParam>();
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
					WebServiceParam tempParam = paramList.get(i);
					builder.append("{\"ColumsName\":\""
							+ tempParam.getColumsName() + "\",");
					builder.append("\"Relation\":\"" + tempParam.getRelation()
							+ "\",");
					builder.append("\"Values\":\"" + tempParam.getValues()
							+ "\"}");
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
