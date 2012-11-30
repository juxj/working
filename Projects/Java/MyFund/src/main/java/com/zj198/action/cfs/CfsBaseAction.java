package com.zj198.action.cfs;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.zj198.action.BaseAction;
import com.zj198.model.UsrUser;

public class CfsBaseAction extends BaseAction {


	public String getRequestValue(String key) {
		HttpServletRequest request = (HttpServletRequest) this.getContext().get(ServletActionContext.HTTP_REQUEST);
		return request.getParameter(key);
	}

	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
