package com.zj198.action;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.zj198.model.AdmUser;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public abstract class BaseAction implements Action {
	protected Pager pager;
	protected String msg;

	ActionContext getContext() {
		return ActionContext.getContext();
	}

	protected UsrUser getSessionUser() {
		return (UsrUser) getContext().getSession().get("_user");
	}

	protected AdmUser getSessionAdm() {
		return (AdmUser) getContext().getSession().get("_admin");
	}

	public String getMsg() {
		return msg;
	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

}
