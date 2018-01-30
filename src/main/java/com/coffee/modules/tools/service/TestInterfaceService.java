/**
 * Copyright &copy; 2016-2018 <a href="www.coffee-ease.com/">coffee-ease</a> All rights reserved.
 */
package com.coffee.modules.tools.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coffee.common.persistence.Page;
import com.coffee.common.service.CrudService;
import com.coffee.modules.tools.dao.TestInterfaceDao;
import com.coffee.modules.tools.entity.TestInterface;

/**
 * 接口Service
 * @author lgf
 * @version 2016-01-07
 */
@Service
@Transactional(readOnly = true)
public class TestInterfaceService extends CrudService<TestInterfaceDao, TestInterface> {

	public TestInterface get(String id) {
		return super.get(id);
	}
	
	public List<TestInterface> findList(TestInterface testInterface) {
		return super.findList(testInterface);
	}
	
	public Page<TestInterface> findPage(Page<TestInterface> page, TestInterface testInterface) {
		return super.findPage(page, testInterface);
	}
	
	@Transactional(readOnly = false)
	public void save(TestInterface testInterface) {
		super.save(testInterface);
	}
	
	@Transactional(readOnly = false)
	public void delete(TestInterface testInterface) {
		super.delete(testInterface);
	}
	
}