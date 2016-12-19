package com.ogpis.plan.entity;

public enum PlanType {
	全国("QG"),中石油("ZSY"),中石化("ZSH"),中海油("ZHY"),延长石油("YC"),中联煤("ZLM"),三五八("358");
	
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
