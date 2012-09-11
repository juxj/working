package com.zj198.exception;

import org.apache.log4j.Logger;

public class DAOException extends Throwable{
	protected Logger log = Logger.getLogger(DAOException.class);
	
	public DAOException(String msg,Exception e){
		log.info(msg);
		e.printStackTrace();
	}
	
	public DAOException(String msg){
		log.info(msg);
	}
}
