/**
 * Project Name:coffeeframe
 * File Name:DataSourceContextHolder.java
 * Package Name:com.coffee.common.dataSource
 * Date:2018年1月21日下午10:27:20
 * Copyright (c) 2018, Coffee Ease 2016-2018 All Rights Reserved.
 *
 */

package com.coffee.common.dataSource;
/**
 * ClassName:DataSourceContextHolder <br/>
 * Function: 数据源设置
 * 根据类型设置当前线程数据源
 * 获取当前线程数据源
 * 移除当前线程数据源 
 * Date:     2018年1月21日 下午10:27:20 <br/>
 * @author   Jin.He (mailto:hejin@coffee-ease.com)
 * @version  
 * @see 	 
 */
public class DataSourceContextHolder {
	private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();  
	  
    public static void setDbType(String dbType) {  
        contextHolder.set(dbType);  
    }  
  
    public static String getDbType() {  
        return ((String) contextHolder.get());  
    }  
  
    public static void clearDbType() {  
        contextHolder.remove();  
    }  
}

