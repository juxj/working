package com.zj198.action.user;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.UsrMenu;
import com.zj198.model.UsrUser;
import com.zj198.service.user.UserCenterMenuService;

public class UserMenuAction extends BaseAction{
	private List<UsrMenu> menuList;
	private UserCenterMenuService userCenterMenuService;
	
	@Override
	public String execute() throws Exception {
		ActionContext context = ActionContext.getContext();	
		UsrUser user = (UsrUser)context.getSession().get("_user");
		menuList = userCenterMenuService.findMenuListByGroupType(user.getUserTypeGroup());
		return SUCCESS;
	}

	//setter and getter
	public List<UsrMenu> getMenuList() {
		return menuList;
	}

	public void setUserCenterMenuService(UserCenterMenuService userCenterMenuService) {
		this.userCenterMenuService = userCenterMenuService;
	}

	
}
