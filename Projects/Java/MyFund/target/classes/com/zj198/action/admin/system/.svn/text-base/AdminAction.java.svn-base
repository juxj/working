package com.zj198.action.admin.system;

import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.zj198.action.BaseAction;
import com.zj198.model.AdmFunction;
import com.zj198.model.AdmUser;
import com.zj198.service.admin.AdminAccountService;
import com.zj198.util.NumberUtil;
import com.zj198.util.SecurityUtil;

public class AdminAction extends BaseAction {
	private Integer adminUid;
	private Long newRights;
	private AdmUser admUser;
	private List<AdmUser> admUserList;
	private List<AdmFunction> functionList;
	private AdminAccountService adminAccountService;
	private String errorMsg;
	
	@Override
	public String execute() throws Exception {
		ActionContext ctx = ActionContext.getContext();
		if(ctx.getSession().get("_functionList")==null){
			AdmUser _admin = (AdmUser)ctx.getSession().get("_admin");
			ctx.getSession().put("_functionList", adminAccountService.findByRights(_admin.getRights()));
		}
		return SUCCESS;
	}

	//获取管理用户列表
	public String listAdmUser(){
		admUserList = adminAccountService.findAllAdminuser();
		return "listAdmUser";
	}
	
	public String bfAddAdmUser(){
		return "addAdmUser";
	}
	
	public String addAdmUser(){
		if(admUser.getPassword().length()<8 || admUser.getUsername().length()<6 || admUser.getUsername().length()>20){
			errorMsg="请按规则填写用户名和密码。";
			return "addAdmUser";
		}
		admUser.setPassword(SecurityUtil.getMD5(admUser.getPassword()));
		int i = adminAccountService.addAdmUser(admUser);
		if(i==-1){
			errorMsg="用户名重复，请更换。";
			return "addAdmUser";
		}else{
			msg="管理员添加成功。";
			return listAdmUser();
		}
	}
	
	//编辑管理用户
	public String editAdmUser(){
		admUser = adminAccountService.getAdmUserById(adminUid);
		return "editAdmUser";
	}
	
	//更新管理用户
	public String updateAdmUser(){
		if((StringUtils.isNotBlank(admUser.getPassword()) && admUser.getPassword().length()<8) || admUser.getUsername().length()<6 || admUser.getUsername().length()>20){
			errorMsg="请按规则填写用户名和密码。";
			return "editAdmUser";
		}
		AdmUser old = adminAccountService.getAdmUserById(admUser.getId());
		if(StringUtils.isNotBlank(admUser.getPassword())){
			old.setPassword(SecurityUtil.getMD5(admUser.getPassword()));
		}
		old.setUsername(admUser.getUsername());
		old.setRealname(admUser.getRealname());
		old.setMobile(admUser.getMobile());
		old.setTelephone(admUser.getTelephone());
		old.setStatus(admUser.getStatus());
		adminAccountService.updateAdmUser(old);
		msg = "更新成功";
		return "editAdmUser";
	}
	
	//编辑权限
	public String editAdmAuth(){
		admUser = adminAccountService.getAdmUserById(adminUid);
		functionList = adminAccountService.findAllMenu();
		Long rights = admUser.getRights();
		for(AdmFunction fun:functionList){
			if(NumberUtil.ifExist(rights, fun.getRights())){
				fun.setIsmenu((short)-1);
			}
		}
		return "editAdmAuth";
	}
	
	//更新权限
	public String updateAdmAuth(){
		admUser = adminAccountService.getAdmUserById(adminUid);
		admUser.setRights(newRights);
		adminAccountService.updateAdmUser(admUser);
		functionList = adminAccountService.findAllMenu();
		Long rights = admUser.getRights();
		for(AdmFunction fun:functionList){
			if(NumberUtil.ifExist(rights, fun.getRights())){
				fun.setIsmenu((short)-1);
			}
		}
		msg="授权成功。";
		return "editAdmAuth";
	}
	
	
	//setter and getter
	public void setAdminAccountService(AdminAccountService adminAccountService) {
		this.adminAccountService = adminAccountService;
	}

	public Long getNewRights() {
		return newRights;
	}

	public void setNewRights(Long newRights) {
		this.newRights = newRights;
	}

	public AdmUser getAdmUser() {
		return admUser;
	}

	public void setAdmUser(AdmUser admUser) {
		this.admUser = admUser;
	}

	public List<AdmUser> getAdmUserList() {
		return admUserList;
	}

	public List<AdmFunction> getFunctionList() {
		return functionList;
	}

	public void setAdminUid(Integer adminUid) {
		this.adminUid = adminUid;
	}

	public String getErrorMsg() {
		return errorMsg;
	}
	

}
