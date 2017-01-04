package com.ogpis.track.ogpis.system.entity.base;

import javax.persistence.MappedSuperclass;

import com.ogpis.track.ogpis.base.entity.BaseEntity;

@MappedSuperclass
public class DictionaryEntity2 extends BaseEntity {

	private String name;
	private String value;
	private String type;
	/**
	 * 优先级，用于排序
	 */
	private int priority;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPriority() {
		return priority;
	}
	public void setPriority(int priority) {
		this.priority = priority;
	}
	

}
