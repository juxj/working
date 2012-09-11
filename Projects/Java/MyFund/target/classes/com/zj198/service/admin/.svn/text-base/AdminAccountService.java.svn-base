package com.zj198.service.admin;

import java.util.List;

import com.zj198.model.AdmFunction;
import com.zj198.model.AdmUser;

public interface AdminAccountService {
	/**
	 * 管理登录
	 * @param username
	 * @param password
	 * @param ip
	 * @return AdmUser
	 */
	public AdmUser adminLogin_tx(String username,String password,String ip);
	
	/**
	 * 获取权限范围内的功能列表
	 * @param rights
	 * @return FunctionList
	 */
	public List<AdmFunction> findByRights(Long rights);
	
	/**
	 * 获取所有菜单功能列表
	 * @return FunctionList
	 */
	public List<AdmFunction> findAllMenu();
	
	/**
	 * 获取所有管理员列表
	 * @return List
	 */
	public List<AdmUser> findAllAdminuser();
	
	/**
	 * 获取管理员
	 * @param id
	 * @return AdmUser
	 */
	public AdmUser getAdmUserById(Integer id);
	
	/**
	 * 更新管理用户
	 * @param admUser
	 */
	public void updateAdmUser(AdmUser admUser);
	
	/**
	 * 添加管理员
	 * @param admUser
	 * @return -1失败 0成功
	 */
	public int addAdmUser(AdmUser admUser);
	public AdmFunction getByActionName(String actionName);
}
