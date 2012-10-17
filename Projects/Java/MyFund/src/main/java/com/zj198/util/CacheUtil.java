package com.zj198.util;

import java.util.Date;

import com.meetup.memcached.MemcachedClient;
import com.meetup.memcached.SockIOPool;

public class CacheUtil {
	protected static MemcachedClient mcc = new MemcachedClient();
	static {
		String server_ip = PropertiesUtil.getByKey("memcached.ip"); 
		String server_port = PropertiesUtil.getByKey("memcached.port");
		String[] servers = {server_ip+":"+server_port};
		Integer[] weights = { 3 };
		SockIOPool pool = SockIOPool.getInstance();
		pool.setServers(servers);
		pool.setWeights(weights);
		pool.setInitConn(5);
		pool.setMinConn(5);
		pool.setMaxConn(250);
		pool.setMaxIdle(1000 * 60 * 60 * 6);
		pool.setMaintSleep(30);
		pool.setNagle(false);
		pool.setSocketTO(1000);
		pool.setSocketConnectTO(0);
		pool.initialize();
	}
	
	/**
	 * 放置缓存对象，无失效时间
	 * @param cacheName 某表的单行记录一律以 表名_ID 命名，其他请和我商讨--Patrick
	 * @param object
	 */
	public static void set(String cacheName,Object object) {
		mcc.set(cacheName, object);
	}
	
	/**
	 * 放置缓存对象，含失效时间
	 * @param cacheName 某表的单行记录一律以 表名_ID 命名，其他请和我商讨--Patrick
	 * @param object 
	 * @param expireSeconds 失效时间（秒）
	 */
	public static void set(String cacheName,Object object,Long expireSeconds) {
		mcc.set(cacheName, object, new Date(expireSeconds*1000));
	}

	public static Object get(String cacheName) {
		return mcc.get(cacheName);
	}
	
	public static void delete(String cacheName){
		mcc.delete(cacheName);
	}
	
	public static void replace(String cacheName,Object object){
		mcc.replace(cacheName, object);
	}
	
	public static void replace(String cacheName,Object object,Long expireSeconds){
		mcc.replace(cacheName, object, new Date(expireSeconds*1000));
	}
}
