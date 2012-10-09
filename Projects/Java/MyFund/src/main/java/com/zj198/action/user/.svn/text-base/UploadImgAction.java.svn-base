package com.zj198.action.user;

import java.io.File;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.zj198.model.UsrOrgAttach;
import com.zj198.model.UsrUser;
import com.zj198.service.user.AccountService;
import com.zj198.service.user.ProfileService;
import com.zj198.util.Constants;
import com.zj198.util.UploadUtil;

/**
 * @author Administrator
 *
 */
public class UploadImgAction extends ActionSupport{
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String msg;
	private int orgType;
	
	private UsrUser usrUser;
	private AccountService accountService;
	private UsrOrgAttach usrOrgAttach;
	private ProfileService profileService;
	private List<UsrOrgAttach> usrOrgAttachList;
	
	/**
	 * 上传图片
	 * @return
	 */
	public String uploadImg(){
		//TODO:img上传图片
		if(upload == null){
			msg = "上传图片不可为空。";
			return "input";
		}
		/**
		 * 类型检查
		 */
		String[] extendStr = {"png","jpg","jpeg","gif"}; 
		String extendName = uploadFileName.substring(uploadFileName.lastIndexOf(".")+1,uploadFileName.length());
		int bool = 0;
		for(String s : extendStr){
			if(extendName.equalsIgnoreCase(s)){
				bool = 1;
				break;
			}
		}
		if(bool == 0){
			msg = "上传图片格式不正确";
			return "input";
		}else{		
			ActionContext ctx = ActionContext.getContext();
			UsrUser user = (UsrUser)ctx.getSession().get("_user");
			usrUser = accountService.getUserById(user.getId());
			String value=UploadUtil.upload(upload, uploadFileName, "avatar",Constants.UPLOAD_PRIVACY_PUBLIC);
			if(usrUser!=null ){
				usrUser.setAvatar(value);
				if(accountService.updateUser(usrUser)>0){
					user.setAvatar(value);
					ctx.getSession().put("_user", user);
					msg="上传成功。";
					return SUCCESS;
				}
			}
		}
		msg="上传失败";
		return SUCCESS;
	}
	
	/**
	 * 上传图片
	 * @return
	 */
	public String inputError(){
		ActionContext ctx = ActionContext.getContext();
		UsrUser user = (UsrUser)ctx.getSession().get("_user");
		usrUser = accountService.getUserById(user.getId());
		msg = "上传图片格式不正确";
		return "msgError";
	}
	/**
	 * 机构上传证件
	 * */
	public String orgUpload(){
		//TODO:img上传图片
		if(upload == null){
			msg = "上传图片不可为空。";
			return SUCCESS;
		}
		/**
		 * 类型检查
		 */
		String[] extendStr = {"png","jpg","jpeg","gif"}; 
		String extendName = uploadFileName.substring(uploadFileName.lastIndexOf(".")+1,uploadFileName.length());
		int bool = 0;
		for(String s : extendStr){
			if(extendName.equalsIgnoreCase(s)){
				bool = 1;
				break;
			}
		}
		if(bool == 0){
			msg = "上传图片格式不正确";
			return "input";
		}else{	
			ActionContext ctx = ActionContext.getContext();
			UsrUser user = (UsrUser)ctx.getSession().get("_user");
			String value=UploadUtil.upload(upload, uploadFileName, "user",Constants.UPLOAD_PRIVACY_PRIVATE);
			String fileName=value.substring(value.lastIndexOf("/")+1);
			if(orgType == Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION){
				usrOrgAttach=profileService.getByUidAttachType(user.getId(), orgType);
				if(usrOrgAttach == null){
					usrOrgAttach=new UsrOrgAttach();
					usrOrgAttach.setOldFileName(uploadFileName);
					usrOrgAttach.setFileName(fileName);
					usrOrgAttach.setFilePath(value);
					usrOrgAttach.setUserId(user.getId());
					usrOrgAttach.setUserType(user.getUserTypeGroup());
					usrOrgAttach.setAttachType(Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION);
					profileService.save(usrOrgAttach);
					msg="1";
					return SUCCESS;
				}else{
					profileService.update(usrOrgAttach);
					usrOrgAttach.setAttachType(Constants.BASEDATA_GROUP_ORG_ATTACH_ORGANIZATION);
					usrOrgAttach.setOldFileName(uploadFileName);
					usrOrgAttach.setFileName(fileName);
					usrOrgAttach.setFilePath(value);
					profileService.save(usrOrgAttach);
					msg="1";
					return SUCCESS;
				}
			}else if(orgType == Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS){
				usrOrgAttach=profileService.getByUidAttachType(user.getId(), orgType);
				if(usrOrgAttach == null){
					usrOrgAttach=new UsrOrgAttach();
					usrOrgAttach.setOldFileName(uploadFileName);
					usrOrgAttach.setFileName(fileName);
					usrOrgAttach.setFilePath(value);
					usrOrgAttach.setUserId(user.getId());
					usrOrgAttach.setUserType(user.getUserTypeGroup());
					usrOrgAttach.setAttachType(Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS);
					profileService.save(usrOrgAttach);
					msg="1";
					return SUCCESS;
				}else{
					profileService.update(usrOrgAttach);
					usrOrgAttach.setAttachType(Constants.BASEDATA_GROUP_ORG_ATTACH_BUSINESS);
					usrOrgAttach.setOldFileName(uploadFileName);
					usrOrgAttach.setFileName(fileName);
					usrOrgAttach.setFilePath(value);
					profileService.save(usrOrgAttach);
					msg="1";
					return SUCCESS;
				}
			}else if(orgType == Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION){
				usrOrgAttach=profileService.getByUidAttachType(user.getId(), orgType);
				if(usrOrgAttach == null){
					usrOrgAttach=new UsrOrgAttach();
					usrOrgAttach.setOldFileName(uploadFileName);
					usrOrgAttach.setFileName(fileName);
					usrOrgAttach.setFilePath(value);
					usrOrgAttach.setUserId(user.getId());
					usrOrgAttach.setUserType(user.getUserTypeGroup());
					usrOrgAttach.setAttachType(Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION);
					profileService.save(usrOrgAttach);
					msg="1";
					return SUCCESS;
				}else{
					profileService.update(usrOrgAttach);
					usrOrgAttach.setAttachType(Constants.BASEDATA_GROUP_ORG_ATTACH_TAXREGISTRATION);
					usrOrgAttach.setOldFileName(uploadFileName);
					usrOrgAttach.setFileName(fileName);
					usrOrgAttach.setFilePath(value);
					profileService.save(usrOrgAttach);
					msg="1";
					return SUCCESS;
				}
			}
			
		}
		msg="上传失败";
		return "input";
	}
	//   get    and  set
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public void setUsrUser(UsrUser usrUser) {
		this.usrUser = usrUser;
	}
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}
	public UsrUser getUsrUser() {
		return usrUser;
	}
	public int getOrgType() {
		return orgType;
	}
	public void setOrgType(int orgType) {
		this.orgType = orgType;
	}
	public void setUsrOrgAttach(UsrOrgAttach usrOrgAttach) {
		this.usrOrgAttach = usrOrgAttach;
	}
	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}
}
