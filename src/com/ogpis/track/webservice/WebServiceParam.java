package com.ogpis.track.webservice;

import net.sf.json.JSONObject;

public class WebServiceParam {
	private String columsName;
	private String relation;
	private String values;

	public WebServiceParam(String ColumsName, String Relation, String Values) {
		this.columsName = ColumsName;
		this.relation = Relation;
		this.values = Values;
	}

	public WebServiceParam(JSONObject param) {
		try {
			this.columsName = param.getString("ColumsName");
			this.relation = param.getString("Relation");
			this.values = param.getString("Values");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public WebServiceParam(String param) {
		try {
			JSONObject paramJson = JSONObject.fromObject(param);
			this.columsName = paramJson.getString("ColumsName");
			this.relation = paramJson.getString("Relation");
			this.values = paramJson.getString("Values");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public WebServiceParam() {

	}

	public void setColumsName(String columsName) {
		this.columsName = columsName;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public void setValues(String values) {
		this.values = values;
	}

	public String getColumsName() {
		return columsName;
	}

	public String getRelation() {
		return relation;
	}

	public String getValues() {
		return values;
	}

	public String toString() {
		StringBuilder builder=new StringBuilder();
		builder.append("{\"ColumsName\":\""
				+ this.getColumsName() + "\",");
		builder.append("\"Relation\":\"" + this.getRelation()
				+ "\",");
		builder.append("\"Values\":\"" + this.getValues()
				+ "\"}");
		return builder.toString();
	}
}
