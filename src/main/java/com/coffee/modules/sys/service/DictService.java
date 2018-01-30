/**
 * Copyright &copy; 2016-2018 <a href="www.coffee-ease.com/">coffee-ease</a> All rights reserved.
 */
package com.coffee.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coffee.common.service.CrudService;
import com.coffee.common.utils.CacheUtils;
import com.coffee.modules.sys.dao.DictDao;
import com.coffee.modules.sys.entity.Dict;
import com.coffee.modules.sys.utils.DictUtils;

/**
 * 字典Service
 * @author coffee
 * @version 2014-05-16
 */
@Service
@Transactional(readOnly = true)
public class DictService extends CrudService<DictDao, Dict> {
	
	/**
	 * 查询字段类型列表
	 * @return
	 */
	public List<String> findTypeList(){
		return dao.findTypeList(new Dict());
	}

	@Transactional(readOnly = false)
	public void save(Dict dict) {
		super.save(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

	@Transactional(readOnly = false)
	public void delete(Dict dict) {
		super.delete(dict);
		CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
	}

}
