/**
 * Project Name:coffeeframe
 * File Name:DynamicDataSource.java
 * Package Name:com.coffee.common.dataSource
 * Date:2018年1月21日下午10:29:28
 * Copyright (c) 2018, Coffee Ease 2016-2018 All Rights Reserved.
 *
 */

package com.coffee.common.dataSource;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

/**
 * ClassName:DynamicDataSource <br/>
 * Function: TODO 动态数据源配置类 <br/>
 * Date:     2018年1月21日 下午10:29:28 <br/>
 * @author   Jin.He (mailto:hejin@coffee-ease.com)
 * @version  
 * @see 	 
 */
public class DynamicDataSource extends AbstractRoutingDataSource {  
    @Override  
    protected Object determineCurrentLookupKey() { 
        return DataSourceContextHolder.getDbType();  
    }  
}

