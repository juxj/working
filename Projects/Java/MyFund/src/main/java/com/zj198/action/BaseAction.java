package com.zj198.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.zj198.model.AdmUser;
import com.zj198.model.OrdFinanceApply;
import com.zj198.model.PrdFinance;
import com.zj198.model.UsrUser;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

public abstract class BaseAction implements Action {
	protected Pager pager;
	protected String msg;

	protected ActionContext getContext() {
		return ActionContext.getContext();
	}

	/**
	 * 输出json内容，避免xml配置
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:35:52
	 * @return
	 */
	protected void writeJson(String j) {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(j);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 从session中获取user
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:35:52
	 * @return
	 */
	protected UsrUser getSessionUser() {
		return (UsrUser) getContext().getSession().get("_user");
	}

	/**
	 * 从session中获取admin
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-10-26|下午1:37:52
	 * @return
	 */
	protected AdmUser getSessionAdm() {
		return (AdmUser) getContext().getSession().get("_admin");
	}

	/**
	 * 订单模块非法url过滤
	 * 
	 * @author zeroleavebaoyang@gmail.com
	 * @since 2012-11-1|下午4:12:34
	 * @return
	 */
	protected boolean isLawful(OrdFinanceApply apply, PrdFinance product) {
		boolean res = true;
		AdmUser admin = getSessionAdm();
		if (admin == null) {
			UsrUser u = getSessionUser();
			if (u.getUserTypeGroup() == Constants.USERTYPE_GROUP_COMPANY || u.getUserTypeGroup() == Constants.USERTYPE_GROUP_PERSONAL) {
				if (apply == null) {
					res = false;
				} else {
					if (apply.getUserId().intValue() != u.getId().intValue()) {
						res = false;
					}
				}
			} else {
				if (u.getId().intValue() != product.getUserId().intValue()) {
					res = false;
				}
			}
		}
		return res;
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
