package com.ogpis.system.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

import com.ogpis.system.entity.base.RoleEntity;

@Entity
@Table(name = "ogpis_role")
public class Role extends RoleEntity {

	/**
	 * 从角色成员列表中删除用户
	 * 
	 * @param user
	 */
	public void deleteFromUsers(User user) {
		if (user == null) {
			return;
		}
		Set<User> users = getUsers();
		if (users == null) {
			return;
		}
		users.remove(user);
	}
	
	public static Set<String> splitPerms(String[] perms) {
		Set<String> set = new HashSet<String>();
		if (perms != null) {
			for (String perm : perms) {
				for (String p : StringUtils.split(perm, ',')) {
					if (!StringUtils.isBlank(p)) {
						set.add(p);
					}
				}
			}
		}
		return set;
	}
}
