/**
 * Project Name:coffeeframe
 * File Name:MultipleDataSourceAspectAdvice.java
 * Package Name:com.coffee.common.dataSource
 * Date:2018年1月21日下午10:30:35
 * Copyright (c) 2018, Coffee Ease 2016-2018 All Rights Reserved.
 *
 */

package com.coffee.common.dataSource;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.stereotype.Component;

/**
 * ClassName:MultipleDataSourceAspectAdvice <br/>
 * Function: TODO 该方法为切面方法，保证在执行数据库操作前可以动态的切换数据源. <br/>
 * Date:     2018年1月21日 下午10:30:35 <br/>
 * @author   Jin.He (mailto:hejin@coffee-ease.com)
 * @version  
 * @see 	 
 */
@Component
@Aspect
public class MultipleDataSourceAspectAdvice {
	private static transient Logger logger = LoggerFactory.getLogger(MultipleDataSourceAspectAdvice.class);
	/**
	 * 在执行方法之前和之后改变参数和返回值
	 * invoke:
	 * execution(* com.coffee.modules.*.dao.*.*(..)) 声明切入点为com.coffee.modules.*.dao 目录内，非常重要
	 * @author Jin.He (mailto:hejin@coffee-ease.com)
	 * @param joinPoint用于获取目标方法相关信息的参数
	 * @return 使用的数据源
	 * @throws Throwable   
	 */
	@Around("execution(* com.coffee.modules.*.dao.*.*(..))")
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
		System.out.println("============================================");
		Object object = joinPoint.getTarget();
		DataSourceKey annotation = AnnotationUtils.findAnnotation(object.getClass(), DataSourceKey.class);

		if (null != annotation) {
			String value = annotation.value();
			logger.debug("switch the datasource:" + value);
			if (null != value && value.length() > 0) {
				DataSourceContextHolder.setDbType(value);
				logger.debug("Data Source Key :" + value);
			}
		} else {// 没有注解时设置dbType为null，表示使用用默认数据库
			logger.debug("switch the default datasource");
			DataSourceContextHolder.setDbType(null);
		}

		return joinPoint.proceed();
	}
}

