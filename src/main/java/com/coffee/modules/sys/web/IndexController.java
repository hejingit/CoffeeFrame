/**
 * Project Name:coffee-frame
 * File Name:IndexController.java
 * Package Name:com.coffee.modules.sys.web
 * Date:2018年1月16日下午3:26:18
 * Copyright (c) 2018, Jin.He (mailto:hejin@coffee-ease.com) All Rights Reserved.
 *
*/

package com.coffee.modules.sys.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coffee.common.web.BaseController;

/**
 * ClassName:IndexController <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Date:     2018年1月16日 下午3:26:18 <br/>
 * @author   Jin.He (mailto:hejin@coffee-ease.com)
 * @version  
 * @see 	 
 */
@Controller
@RequestMapping(value = "${adminPath}")
public class IndexController extends BaseController {
	@RequestMapping(value = "/home")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "redirect:" + adminPath+"/sys/user/info";
	}
}

