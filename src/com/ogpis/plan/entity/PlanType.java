package com.ogpis.plan.entity;

public enum PlanType {
	全国("QG"),中石油("ZSY"),中石化("ZSH"),中海油("ZHY"),延长石油("YC"),中联煤("ZLM"),三五八("358");
	//工作量("GZL"),新增探明地质储量("CL"),新建产能("CN"),产量("CL"),投资("TZ"),成本("CB");
	private String key;
	
	private PlanType(String planType){
		this.key=planType;
	}

	public String getKey() {
		return key;
	}
	
	public void setKey(String key) {
		this.key = key;
	}
	
}
