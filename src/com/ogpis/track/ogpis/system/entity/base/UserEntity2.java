package com.ogpis.track.ogpis.system.entity.base;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MappedSuperclass;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.plan.entity.Plan2;
import com.ogpis.track.ogpis.system.entity.Organization2;
import com.ogpis.track.ogpis.system.entity.Role2;
import com.ogpis.track.ogpis.system.entity.User2;

@MappedSuperclass
public abstract class UserEntity2 extends BaseEntity {

	protected String loginId;
	protected String name;
	protected String password;

	@ManyToOne
	@JoinColumn(name = "organization_id")
	protected Organization2 organization;

	@ManyToMany(targetEntity = Role2.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_role", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
	protected Set<Role2> roles = new HashSet<Role2>();
	
	/*
	 * 用户收藏的规划 many-to-many
	 */
	@ManyToMany(targetEntity = Plan2.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_plan", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "PLAN_ID"))
	protected Set<Plan2> plans = new HashSet<Plan2>();

	public Set<Plan2> getPlans() {
		return plans;
	}

	public void setPlans(Set<Plan2> plans) {
		this.plans = plans;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Organization2 getOraganzation() {
		return organization;
	}

	public void setOraganzation(Organization2 oraganzation) {
		this.organization = oraganzation;
	}

	/**
	 * @return the roles
	 */
	public Set<Role2> getRoles() {
		return roles;
	}

	/**
	 * @param roles
	 *            the roles to set
	 */
	public void setRoles(Set<Role2> roles) {
		this.roles = roles;
	}

	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof User2))
			return false;
		else {
			User2 user = (User2) obj;
			if (null == this.getId() || null == user.getId())
				return false;
			else
				return (this.getId().equals(user.getId()));
		}
	}

	private int hashCode = Integer.MIN_VALUE;

	public int hashCode() {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId())
				return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":"
						+ this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}

}
