package com.ogpis.base.entity;

import java.util.UUID;

import javax.persistence.MappedSuperclass;

@MappedSuperclass
public interface IBaseEntity {
	String id1 = UUID.randomUUID().toString();

	void setId1(String id);

	void getId1();
}
