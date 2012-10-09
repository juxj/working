package com.zj198.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zj198.model.UsrUser;

@SuppressWarnings("unchecked")
public class UserCheckInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -1769365618891145864L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {

		ActionContext ctx = invocation.getInvocationContext();
		Object u = ctx.getSession().get("_user");
		if (u == null) {
			return invocation.invoke();
		} else {
			UsrUser user = (UsrUser) u;
			if (user.getAuditstatus().shortValue() == 2) {
				return invocation.invoke();
			} else {
				createRtnUrl();
				return "noCheckPrompt";
			}
		}
	}

	private boolean isChecked() {
		boolean res = false;
		HttpServletRequest request = ServletActionContext.getRequest();
		Enumeration<String> postString = request.getParameterNames();
		while (postString.hasMoreElements()) {
			String a = postString.nextElement();
			if (a.equals("checkstate")) {
				res = true;
				break;
			}
		}
		return res;
	}

	private void createRtnUrl() {
		// 获取登录前查询字符串
		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuilder qs = new StringBuilder();
		Enumeration<String> postString = request.getParameterNames();
		boolean flag = false;
		while (postString.hasMoreElements()) {
			String a = postString.nextElement();
			if (flag)
				qs.append("&");
			qs.append(a).append("=").append(request.getParameter(a));
			flag = true;
		}
		if (qs.length() > 0) {
			request.setAttribute("rtnurl", request.getRequestURI() + "?" + qs);
		} else {
			request.setAttribute("rtnurl", request.getRequestURI());
		}
	}

}