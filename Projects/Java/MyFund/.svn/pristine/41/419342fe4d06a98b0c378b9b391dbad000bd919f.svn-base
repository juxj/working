package com.zj198.util;


import java.util.Date;

import com.meetup.memcached.MemcachedClient;
import com.meetup.memcached.SockIOPool;

public class CacheUtil {
	protected static MemcachedClient mcc = new MemcachedClient();
	static {
		String[] servers = { "192.168.1.6:11211" };
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
	
	public static void set(String cacheName,Object object) {
		mcc.set(cacheName, object);
	}

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
