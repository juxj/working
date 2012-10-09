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
 * 用户账户类
 * 
 * @author Patrick
 */
public class AccountAction extends BaseAction {
	private UsrUser usrUser;
	
	private String mobile;
	private String realname;
	private Short gender;
	private String username;
	private String email;
	private String password;
	private String verifycode;
	private Integer loginType;//1为普通登录 2为证书登录
	private String activeCode;//激活验证码
	private String v;//加密后的激活验证码
	private AccountService accountService;
	private NotifyQueueService notifyQueueService;
	private String rtnurl;

	/**
	 * 登录页面 cookie
	 */
	public String execute(){
		return LOGIN;
	}

	/**
	 * 标准登录 根据用户名、密码、验证码和用户status登录用户，保存基本用户信息至session, 清除验证码session
	 */
	public String login() {
		ActionContext context = ActionContext.getContext();
//		if(context.getSession().get("_user")!=null){
//			return "userCenter";
//		}else{
			if (loginType != null && StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(verifycode)) {
				if (loginType == 1) {// 普通登录
					if(context.getSession().get("_vcode")!=""){
						if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
	//						context.getSession().remove("_vcode");//避免用户浏览器后退造成图片在却没有验证码
							HttpServletRequest request = ServletActionContext.getRequest();
							String ip = request.getRemoteAddr();
							UsrUser _user = accountService.userLogin_tx(username, password, ip );
							if (_user != null) {
								if (_user.getStatus() == Constants.USER_STATUS_AVAILABLE){
									context.getSession().put("_user", _user);
									UsrUser usrUser= accountService.getUserById(_user.getId());
									if(usrUser.getOldid()!=null){
										realname=usrUser.getRealname();
										gender=usrUser.getGender();
										email=usrUser.getEmail();
										mobile=usrUser.getMobile();
										return "oldActivate";
									}
									if(StringUtils.isBlank(rtnurl)){
										return "userCenter";
									}else{
										return "next";
									}
								}else{
									msg = "对不起，你被禁止登录。";
									return LOGIN;
								}
							}
							msg = "用户名或密码输入错误，请重新输入。";
							return LOGIN;
						}
					}
					msg = "验证码输入错误，请重新输入。";
					return LOGIN;
				}else if(loginType==2){//TODO:证书方式登录
					msg = "暂时不支持证书登录。";
					return LOGIN;
				}
			}
//		}
		msg = "出现错误，请再次尝试。";
		return LOGIN;
	}
	
	/**
	 * 快速登录，不考虑后面的激活，类型选择等跳转问题，目前用于快速融资申请过程中的登录
	 * @return ajax
	 */
	public String RapidLogin(){
		if (loginType != null && StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password) && StringUtils.isNotBlank(verifycode)) {
			if (loginType == 1) {
				ActionContext context = ActionContext.getContext();
				if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
					context.getSession().remove("_vcode");
					HttpServletRequest request = ServletActionContext.getRequest();
					String ip = request.getRemoteAddr();
					UsrUser _user = accountService.userLogin_tx(username, password, ip);
					if (_user != null) {
						if (_user.getStatus() == Constants.USER_STATUS_AVAILABLE){
							context.getSession().put("_user", _user);
							msg=SUCCESS;
							return "ajax";
						}else{
							msg = "对不起，你被禁止登录。";
							return "ajax";
						}
					}
					msg = "用户名或密码输入错误，请重新输入。";
					return "ajax";
				}
				msg = "验证码输入错误，请重新输入。";
				return "ajax";
			}else if(loginType==2 && StringUtils.isNotBlank(password)){//TODO:证书方式登录
				
			}
		}
		msg = "出现错误，请联系管理员。";
		return "ajax";
	}
	
	/**
	 * 通过手机或邮箱激活帐户
	 * @return
	 */
	public String activate(){
		int uid=0;
		if(v!=null){//邮件链接直接点击
			String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
			if(codes.length==3){
				uid = accountService.activeUser_tx(Integer.parseInt(codes[0]),codes[1],codes[2]);
				if(uid>=0){
					ActionContext context = ActionContext.getContext();
					Object o = context.getSession().get("_user");
					if(o!=null){
						UsrUser user = (UsrUser)o;
						uid = accountService.activeUser_tx(user.getUsername(),activeCode);
						user.setActivetype((short) (Short.parseShort(PropertiesUtil.getByKey("activeType")) + user.getActivetype()));
						context.getSession().put("_user",user);
						msg="用户您好，您的账户已经激活。";
					}else{
						msg="用户您好，您的账户已经激活，请登录使用。";
					}
				}
			}
		}else if(activeCode!=null){
			ActionContext context = ActionContext.getContext();
			Object o = context.getSession().get("_user");
			if(o!=null){
				UsrUser user = (UsrUser)o;
				uid = accountService.activeUser_tx(user.getUsername(),activeCode);
				if(uid>0){
					user.setActivetype((short) (Short.parseShort(PropertiesUtil.getByKey("activeType")) + user.getActivetype()));
					context.getSession().put("_user",user);
					msg="用户您好，您的账户已经激活。";
				}else if(uid==0){
					msg="用户您好，您的账户已经激活。";
				}else{
					UsrUser usrUser=accountService.getUserById(user.getId());
					email=usrUser.getEmail();
					msg="激活码输入错误，请检查后重新输入。";
					return "activate";
				}
			}else{
				msg="您好，输入验证码的方式激活需要先登录。";
			}
		}else{
			return ERROR;
		}
		return "activateResult";
		
		
//		ActionContext context = ActionContext.getContext();
//		Object o = context.getSession().get("_user");
//		if(o!=null){
//			UsrUser user = (UsrUser)o;
//			if(user.getActivetype()==Constants.USER_ACTIVE_NONE){
//				int uid=0;
//				if(v!=null){//邮件链接直接点击
//					String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
//					if(codes.length==3){
//						uid = accountService.activeUser_tx(Integer.parseInt(codes[0]),codes[1],codes[2]);
//					}
//				}else if(activeCode!=null){
//					uid = accountService.activeUser_tx(user.getUsername(),activeCode);
//				}
//				if(uid>0){
//					user.setActivetype(Short.parseShort(PropertiesUtil.getByKey("activeType")));
//					context.getSession().put("_user",user);
//					msg = "激活成功。";
//				}else{
//					msg = "激活失败，请重新尝试。";
//				}
//			}else{
//				msg="用户您好，您的账户已经激活。";
//			}
//		}else{
//			msg="您好，请登录你的账号。";
//		}
//		return "activateResult";
	}
	
	/**
	 * 更改注册时邮箱或手机并发送激活码
	 * @return
	 */
	public String reSendActiveCode(){
		//改名：reSendActiveCode()
		//按新输入Email or mobile 发送
		//更新数据库中User内容（email or mobile）
		int activeType = Integer.parseInt(PropertiesUtil.getByKey("activeType"));
		ActionContext context = ActionContext.getContext();
		UsrUser sUser = (UsrUser)context.getSession().get("_user");
		UsrUser user=accountService.getUserById(sUser.getId());
		if(activeType==1){//邮件验证
			if(!StringUtils.isBlank(verifycode) && !StringUtils.isBlank(email)){
				if(context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)){
					//context.getSession().remove("_vcode");
				}else{
					msg="验证码错误。";
					return "ajax";
				}
				if(user.getEmail().equalsIgnoreCase(email) && StringUtil.validEmail(email)){
					email=user.getEmail();
					Map<String,Object> map = new HashMap<String,Object>();
					String body;
					map.put("url", PropertiesUtil.getByKey("url"));
					map.put("realname", user.getRealname());
					if(user.getGender()==1){
						map.put("gender", "先生");
					}else{
						map.put("gender", "女士");
					}
					String v = new SecurityUtil().des_encrypt(user.getId()+"|"+user.getActivecode());
					map.put("actionUrl", "Account!activate.act?v="+v);
					map.put("activeCode", user.getActivecode().split("\\|")[1]);
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
					msg=SUCCESS;
					return "ajax";
				}else if(StringUtil.validEmail(email)){
					if(!accountService.isUserEmail(email)){
						user.setEmail(email);
						if(accountService.updateUser(user)>0){
							Map<String,Object> map = new HashMap<String,Object>();
							String body;
							map.put("url", PropertiesUtil.getByKey("url"));
							map.put("realname", user.getRealname());
							if(user.getGender()==1){
								map.put("gender", "先生");
							}else{
								map.put("gender", "女士");
							}
							String v = new SecurityUtil().des_encrypt(user.getId()+"|"+user.getActivecode());
							map.put("actionUrl", "Account!activate.act?v="+v);
							map.put("activeCode", user.getActivecode().split("\\|")[1]);
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
							msg=SUCCESS;
							return "ajax";
						}
					}
					msg="邮箱已被注册。";
				    return "ajax";
				}
			    msg="邮箱填写错误";
			    return "ajax";
			}else{
				email=user.getEmail();
				Map<String,Object> map = new HashMap<String,Object>();
				String body;
				map.put("url", PropertiesUtil.getByKey("url"));
				map.put("realname", user.getRealname());
				if(user.getGender()==1){
					map.put("gender", "先生");
				}else{
					map.put("gender", "女士");
				}
				String v = new SecurityUtil().des_encrypt(user.getId()+"|"+user.getActivecode());
				map.put("actionUrl", "Account!activate.act?v="+v);
				map.put("activeCode", user.getActivecode().split("\\|")[1]);
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
				msg=SUCCESS;
				return "ajax";
//				msg="请填写email和 验证码 。";
//				return "ajax";
			}
		}else if(activeType==2){//TODO:手机验证
			
		}
		msg="系统错误，请联系管理员。";
		return ERROR;
	}
	/**编辑注册信息----*/
	public String editRegInfo(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		usrUser = accountService.getUserById(user.getId());
		if(StringUtils.isBlank(realname) && StringUtils.isBlank(email) && StringUtils.isBlank(mobile) && (gender==Constants.USER_GENDER_FEMALE || gender==Constants.USER_GENDER_MALE)){
			msg="请填写注册信息。";
			return "ajax";
		}
		if(StringUtil.validRname(realname) && StringUtil.validEmail(email) && StringUtil.validMobile(mobile) && (gender==Constants.USER_GENDER_FEMALE || gender==Constants.USER_GENDER_MALE)){
			usrUser.setRealname(realname);
			usrUser.setGender(gender);
			user.setRealname(realname);
			user.setGender(gender);
			if(accountService.isUserMobile(mobile)){
				msg="手机重复。";
				return "ajax";
			}
			if(accountService.isUserEmail(email)){				
				msg="邮箱重复。";
				return "ajax";
			}
			if(usrUser.getEmail().equals(email)){				//Email未修改
				if(!usrUser.getMobile().equals(mobile)){			//手机号修改了
					if(usrUser.getActivetype()==Constants.USER_ACTIVE_ALL || usrUser.getActivetype()==Constants.USER_ACTIVE_MOBILE){
						usrUser.setActivetype((short)(usrUser.getActivetype()-Constants.USER_ACTIVE_MOBILE));
						user.setActivetype(usrUser.getActivetype());
					}
					usrUser.setMobile(mobile);
					//oldInfo(usrUser);
					if(accountService.updateUser(usrUser)>0){
						ctx.getSession().put("_user", user);
						//TODO: 增加发送手机激活码
						msg=SUCCESS;
						return "ajax";
					}
					msg="更新失败。";
					return "ajax";
				}
//				if(usrUser.getOldid()!=null){
//					oldInfo(usrUser);
//					if(accountService.updateUser(usrUser)>0){
//						ctx.getSession().put("_user", user);
//						//TODO: 增加发送手机激活码
//						msg=SUCCESS;
//						return "ajax";
//					}
//					msg="更新失败。";
//					return "ajax";
//				}
				if(accountService.updateUser(usrUser)>0){
					ctx.getSession().put("_user", user);
					msg=SUCCESS;
					return "ajax";
				}
				msg="更新失败。";
				return "ajax";
			}else{												//Email修改了
				if(usrUser.getActivetype()==Constants.USER_ACTIVE_ALL || usrUser.getActivetype()==Constants.USER_ACTIVE_EMAIL){
					usrUser.setActivetype((short)(usrUser.getActivetype()-Constants.USER_ACTIVE_EMAIL));
					user.setActivetype(usrUser.getActivetype());
				}
				usrUser.setEmail(email);
				if(!usrUser.getMobile().equals(mobile)){			//手机号修改了
					if(usrUser.getActivetype()==Constants.USER_ACTIVE_ALL || usrUser.getActivetype()==Constants.USER_ACTIVE_MOBILE){
						usrUser.setActivetype((short)(usrUser.getActivetype()-Constants.USER_ACTIVE_MOBILE));
						user.setActivetype(usrUser.getActivetype());
					}
					usrUser.setMobile(mobile);
				}
				oldInfo(usrUser);
				if(accountService.updateUser(usrUser)>0){
					ctx.getSession().put("_user", user);
					msg=SUCCESS;
					return "ajax";
				}
				msg="更新失败。";
				return "ajax";
			}
		}
		msg="请填写正确的注册信息。";
		return "ajax";
	}
	/**
	 * 登出 清除session
	 * 
	 * @return
	 */
	public String logout() {
		ActionContext.getContext().getSession().remove("_user");
		ActionContext.getContext().getSession().remove("mparamid");
		
		return LOGIN;
	}
	/** 老用户第一次登录需激活    修改注册信息需激活*/
    private void oldInfo(UsrUser usrUser){
    	if(usrUser.getOldid()!=null){
    		int activeType = Integer.parseInt(PropertiesUtil.getByKey("activeType"));
    		usrUser.setActivecode(activeType+"|"+StringUtil.createActiveCode());
    		usrUser.setOldid(null);
    		//TODO: 增加邮件和手机验证码的发送
    		Map<String,Object> map = new HashMap<String,Object>();
			map.put("url", PropertiesUtil.getByKey("url"));
			map.put("realname", usrUser.getRealname());
			if(usrUser.getGender()==1){
				map.put("gender", "先生");
			}else{
				map.put("gender", "女士");
			}
			String v = new SecurityUtil().des_encrypt(usrUser.getId()+"|"+usrUser.getActivecode());
			map.put("actionUrl", "Account!activate.act?v="+v);
			map.put("activeCode", usrUser.getActivecode().split("\\|")[1]);
			String body="";
			try {
				body = FreemarkerUtil.getContent("registerActive.htm", map, false, null, null);
			} catch (Exception e) {
				e.printStackTrace();
				return;
			}
			NtyMessageQueue message = new NtyMessageQueue();
			message.setTitle("注册验证邮件 - 中国资金网");
			message.setContent(body);
			message.setReceiver(usrUser.getEmail());
			message.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(message);
    	}else{
    		//if(!usrUser.getEmail().equals(email)){
			String activeCode=StringUtil.createActiveCode();
			usrUser.setActivecode(Integer.parseInt(PropertiesUtil.getByKey("activeType"))+"|"+activeCode);
    		Map<String,Object> map = new HashMap<String,Object>();
			String body;
			map.put("url", PropertiesUtil.getByKey("url"));
			map.put("realname", usrUser.getRealname());
			if(usrUser.getGender()==1){
				map.put("gender", "先生");
			}else{
				map.put("gender", "女士");
			}
			String v = new SecurityUtil().des_encrypt(usrUser.getId()+"|"+usrUser.getActivecode());
			map.put("actionUrl", "Account!activate.act?v="+v);
			map.put("activeCode", activeCode);
			try {
				body = FreemarkerUtil.getContent("registerActive.htm", map, false, null, null);
			} catch (Exception e) {
				e.printStackTrace();
				return ;
			}
			NtyMessageQueue message = new NtyMessageQueue();
			message.setTitle("注册验证邮件 - 中国资金网");
			message.setContent(body);
			message.setReceiver(usrUser.getEmail());
			message.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
			notifyQueueService.addNewMessage(message);
		}
    	//}
    }
	/**
	 * 加入手机验证码
	 */
	public String sendMoblie(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		usrUser = accountService.getUserById(user.getId());
		if(usrUser.getActivetype() != Constants.USER_ACTIVE_NONE){
			if(usrUser.getActivetype() != Constants.USER_ACTIVE_ALL){
				String activeCode;
				if(usrUser.getActivecode() == null){
					activeCode=StringUtil.createActiveCode();
					usrUser.setActivecode(Constants.USER_ACTIVE_MOBILE+"|"+activeCode);
					if(accountService.updateUser(usrUser)<0){
						msg="系统错误请联系管理员。";
						return "ajax";
					}
				}else{
					activeCode=usrUser.getActivecode().split("\\|")[1];
				}
				String userGender="";
				if(usrUser.getGender()==1){
					userGender="先生";
				}else{
					userGender="女士";
				}
				NtyMessageQueue message = new NtyMessageQueue();
				message.setType(Constants.NTYMESSAGEQUEUE_TYPE_SMS);
				message.setTitle("");
				message.setContent(String.format(PropertiesUtil.getByKey("sms.template.veriry"),usrUser.getRealname(),userGender,activeCode));
				message.setReceiver(usrUser.getMobile());
				notifyQueueService.addNewMessage(message);
//						user.setActivetype(Constants.USER_ACTIVE_ALL);
//						ctx.getSession().put("_user", user);
				msg=SUCCESS;
				return "ajax";
				
			}
			msg="您的手机已通过验证。";
			return "ajax";
		}
		msg="邮箱还没有通过验证，请验证邮箱。";
		return "ajax";
	}
	// setter and getter
	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}
	public void setActiveCode(String activeCode) {
		this.activeCode = activeCode;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsername() {
		return username;
	}
	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setLoginType(Integer loginType) {
		this.loginType = loginType;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setV(String v) {
		this.v = v;
	}
	public String getRtnurl() {
		return rtnurl;
	}
	public void setRtnurl(String rtnurl) {
		this.rtnurl = rtnurl;
	}
	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}

	public String getEmail() {
		return email;
	}

	public void setUsrUser(UsrUser usrUser) {
		this.usrUser = usrUser;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Short getGender() {
		return gender;
	}

	public void setGender(Short gender) {
		this.gender = gender;
	}

}