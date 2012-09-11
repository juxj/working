package com.zj198.service.user;

import java.util.Date;

import com.zj198.model.UsrContract;
import com.zj198.model.UsrUser;
import com.zj198.util.Pager;

public interface AccountService {
	/**
	 * 新增用户
	 * @param username
	 * @param password
	 * @param mobile
	 * @param email
	 * @param gender
	 * @param realname
	 * @param activeCode
	 * @return 成功返回用户id 用户名重复-1 手机号重复-2 email重复-3
	 */
	public int addUser(String username,String password,String mobile,String email,String realname,Short gender,String activeCode,Short userType);
	
	/**
	 * 用户登录，成功则记录登录历史
	 * @param username
	 * @param password
	 * @param ip
	 * @return 返回简单用户对象，登录失败返回null
	 */
	public UsrUser userLogin_tx(String username,String password,String ip);
	
	/**
	 * 更新用户类型，仅用于用户类型未确定初次选择类型，判断传入类型为枚举之一
	 * @param userId
	 * @param userType
	 * @return 成功为0，未更新-1
	 */
	public int updateUserType(Integer userId, Short userType);
	/*** 管理员审核用户信息* @param userId* @param audit*/
	public void updateUserAudit(Integer userId, Short audit);
	/*** 管理员管理用户状态* @param userId* @param status*/
	public void updateUserStatus(Integer userId, Short status);
	/**用户更改邮箱时 查看是否已被注册     true 已被使用   false可以使用*/
	public boolean isUserEmail(String email);
	/**用户更改moble时 查看是否已被注册     true 已被使用   false可以使用*/
	public boolean isUserMobile(String mobile);
	
	/**
	 * 用户激活
	 * @param uid
	 * @param activeType
	 * @param activecode
	 * @return 成功返回用户id，失败返回-1
	 */
	public int activeUser_tx(int uid, String activeType,String activecode);
	
	/**
	 * 用户激活
	 * @param username
	 * @param activecode
	 * @return 成功返回用户id，失败返回-1
	 */
	public int activeUser_tx(String username, String activecode);
	
	
	/**
	 * 根据用户账号找用户对象
	 * @param username
	 * @return 找到返回对象，没找到返回null
	 */	
	public UsrUser getUserByUsername(String username);
	
	/**
	 * 查找当天注册用户
	 * @return 分页对象Pager
	 */
	public Pager findUserByTodayReg(Integer pageNo,Integer pageSize);
	
	/**
	 * 根据用户名姓名模糊搜索用户
	 * @return 分页对象Pager
	 */
	public Pager findByMutiCondition(String username,String realname,Short auditStatus,String userType,Integer pageNo,Integer pageSize,String email, String mobile, Date[] createdt, Date[] logindt);
	
	/**
	 * 根据用户id找用户对象
	 * @param uid
	 * @return 找到返回对象，没找到返回null
	 */	
	public UsrUser getUserById(Integer uid);
	
	/**
	 * 更新用户，注意如果用户登录了，需要同时更新session
	 * @param user
	 * @return 成功为大于0，未更新-1
	 */
	public int updateUser(UsrUser user);
	
	
	/**获取指定用户的协议签订记录*/
	public Pager findUserContracts(UsrUser user, int pageSize, int pageNo);
	
	
	/**所有用户的协议签订记录*/
	public Pager findUserContracts(int pageSize, int pageNo);
	
	
	/**记录用户已寄回的协议内容*/
	public void saveOrUpdateUsrContract(UsrContract instance);
	
	
	/**获取用户协议相关内容*/
	public UsrContract getUserContract(Integer id); 
	

}
