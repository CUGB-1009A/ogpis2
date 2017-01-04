package com.ogpis.track.ogpis.system.service;

import java.util.List;
import java.util.Set;

import com.ogpis.track.ogpis.base.service.BaseService;
import com.ogpis.track.ogpis.system.entity.Role2;

public interface RoleService2 extends BaseService<Role2, String> {

	/**
	 * 获得角色列表
	 * 
	 * @return
	 */
	public List<Role2> getList();

	/**
	 * 删除角色中的成员
	 * 
	 * @param role
	 *            角色
	 * @param userIds
	 *            要删除的成员id
	 */
	public void deleteMembers(Role2 role, String[] userIds);

	/**
	 * 保存角色
	 * 
	 * @param role
	 *            角色实体
	 * @param perms
	 *            角色对应的权限集合
	 * @return
	 */
	public Role2 save(Role2 role, Set<String> perms);

	/**
	 * 编辑角色
	 * 
	 * @param role
	 *            角色实体
	 * @param perms
	 *            角色对应的权限集合
	 * @return
	 */
	public Role2 update(Role2 role, Set<String> perms);

}
