/**
 * Copyright &copy; 2016-2018 <a href="www.coffee-ease.com/">coffee-ease</a> All rights reserved.
 */
package com.coffee.modules.sys.dao;

import java.util.List;

import com.coffee.common.persistence.CrudDao;
import com.coffee.common.persistence.annotation.MyBatisDao;
import com.coffee.modules.sys.entity.Role;

/**
 * 角色DAO接口
 * @author yuanyingsheng
 * @version 2017-04-21
 */
@MyBatisDao
public interface RoleDao extends CrudDao<Role> {

	public Role getByName(Role role);
	
	/**
	 * 查询非admin用户的权限列表
	 * @param role
	 * @return
	 */
	public List<Role> findNorAdminRoleList(Role role);

	/**
	 * 维护角色与菜单权限关系
	 * @param role
	 * @return
	 */
	public int deleteRoleMenu(Role role);

	public int insertRoleMenu(Role role);
	
	/**
	 * 维护角色与公司部门关系
	 * @param role
	 * @return
	 */
	public int deleteRoleOffice(Role role);

	public int insertRoleOffice(Role role);
	
	public Role getByEnname(Role role);

}
