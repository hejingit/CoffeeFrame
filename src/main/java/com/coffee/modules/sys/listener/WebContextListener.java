package com.coffee.modules.sys.listener;

import javax.servlet.ServletContext;

import org.springframework.web.context.WebApplicationContext;

import com.coffee.modules.sys.service.SystemService;

/**
 * 
 * ClassName: WebContextListener <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * date: 2018年1月16日 上午1:18:39 <br/>
 *
 * @author 
 * @version
 */
public class WebContextListener extends org.springframework.web.context.ContextLoaderListener {
	
	@Override
	public WebApplicationContext initWebApplicationContext(ServletContext servletContext) {
		if (!SystemService.printKeyLoadMessage()){
			return null;
		}
		return super.initWebApplicationContext(servletContext);
	}
}
