package com.ogpis.track.ogpis.system.entity.base;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.CollectionTable;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MappedSuperclass;

import com.ogpis.track.ogpis.base.entity.BaseEntity;
import com.ogpis.track.ogpis.system.entity.Role2;
import com.ogpis.track.ogpis.system.entity.User2;

@MappedSuperclass
public class RoleEntity2 extends BaseEntity {

	/**
	 * 角色名
	 */
	protected String name;
	/**
	 * 优先级，用于排序
	 */
	protected int priority;
	/**
	 * 是否是超级管理员
	 */
	protected boolean isSuper;

	/**
	 * 该角色对应的用户
	 */
	@ManyToMany(targetEntity = User2.class, cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "ogpis_user_role", joinColumns = @JoinColumn(name = "ROLE_ID"), inverseJoinColumns = @JoinColumn(name = "USER_ID"))
	protected Set<User2> users = new HashSet<User2>();

	/**
	 * 该角色对应的权限url
	 */
	@ElementCollection(fetch=FetchType.EAGER)
	@CollectionTable(name = "ogpis_role_permission", joinColumns = @JoinColumn(name = "role_id"))
	@Column(name = "perm_url")
	protected Set<String> perms;

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the priority
	 */
	public int getPriority() {
		return priority;
	}

	/**
	 * @param priority
	 *            the priority to set
	 */
	public void setPriority(int priority) {
		this.priority = priority;
	}

	/**
	 * @return the isSuper
	 */
	public boolean getIsSuper() {
		return isSuper;
	}

	/**
	 * @param isSuper
	 *            the isSuper to set
	 */
	public void setIsSuper(boolean isSuper) {
		this.isSuper = isSuper;
	}

	/**
	 * @return the users
	 */
	public Set<User2> getUsers() {
		return users;
	}

	/**
	 * @param users
	 *            the users to set
	 */
	public void setUsers(Set<User2> users) {
		this.users = users;
	}

	/**
	 * @return the perms
	 */
	public Set<String> getPerms() {
		return perms;
	}

	/**
	 * @param perms
	 *            the perms to set
	 */
	public void setPerms(Set<String> perms) {
		this.perms = perms;
	}
	
	public boolean equals(Object obj) {
		if (null == obj)
			return false;
		if (!(obj instanceof Role2))
			return false;
		else {
			Role2 role = (Role2) obj;
			if (null == this.getId() || null == role.getId())
				return false;
			else
				return (this.getId().equals(role.getId()));
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
