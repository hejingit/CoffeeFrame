
package com.coffee.common.filter;

import com.coffee.common.utils.CacheUtils;

import net.sf.ehcache.CacheManager;
import net.sf.ehcache.constructs.web.filter.SimplePageCachingFilter;

/**
 * 页面高速缓存过滤器
 * ClassName: PageCachingFilter <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * date: 2018年1月16日 上午12:04:16 <br/>
 *
 * @author Coffee-Ease
 * @version
 */
public class PageCachingFilter extends SimplePageCachingFilter {

	@Override
	protected CacheManager getCacheManager() {
		return CacheUtils.getCacheManager();
	}
	
}
