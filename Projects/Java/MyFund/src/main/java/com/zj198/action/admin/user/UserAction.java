package com.zj198.action.admin.user;

import java.util.Date;

import com.zj198.action.BaseAction;
import com.zj198.model.UsrUser;
import com.zj198.service.user.AccountService;
import com.zj198.util.Constants;
import com.zj198.util.Pager;

//用户管理
public class UserAction extends BaseAction{
	private Integer uid;
	private String username;
	private String realname;
	private String userType;
	private Short auditStatus;
	private String email;
	private String mobile;
	private Date[] createdt;
	private Date[] logindt;
	
	private UsrUser usrUser;
	private Pager pager;
	private Integer pageNo;
	private AccountService accountService;
	
	private static final Integer pageSize=8;
	private Integer updateStatus;
	
	//列出当天注册的用户
	public String execute(){
		pager = accountService.findUserByTodayReg(pageNo,200);//当天注册不分页
		return SUCCESS;
	}
	
	//按条件搜索用户
	public String search(){
		pager = accountService.findByMutiCondition(username,realname,auditStatus,userType,pageNo,pageSize,email,mobile,createdt,logindt);
		return SUCCESS;
	}
	
	/**解除用户登录禁止*/
	public String details(){
		if(uid==null || uid<1){
			msg="没有用户。";
			return ERROR;
		}
		usrUser=accountService.getUserById(uid);
		if(usrUser==null){
			msg="没有用户。";
			return ERROR;
		}
		return "_userInfo";
	}
	/**禁止用户登录*/
	public String blockUser(){
		if(uid!=null && uid!=0){
			accountService.updateUserStatus(uid, Constants.USER_STATUS_BLOCKED);
		}else{
			msg="没有用户。";
			return ERROR;
		}
		msg=SUCCESS;
		return "ajax";
	}
	
	/**解除用户登录禁止*/
	public String unBlockUser(){
		if(uid!=null && uid!=0){
			accountService.updateUserStatus(uid, Constants.USER_STATUS_AVAILABLE);
		}else{
			msg="没有用户。";
			return ERROR;
		}
		msg=SUCCESS;
		return "ajax";
	}

	//setter and getter
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public UsrUser getUsrUser() {
		return usrUser;
	}
	public Pager getPager() {
		return pager;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public Short getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(Short auditStatus) {
		this.auditStatus = auditStatus;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Date[] getCreatedt() {
		return createdt;
	}

	public void setCreatedt(Date[] createdt) {
		this.createdt = createdt;
	}

	public Date[] getLogindt() {
		return logindt;
	}

	public void setLogindt(Date[] logindt) {
		this.logindt = logindt;
	}

	public Integer getUpdateStatus() {
		return updateStatus;
	}

	public void setUpdateStatus(Integer updateStatus) {
		this.updateStatus = updateStatus;
	}

	
	
	
}
