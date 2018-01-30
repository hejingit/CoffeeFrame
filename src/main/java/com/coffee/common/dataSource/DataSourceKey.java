/**
 * Project Name:coffeeframe
 * File Name:DataSourceKey.java
 * Package Name:com.coffee.common.dataSource
 * Date:2018年1月21日下午10:28:41
 * Copyright (c) 2018, Coffee Ease 2016-2018 All Rights Reserved.
 *
 */

package com.coffee.common.dataSource;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ClassName:DataSourceKey <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Date:     2018年1月21日 下午10:28:41 <br/>
 * @author   Jin.He (mailto:hejin@coffee-ease.com)
 * @version  
 * @see 	 
 */
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DataSourceKey {
	 String value() default "";
}

