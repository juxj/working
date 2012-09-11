package com.zj198.service.user;

import java.util.List;

import com.zj198.model.UserModel;
import com.zj198.model.UsrLoginhistory;
import com.zj198.model.UsrMenu;
import com.zj198.model.UsrOrgAttach;


public interface ProfileService {
	
	/**
	 * 保存用户的profile, 自动根据当前登录的用户的类型保存到不同表
	 * @param profile
	 */
	public void saveorupdate(Object profile);
	
	/**
	 * 获取用户的profile
	 * @param uid
	 * @return Object类型, 使用前自行造型
	 */
	public Object getProfiles(Integer uid);
	
	/**
	 * 根据用户的类型type获取用户组类型id
	 * @param userType
	 * @return 组类型（个人，银行，金融机构，服务机构，企业）
	 */
	public int getGroupidByUserType(Short userType);
	
	/**
	 * 获取用户登录最后一次记录
	 * @param uid
	 * @return
	 */
	public UsrLoginhistory getLoginHistory();
	
	/**
	 * 根据用户组类型获取用户中心菜单
	 * @param userTypeGroup
	 * @return 菜单list
	 */
	public List<UsrMenu> findMenuListByUid(Integer userTypeGroup);
	
	/**获取签约方数据(JSON)*/
	public List<UserModel> getUserList(Short userType, String userName);
	/**根据用户id查询 用户上传所有组件*/
	public List<UsrOrgAttach> fintByUid(Integer uid);
	/**根据用户id和上传类型 查询 用户上传组件*/
	public UsrOrgAttach getByUidAttachType(Integer uid ,Integer type);
	/**根据上传的id查询 用户上传组件*/
	public UsrOrgAttach getById(Integer id);
	/**save usrorgattach*/
	public void save(UsrOrgAttach usrOrgAttach);
	/**update usrorgattach*/
	public void update(UsrOrgAttach usrOrgAttach);
}
