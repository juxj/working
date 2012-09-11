package com.zj198.exception;

import org.apache.log4j.Logger;

public class ServiceException extends Throwable{
	protected Logger log = Logger.getLogger(ServiceException.class);
	
	public ServiceException(String msg,Exception e){
		log.info(msg);
		e.printStackTrace();
	}
	
	public ServiceException(String msg){
		log.info(msg);
	}
}
