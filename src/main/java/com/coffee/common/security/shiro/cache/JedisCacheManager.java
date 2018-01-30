/**
 * Copyright &copy; 2016-2018 <a href="www.coffee-ease.com/">coffee-ease</a> All rights reserved.
 */
package com.coffee.common.security.shiro.cache;

import java.util.Collection;
import java.util.Collections;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.coffee.common.utils.JedisClusterUtils;
import com.coffee.common.web.Servlets;
import com.google.common.collect.Sets;

/**
 * 自定义授权缓存管理类
 * 
 * @author yuan
 */
public class JedisCacheManager implements CacheManager {

	private String cacheKeyPrefix = "shiro_cache_";

	@Override
	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		return new JedisCache<K, V>(cacheKeyPrefix + name);
	}

	public String getCacheKeyPrefix() {
		return cacheKeyPrefix;
	}

	public void setCacheKeyPrefix(String cacheKeyPrefix) {
		this.cacheKeyPrefix = cacheKeyPrefix;
	}

	/**
	 * 自定义授权缓存管理类
	 * 
	 * @author coffee
	 * @version 2014-7-20
	 */
	public class JedisCache<K, V> implements Cache<K, V> {

		private Logger logger = LoggerFactory.getLogger(getClass());

		private String cacheKeyName = null;

		public JedisCache(String cacheKeyName) {
			this.cacheKeyName = cacheKeyName;
			// if (!JedisClusterUtils.exists(cacheKeyName)){
			// Map<String, Object> map = Maps.newHashMap();
			// JedisClusterUtils.setObjectMap(cacheKeyName, map, 60 * 60 * 24);
			// }
			// logger.debug("Init: cacheKeyName {} ", cacheKeyName);
		}

		@SuppressWarnings("unchecked")
		@Override
		public V get(K key) throws CacheException {
			if (key == null) {
				return null;
			}

			V v = null;
			HttpServletRequest request = Servlets.getRequest();
			if (request != null) {
				v = (V) request.getAttribute(cacheKeyName);
				if (v != null) {
					return v;
				}
			}

			V value = null;

			try {

				value = (V) JedisClusterUtils.toObject(JedisClusterUtils
						.hget(JedisClusterUtils.getBytesKey(cacheKeyName), JedisClusterUtils.getBytesKey(key)));
				logger.debug("get {} {} {}", cacheKeyName, key, request != null ? request.getRequestURI() : "");
			} catch (Exception e) {
				logger.error("get {} {} {}", cacheKeyName, key, request != null ? request.getRequestURI() : "", e);
			} finally {

			}

			if (request != null && value != null) {
				request.setAttribute(cacheKeyName, value);
			}

			return value;
		}

		@Override
		public V put(K key, V value) throws CacheException {
			if (key == null) {
				return null;
			}

			try {

				JedisClusterUtils.hset(JedisClusterUtils.getBytesKey(cacheKeyName), JedisClusterUtils.getBytesKey(key),
						JedisClusterUtils.toBytes(value));
				logger.debug("put {} {} = {}", cacheKeyName, key, value);
			} catch (Exception e) {
				logger.error("put {} {}", cacheKeyName, key, e);
			} finally {

			}
			return value;
		}

		@SuppressWarnings("unchecked")
		@Override
		public V remove(K key) throws CacheException {
			V value = null;

			try {

				value = (V) JedisClusterUtils.toObject(JedisClusterUtils
						.hget(JedisClusterUtils.getBytesKey(cacheKeyName), JedisClusterUtils.getBytesKey(key)));
				JedisClusterUtils.hdel(JedisClusterUtils.getBytesKey(cacheKeyName), JedisClusterUtils.getBytesKey(key));
				logger.debug("remove {} {}", cacheKeyName, key);
			} catch (Exception e) {
				logger.warn("remove {} {}", cacheKeyName, key, e);
			} finally {

			}
			return value;
		}

		@Override
		public void clear() throws CacheException {

			try {

				JedisClusterUtils.hdel(JedisClusterUtils.getBytesKey(cacheKeyName));
				logger.debug("clear {}", cacheKeyName);
			} catch (Exception e) {
				logger.error("clear {}", cacheKeyName, e);
			} finally {

			}
		}

		@Override
		public int size() {
			int size = 0;

			try {

				size = JedisClusterUtils.hlen(JedisClusterUtils.getBytesKey(cacheKeyName)).intValue();
				logger.debug("size {} {} ", cacheKeyName, size);
				return size;
			} catch (Exception e) {
				logger.error("clear {}", cacheKeyName, e);
			} finally {

			}
			return size;
		}

		@SuppressWarnings("unchecked")
		@Override
		public Set<K> keys() {
			Set<K> keys = Sets.newHashSet();

			try {

				Set<byte[]> set = JedisClusterUtils.hkeys(JedisClusterUtils.getBytesKey(cacheKeyName));
				for (byte[] key : set) {
					keys.add((K) key);
				}
				logger.debug("keys {} {} ", cacheKeyName, keys);
				return keys;
			} catch (Exception e) {
				logger.error("keys {}", cacheKeyName, e);
			} finally {

			}
			return keys;
		}

		@SuppressWarnings("unchecked")
		@Override
		public Collection<V> values() {
			Collection<V> vals = Collections.emptyList();
			;

			try {

				Collection<byte[]> col = JedisClusterUtils.hvals(JedisClusterUtils.getBytesKey(cacheKeyName));
				for (byte[] val : col) {
					vals.add((V) val);
				}
				logger.debug("values {} {} ", cacheKeyName, vals);
				return vals;
			} catch (Exception e) {
				logger.error("values {}", cacheKeyName, e);
			} finally {

			}
			return vals;
		}
	}
}
