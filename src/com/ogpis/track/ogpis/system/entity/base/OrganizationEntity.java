package com.ogpis.track.ogpis.system.entity.base;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.system.entity.User;
/**
 * 组织机构，暂时没有用
 * @author Danny
 *
 */
@MappedSuperclass
public abstract class OrganizationEntity extends BaseEntity {

	protected String name;

	@OneToMany(cascade = { CascadeType.MERGE }, mappedBy = "organization")
	private Set<User> users;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

}
