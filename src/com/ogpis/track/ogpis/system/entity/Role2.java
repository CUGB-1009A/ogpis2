package com.ogpis.track.ogpis.system.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.apache.commons.lang3.StringUtils;

import com.ogpis.track.ogpis.system.entity.base.RoleEntity2;

@Entity
@Table(name = "ogpis_role")
public class Role2 extends RoleEntity2 {

	/**
	 * 从角色成员列表中删除用户
	 * 
	 * @param user
	 */
	public void deleteFromUsers(User2 user) {
		if (user == null) {
			return;
		}
		Set<User2> users = getUsers();
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
