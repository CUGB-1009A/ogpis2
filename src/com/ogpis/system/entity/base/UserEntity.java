package com.ogpis.system.entity.base;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;
import javax.persistence.OneToMany;

import com.ogpis.base.entity.BaseEntity;
import com.ogpis.forecast.entity.SelfDataCollection;
import com.ogpis.system.entity.Role;
import com.ogpis.system.entity.User;

@MappedSuperclass
public abstract class UserEntity extends BaseEntity {

	/**
	 * 登录名
	 */
	protected String loginId;
	/**
	 * 用户名称
	 */
	protected String name;
	/**
	 * 密码
	 */
	protected String password;

	@ManyToMany(targetEntity = Role.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_role", joinColumns = @JoinColumn(name = "USER_ID"), inverseJoinColumns = @JoinColumn(name = "ROLE_ID"))
	protected Set<Role> roles = new HashSet<Role>();
	
	@OneToMany(targetEntity = SelfDataCollection.class, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_User_SelfDataCollection",joinColumns = @JoinColumn(name = "User_Id"),inverseJoinColumns = @JoinColumn(name = "SelfDataCollection_Id"))
	protected List<SelfDataCollection> selfDataCollections  ;
	
	
	
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

	public List<SelfDataCollection> getSelfDataCollections() {
		return selfDataCollections;
	}

	public void setSelfDataCollections(List<SelfDataCollection> selfDataCollections) {
		this.selfDataCollections = selfDataCollections;
	}

}
