package com.zj198.service.admin.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.zj198.dao.AdmFunctionDAO;
import com.zj198.dao.AdmUserDAO;
import com.zj198.model.AdmFunction;
import com.zj198.model.AdmUser;
import com.zj198.service.admin.AdminAccountService;
import com.zj198.util.NumberUtil;
import com.zj198.util.SecurityUtil;

public class AdminAccountServiceImpl implements AdminAccountService {
	private AdmUserDAO admUserDAO;
	private AdmFunctionDAO admFunctionDAO;
	public void setAdmUserDAO(AdmUserDAO admUserDAO) {
		this.admUserDAO = admUserDAO;
	}
	public void setAdmFunctionDAO(AdmFunctionDAO admFunctionDAO) {
		this.admFunctionDAO = admFunctionDAO;
	}

	@Override
	public AdmUser adminLogin_tx(String username, String password, String ip) {
		AdmUser admin = admUserDAO.getByUsername(username);
		if(admin!=null && admin.getPassword().equals(SecurityUtil.getMD5(password))){
			return new AdmUser(admin.getId(),admin.getRealname(),admin.getStatus(),admin.getRights());
		}
		return null;
	}
	
	@Override
	public List<AdmFunction> findByRights(Long rights) {
		List<AdmFunction> list = new ArrayList<AdmFunction>();
		List<AdmFunction> functions = admFunctionDAO.findAllMenu();
		for(AdmFunction fun: functions){
			if(NumberUtil.ifExist(rights, fun.getRights())){
				list.add(fun);
			}
		}
		return list;
	}
	public AdmFunction getByActionName(String actionName){
		return admFunctionDAO.getByActionName(actionName);
	}
	@Override
	public List<AdmFunction> findAllMenu(){
		return admFunctionDAO.findAllMenu();
	}
	
	@Override
	public List<AdmUser> findAllAdminuser() {
		return admUserDAO.findAll();
	}
	
	@Override
	public AdmUser getAdmUserById(Integer id) {
		return admUserDAO.get(id);
	}
	
	@Override
	public void updateAdmUser(AdmUser admUser) {
		admUser.setUpdatedt(Calendar.getInstance().getTime());
		admUserDAO.update(admUser);
	}
	
	@Override
	public int addAdmUser(AdmUser admUser){
		if(admUserDAO.getByUsername(admUser.getUsername())!=null){
			return -1;
		}
		admUser.setCreatedt(Calendar.getInstance().getTime());
		admUser.setRights(0L);
		admUser.setUpdatedt(admUser.getCreatedt());
		admUserDAO.save(admUser);
		return 0;
	}
}
