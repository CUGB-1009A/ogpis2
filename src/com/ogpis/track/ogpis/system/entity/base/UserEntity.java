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
import com.ogpis.track.ogpis.plan.entity.Plan;
import com.ogpis.track.ogpis.system.entity.Organization;
import com.ogpis.track.ogpis.system.entity.Role;
import com.ogpis.track.ogpis.system.entity.User;

@MappedSuperclass
public abstract class UserEntity extends BaseEntity {

	protected String loginId;
	protected String name;
	protected String password;

	@ManyToOne
	@JoinColumn(name = "organization_id")
	protected Organization organization;

	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_role", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
	protected Set<Role> roles = new HashSet<Role>();
	
	/*
	 * 用户收藏的规划 many-to-many
	 */
	@ManyToMany(targetEntity = Plan.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_plan", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "PLAN_ID"))
	protected Set<Plan> plans = new HashSet<Plan>();

	public Set<Plan> getPlans() {
		return plans;
	}

	public void setPlans(Set<Plan> plans) {
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

	public Organization getOraganzation() {
		return organization;
	}

	public void setOraganzation(Organization oraganzation) {
		this.organization = oraganzation;
	}

	/**
	 * @return the roles
	 */
	public Set<Role> getRoles() {
		return roles;
	}

	/**
	 * @param roles
	 *            the roles to set
	 */
	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof User))
			return false;
		else {
			User user = (User) obj;
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
