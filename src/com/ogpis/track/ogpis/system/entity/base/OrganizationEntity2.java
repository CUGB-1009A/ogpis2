package com.ogpis.track.ogpis.system.entity.base;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.system.entity.User2;
/**
 * 组织机构，暂时没有用
 * @author Danny
 *
 */
@MappedSuperclass
public abstract class OrganizationEntity2 extends BaseEntity {

	protected String name;

	@OneToMany(cascade = { CascadeType.MERGE }, mappedBy = "organization")
	private Set<User2> users;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User2> getUsers() {
		return users;
	}

	public void setUsers(Set<User2> users) {
		this.users = users;
	}

}
