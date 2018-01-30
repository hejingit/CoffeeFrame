/**
 * Copyright &copy; 2016-2018 <a href="www.coffee-ease.com/">coffee-ease</a> All rights reserved.
 */
package com.coffee.modules.sys.dao;

import java.util.List;

import com.coffee.common.persistence.CrudDao;
import com.coffee.common.persistence.annotation.MyBatisDao;
import com.coffee.modules.sys.entity.Dict;

/**
 * 字典DAO接口
 * @author coffee
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
