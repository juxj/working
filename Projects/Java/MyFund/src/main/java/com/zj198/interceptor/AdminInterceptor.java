package com.zj198.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.zj198.dao.AdmFunctionDAO;
import com.zj198.model.AdmFunction;
import com.zj198.model.AdmUser;
import com.zj198.service.admin.AdminAccountService;
import com.zj198.util.NumberUtil;

public class AdminInterceptor extends AbstractInterceptor{
	
	private static final long serialVersionUID = -5727888071061794828L;
	private AdminAccountService adminAccountService;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		if (ctx.getSession().get("_admin") != null) {
			String reqAction = invocation.getProxy().getActionName();
			String method = invocation.getProxy().getMethod();
			if(method.equals("execute")){
				reqAction+=".act";
			}else{
				reqAction+="!"+method+".act";
			}
//			AdmFunction fun = adminAccountService.getByActionName(reqAction);
//			if(fun!=null && NumberUtil.ifExist(((AdmUser)ctx.getSession().get("_admin")).getRights(),fun.getRights())){
//				return invocation.invoke();
//			}else{
//				ctx.put("msg","您的权限不允许进行此操作");
//				return "error";
//			}
			return invocation.invoke();
		}else{
			return "adminLogin";
		}
		
		
//		HttpServletRequest request=ServletActionContext.getRequest();
//		StringBuilder qs = new StringBuilder();		
//		Enumeration<String> postString = request.getParameterNames();
//		boolean flag = false;
//		while(postString.hasMoreElements()){
//			String a = postString.nextElement();
//			if(flag) qs.append("&");
//			qs.append(a).append("=").append(request.getParameter(a));
//			flag=true;
//		}
//		if(qs.length()>0){
//			request.setAttribute("rtnurl",request.getRequestURI()+"?"+qs);
//		}else{
//			request.setAttribute("rtnurl",request.getRequestURI());
//		}
		
	}


	public void setAdminAccountService(AdminAccountService adminAccountService) {
		this.adminAccountService = adminAccountService;
	}

}