/**
 * Copyright &copy; 2016-2018 <a href="www.coffee-ease.com/">coffee-ease</a> All rights reserved.
 */
package com.coffee.modules.monitor.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coffee.common.persistence.Page;
import com.coffee.common.service.CrudService;
import com.coffee.modules.monitor.dao.MonitorDao;
import com.coffee.modules.monitor.entity.Monitor;

/**
 * 系统监控Service
 * @author liugf
 * @version 2016-02-07
 */
@Service
@Transactional(readOnly = true)
public class MonitorService extends CrudService<MonitorDao, Monitor> {

	public Monitor get(String id) {
		return super.get(id);
	}
	
	public List<Monitor> findList(Monitor monitor) {
		return super.findList(monitor);
	}
	
	public Page<Monitor> findPage(Page<Monitor> page, Monitor monitor) {
		return super.findPage(page, monitor);
	}
	
	@Transactional(readOnly = false)
	public void save(Monitor monitor) {
		super.save(monitor);
	}
	
	@Transactional(readOnly = false)
	public void delete(Monitor monitor) {
		super.delete(monitor);
	}
	
}