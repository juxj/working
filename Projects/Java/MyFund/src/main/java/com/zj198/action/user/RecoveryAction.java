package com.zj198.action.user;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

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
 * 账户恢复类
 * @author Patrick
 *
 */
public class RecoveryAction extends BaseAction {
	private String v;        //邮箱的链接地址
	private String username;  //用户账号
	private String verifycode;  //验证码
	private String email;
	private String mobile;   //用户在找回密码中，未填写邮箱，则需要通过填写的手机号码来找回
	private String password;
	private UsrUser user;
	private String realname;
	private Short gender;
	private AccountService accountService;
	private NotifyQueueService notifyQueueService;
	
	/**
	 * 找回密码页面
	 * @return
	 */
	@Override
	public String execute(){
		return "recoverPage";
	}
	
	/**
	 *验证账号并 发送email验证
	 * @return
	 */
	public String sendVerify(){
		ActionContext context = ActionContext.getContext();
		if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
			//context.getSession().remove("_vcode");
			if (StringUtils.isNotBlank(username)) {  //通过账号找回
				String activeCode = StringUtil.createActiveCode();
				user=accountService.getUserByUsername(username);
				if(user!=null){
					if(!StringUtils.isBlank(user.getEmail())){
						user.setPasstoken(activeCode);
						if(accountService.updateUser(user)>0){
							Map<String,Object> map = new HashMap<String,Object>();
							try {
								map.put("url", PropertiesUtil.getByKey("url"));
								String v = new SecurityUtil().des_encrypt(user.getUsername()+"|"+activeCode);
								map.put("actionUrl", "Recovery!verify.act?v="+v);
								String body = FreemarkerUtil.getContent("recoveryPwd.htm", map, false, null, null);
								NtyMessageQueue message = new NtyMessageQueue();
								message.setTitle("密码找回邮件 - 中国资金网");
								message.setContent(body);
								message.setReceiver(user.getEmail());
								message.setType(Constants.NTYMESSAGEQUEUE_TYPE_EMAIL);
								notifyQueueService.addNewMessage(message);
	//							MailSendUtil.sendMail(subject, body, user.getEmail());
							} catch (Exception e) {
								e.printStackTrace();//TODO:log.error("验证邮件发送失败");
								msg="邮件发送失败";
								return ERROR;
							}
							email=user.getEmail();
							return "sendSuccess";
						}
					}else if(!StringUtils.isBlank(user.getMobile())){
						mobile="1";
						return "recoverPage";
					}else{
						UsrUser _user = user;
						ActionContext cont = ActionContext.getContext();
//						Short a=0;
//						_user.setType(a);
						cont.getSession().put("_user", _user);
						realname=user.getRealname();
						gender=user.getGender();
						email=user.getEmail();
						mobile=user.getMobile();
						return "oldActivate";
					}
				}
				msg="用户不存在。";
				return "recoverPage";
			}
			msg="账号为空，请重新输入。";
			return "recoverPage";
		}
		msg="验证码错误，请重新输入。";
		return "recoverPage";
	}
	

	/**
	 * 校验email连接的信息
	 * @return
	 */
	public String verify(){
		if(v!=null){//邮件链接直接点击
			String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
			user=accountService.getUserByUsername(codes[0]);
			if(user!=null){
				if(user.getPasstoken()!=null){
					if(user.getPasstoken().equalsIgnoreCase(codes[1])){
						msg = "验证信息成功。";
						return "resetPwd";
					}
				}
				msg="该链接已失效。";
				return ERROR;
			}
			msg="该用户不存在。";
			return ERROR;
		}
		msg = "不可知错误，请联系管理员。";
		return ERROR;
	}
	
	//如果需要，可增加手机发送和验证
	/**
	 * 加入手机验证码
	 */
	public String sendMoblie(){
		ActionContext context = ActionContext.getContext();
		if (context.getSession().get("_vcode").toString().equalsIgnoreCase(verifycode)) {
			user = accountService.getUserByUsername(username);
			if(user != null && user.getMobile().equalsIgnoreCase(mobile)){
				String passtoken="zj"+StringUtil.createActiveCode();
				user.setPassword(SecurityUtil.getMD5(passtoken));
				if(user.getActivetype() != Constants.USER_ACTIVE_ALL && user.getActivetype() != Constants.USER_ACTIVE_MOBILE){
					user.setActivetype((short)(user.getActivetype() + Constants.USER_ACTIVE_MOBILE));
				}
				if(accountService.updateUser(user)>0){
					mobile=user.getMobile();
					String userGender;
					if(user.getGender()==1){
						userGender="先生";
					}else{
						userGender="女士";
					}
					NtyMessageQueue message = new NtyMessageQueue();
					message.setType(Constants.NTYMESSAGEQUEUE_TYPE_SMS);
					message.setTitle("");
					message.setContent(String.format(PropertiesUtil.getByKey("sms.template.retrievery.pwd"),user.getRealname(),userGender,passtoken));
					message.setReceiver(user.getMobile());
					notifyQueueService.addNewMessage(message);
					msg=SUCCESS;
					return "ajax";
				}
				msg="系统出错";
				return ERROR;
			}
			msg="手机号码错误，请重新输入！";
			return "ajax";
		}
		msg="验证码错误，请重新输入。";
		return "ajax";
	}
	
	/**
	 * 设置新密码  并更新
	 * @return
	 */
	public String resetPwd(){
		if(v!=null){//邮件链接直接点击
			String[] codes = new SecurityUtil().des_decrypt(v).split("\\|");
			user=accountService.getUserByUsername(codes[0]);
			if(user!=null){
				if(user.getPasstoken()!=null){
					if(user.getPasstoken().equalsIgnoreCase(codes[1])){
						user.setPasstoken(null);
						if(StringUtil.validPwd(password)){
							user.setPassword(SecurityUtil.getMD5(password));
							if(user.getActivetype() != Constants.USER_ACTIVE_ALL && user.getActivetype() != Constants.USER_ACTIVE_EMAIL){
								user.setActivetype((short)(user.getActivetype() + Constants.USER_ACTIVE_EMAIL));
							}
//							UsrUser _user=user;
//							ActionContext context = ActionContext.getContext();
							if(codes.length==2 && password!=null && accountService.updateUser(user)>0){
							//	context.getSession().put("_user", _user);
								msg = SUCCESS;
								return "ajax";
							}
							msg="新密码设置失败，请联系管理员。";
							return ERROR;
						}
						msg = "密码输入有误请重新输入！";
						return "ajax";
					}
					msg="验证错误。";
					return "ajax";
				}
				msg="该链接已失效。";
				return "ajax";
			}
			msg="该用户不存在。";
			return "ajax";
		}
		msg = "不可知错误，请联系管理员。";
		return ERROR;
	}
	
	
	//get and set
	public void setV(String v) {
		this.v = v;
	}
	public String getV() {
		return v;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public void setVerifycode(String verifycode) {
		this.verifycode = verifycode;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public void setUser(UsrUser user) {
		this.user = user;
	}
	public void setNotifyQueueService(NotifyQueueService notifyQueueService) {
		this.notifyQueueService = notifyQueueService;
	}
	public String getEmail() {
		return email;
	}

	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getUsername() {
		return username;
	}

	public String getRealname() {
		return realname;
	}

	public Short getGender() {
		return gender;
	}
	
}