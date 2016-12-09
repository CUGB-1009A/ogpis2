package com.ogpis.base.entity;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.UUID;

import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class PrimaryEntity implements Serializable {
	
	public PrimaryEntity() {
		super();
		this.id = UUID.randomUUID().toString();
	}
	
	@Id
	/**
	 * 主键
	 */
	protected String id;
	
	public String getId() {
		return id;
	}
}
