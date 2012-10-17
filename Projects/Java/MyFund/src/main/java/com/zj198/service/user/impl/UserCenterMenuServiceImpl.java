package com.zj198.service.user.impl;

import java.util.List;

import com.zj198.dao.UsrMenuDAO;
import com.zj198.model.UsrMenu;
import com.zj198.service.user.UserCenterMenuService;

public class UserCenterMenuServiceImpl implements UserCenterMenuService {
	private UsrMenuDAO usrMenuDAO;
	
	public void setUsrMenuDAO(UsrMenuDAO usrMenuDAO) {
		this.usrMenuDAO = usrMenuDAO;
	}

	@Override
	public List<UsrMenu> findMenuListByGroupType(Integer userTypeGroup) {
		return usrMenuDAO.findMenuListByGroupType(userTypeGroup);
	}

}
