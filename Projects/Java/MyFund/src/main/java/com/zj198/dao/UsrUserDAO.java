package com.zj198.dao;

import java.util.Date;
import java.util.List;

import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public interface UsrUserDAO extends BaseDAO<UsrUser, Integer> {
	
	/**
	 * 检查是否存在此用户名的用户
	 * @param username
	 * @return 存在返回true，否则返回false
	 */
	public boolean isExistUsername(String username);
	/**
	 * 检查是否存在此手机的用户，除uid用户以外
	 * @param mobile
	 * @param uid
	 * @return 存在返回true，否则返回false
	 */
	public boolean isExistMobile(String mobile,Integer uid);
	
	/**
	 * 检查是否存在此email的用户，除uid用户以外
	 * @param email
	 * @param uid
	 * @return 存在返回true，否则返回false
	 */
	public boolean isExistEmail(String email,Integer uid);
	
	/**
	 * 根据用户名查找用户
	 * @param username
	 * @return 用户对象，找不到返回null
	 */
	public UsrUser getByUsername(String username);
	/**
	 * 根据用户类型获取用户清单
	 * @param type
	 * @return
	 */
	public List<UsrUser> findUserByType(Short type);
	
	/**模糊查询用户*/
	public List<UsrUser> getUserList(String userName);//TODO:调整改用findByUsernameRealname(String username,String realname,Integer pageNo,Integer pageSize)?
	
	/**
	 * 分页查询当天注册用户
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pager findUserByTodayReg(Integer pageNo,Integer pageSize);
	
	/**
	 * 分页模糊查询用户
	 * @param username
	 * @param realname
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	public Pager findByMutiCondition(String username,String realname,Short auditStatus,String userType,Integer pageNo,Integer pageSize,String email, String mobile, Date[] createdt, Date[] logindt);
}
