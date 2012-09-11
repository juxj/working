package com.zj198.action.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.NtyMessageQueue;
import com.zj198.model.UsrUser;
import com.zj198.service.common.NotifyQueueService;
import com.zj198.service.user.AccountService;
import com.zj198.util.Constants;
import com.zj198.util.FreemarkerUtil;
import com.zj198.util.PropertiesUtil;
import com.zj198.util.SecurityUtil;
import com.zj198.util.StringUtil;

/**
 * 用户注册类
 * @author Patrick
 *
 */
public class RegisterAction extends BaseAction{
	private String username;
	private String password;
	private String mobile;
	private String email;
	private String realname;
	private Short gender;
	private Short type;//企业类别，在快速申请中指定
	
	private AccountService accountService;
	private NotifyQueueService notifyQueueService;
	/**
	 * 注册页面
	 * @return
	 */
	public String execute(){
		return "register";
	}
	
	/**
	 * 标准注册
	 */
	public String register(){
//		System.out.println(username);
		return commRegister("activate","register");
	}
	
	/**
	 * 快速注册，用于快速融资申请过程中注册
	 */
	public String rapidRegister(){
		if(type==null){
			msg="ERROR：user type is not defined.";
			return ERROR;
		}
		String str = commRegister("ajax","ajax");
		if(msg==null){
			msg = SUCCESS;
		}
		return str;
	}
	
	//内部方法，注册过程
	private String commRegister(String succStr,String failStr){
		if(StringUtils.isBlank(username) || StringUtils.isBlank(password) || StringUtils.isBlank(mobile) || StringUtils.isBlank(email) || StringUtils.isBlank(realname) || gender==null){
			msg = "请填写所有必填项目，再提交注册。";
			return failStr;
		}
		if(!StringUtil.validUserName(username) || !StringUtil.validPwd(password) || !StringUtil.validMobile(mobile) || !StringUtil.validEmail(email) || !StringUtil.validRname(realname) || (gender!=Constants.USER_GENDER_FEMALE && gender!=Constants.USER_GENDER_MALE)){
			msg = "填写格式不正确。";
			return failStr;
		}
		//获取默认验证方式
		int activeType = Integer.parseInt(PropertiesUtil.getByKey("activeType"));
		String activeCode = StringUtil.createActiveCode();
		int uid = accountService.addUser(username,password,mobile,email,realname,gender,activeType+"|"+activeCode,type);
		if(uid>0){//发送验证
			//注册完成即登录
			ActionContext context = ActionContext.getContext();
			HttpServletRequest request = ServletActionContext.getRequest();
			UsrUser _user = accountService.userLogin_tx(username, password, request.getRemoteAddr());
			context.getSession().put("_user", _user);
			if(activeType==1){//邮件验证
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("url", PropertiesUtil.getByKey("url"));
				map.put("realname", realname);
				if(gender==1){
					map.put("gender", "先生");
				}else{
					map.put("gender", "女士");
				}
				String v = new SecurityUtil().des_encrypt(uid+"|"+activeType+"|"+activeCode);
				map.put("actionUrl", "Account!activate.act?v="+v);
				map.put("activeCode", activeCode);
				String body="";
				try {
					body = FreemarkerUtil.getContent("registerActive.htm", map, false, null, null);
				} catch (Exception e) {
					e.printStackTrace();
					return ERROR;
				}
				NtyMessageQueue message = new NtyMessageQueue();
				message.setTitle("注册验证邮件 - 中国资金网");
				message.setContent(body);
				message.setReceiver(email);
				message.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
				notifyQueueService.addNewMessage(message);
			}else if(activeType==2){//TODO:手机验证
				
			}
			if(succStr.equals("activate")){
				msg = "您的帐户还没有激活，请检查您的注册邮箱激活您的帐户。";
			}
			return succStr;
		}else if(uid==-1){
			msg = "注册失败：该用户名已被注册。";
		}else if(uid==-2){
			msg = "注册失败：该手机号已被注册并验证。";
		}else if(uid==-3){
			msg = "注册失败：该Email已被注册并验证。";
		}
		return failStr;
	}

	//setter and getter
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMobile() {
		return mobile;
	}

	public Short getGender() {
		return gender;
	}

	public void setGender(Short gender) {
		this.gender = gender;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getRealname() {
		return realname;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setType(Short type) {
		this.type = type;
	}
	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}
	
}
