package com.ogpis.track.ogpis.plan.entity;

public enum PlanType2 {
	全国("QG"), 中石油("ZSY"), 中石化("ZSH"), 中海油("ZHY"), 延长石油("YC"), 中联煤("ZLM"), 三五八("358") ;

	// 定义私有变量
	private String key;

	// 构造函数，枚举类型只能为私有
	private PlanType2(String planType) {
		this.key = planType;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

}
