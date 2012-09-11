package com.zj198.action;

import com.opensymphony.xwork2.Action;
import com.zj198.util.Pager;

public abstract class BaseAction implements Action{
	protected Pager pager;
	protected String msg;
	
	public String getMsg() {
		return msg;
	}
	public Pager getPager(){
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
}
