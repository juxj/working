package com.zj198.exception;

import org.apache.log4j.Logger;

public class ActionException extends Throwable{
	protected Logger log = Logger.getLogger(ActionException.class);
	
	public ActionException(String msg,Exception e){
		log.info(msg);
		e.printStackTrace();
	}
	
	public ActionException(String msg){
		log.info(msg);
	}
}
