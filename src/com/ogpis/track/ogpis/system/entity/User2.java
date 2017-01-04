package com.ogpis.track.ogpis.system.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.ogpis.track.ogpis.system.entity.base.UserEntity2;

@Entity
@Table(name = "ogpis_user")
public class User2 extends UserEntity2 {

	/**
	 * 给用户添加角色
	 * 
	 * @param role
	 *            要添加的角色
	 */
	public void addToRoles(Role2 role) {
		if (role == null) {
			return;
		}
		Set<Role2> roles = getRoles();
		if (roles == null) {
			roles = new HashSet<Role2>();
			setRoles(roles);
		}
		roles.add(role);
	}

	/**
	 * 获得该用户的权限
	 * 
	 * @return
	 */
	public Set<String> getPerms() {
		if (getDeleted()) {
			return null;
		}
		Set<Role2> roles = getRoles();
		if (roles == null) {
			return null;
		}
		boolean isSuper = false;
		Set<String> allPerms = new HashSet<String>();
		for (Role2 role : getRoles()) {
			if (role.getIsSuper()) {
				isSuper = true;
				break;
			}
			allPerms.addAll(role.getPerms());
		}
		if (isSuper) {
			allPerms.clear();
			allPerms.add("*");
		}
		return allPerms;
	}
}
