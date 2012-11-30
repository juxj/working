package com.zj198.action.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmUser;
import com.zj198.service.admin.AdminAccountService;
import com.zj198.util.Constants;

public class AccountAction extends BaseAction {
	private String username;
	private String password;
	private String verifycode;
	
	private AdminAccountService adminAccountService;

	public String execute(){
		return "adminLogin";
	}

	public String login(){
		ActionContext context = ActionContext.getContext();
		Object _sess_vcode = context.getSession().get("_vcode");
		if (_sess_vcode!=null && _sess_vcode.toString().equalsIgnoreCase(verifycode)) {
			context.getSession().remove("_vcode");
			HttpServletRequest request = ServletActionContext.getRequest();
			AdmUser _admin = adminAccountService.adminLogin_tx(username, password, request.getRemoteAddr());
			if (_admin != null) {
				if (_admin.getStatus() == Constants.USER_STATUS_AVAILABLE) {
					context.getSession().put("_admin", _admin);
					return SUCCESS;
				}else{
					msg = "您被禁止登录。";
					return "adminLogin";
				}
			}
		}
		msg = "用户名、密码或验证码输入错误，请重新输入。";
		return "adminLogin";
	}

	public String logout() {
		ActionContext ctx = ActionContext.getContext();
		ctx.getSession().remove("_admin");
		return "adminLogin";
	}

	// setter and getter
	public void setUsername(String username) {
		this.username = username;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}
	public void setAdminAccountService(AdminAccountService adminAccountService) {
		this.adminAccountService = adminAccountService;
	}

}
