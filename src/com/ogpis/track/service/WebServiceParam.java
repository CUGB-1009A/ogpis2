package com.ogpis.track.service;

public class WebServiceParam {
	private String ColumsName;
	private String Relation;
	private String Values;

	public WebServiceParam(String ColumsName, String Relation, String Values) {
		this.ColumsName = ColumsName;
		this.Relation = Relation;
		this.Values = Values;
	}
	
	public WebServiceParam(){
		
	}

	public void setColumsName(String columsName) {
		this.ColumsName = columsName;
	}

	public void setRelation(String relation) {
		this.Relation = relation;
	}

	public void setValues(String values) {
		this.Values = values;
	}

	public String getColumsName() {
		return ColumsName;
	}

	public String getRelation() {
		return Relation;
	}

	public String getValues() {
		return Values;
	}
}
