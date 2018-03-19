/**
 * Project Name:coffeeframe
 * File Name:TestDubbo.java
 * Package Name:com.coffee.modules.coffeebean.service
 * Date:2018年3月19日上午12:13:21
 * Copyright (c) 2018, Coffee Ease 2016-2018 All Rights Reserved.
 *
 */

package com.coffee.api.intf;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.coffee.api.intf.DemoService;


/**
 * ClassName:TestDubbo <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Date:     2018年3月19日 上午12:13:21 <br/>
 * @author   Coffee-Ease JH
 * @version  
 * @see 	 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-dubbo.xml"})
public class TestDubbo {
	private static final  Logger logger=LoggerFactory.getLogger(TestDubbo.class); 
	
	@Autowired
	DemoService demoService;
	
	@Test
	public void testDubboService() throws Exception{
		logger.debug("开始执行 testDubboService");
		logger.debug(demoService.sayHello("测试RPC 调用"));
		logger.debug("结束执行 testDubboService");
	}
}

